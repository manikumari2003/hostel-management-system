package com.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.model.Hostel;
import com.project.utility.DBConnection;

public class HostelDAO implements HostelDAOInterface {

    // CREATE
    @Override
    public boolean addHostel(Hostel hostel) {
        String sql = "INSERT INTO hostels (owner_id, hostel_name, location, address, hostel_type, price, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, hostel.getOwnerId());
            ps.setString(2, hostel.getHostelName());
            ps.setString(3, hostel.getLocation());
            ps.setString(4, hostel.getAddress());
            ps.setString(5, hostel.getHostelType());
            ps.setDouble(6, hostel.getPrice());
            ps.setString(7, hostel.getStatus());
            ps.setTimestamp(8, hostel.getCreatedAt()); // <-- include createdAt when adding

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // READ by ID
    @Override
    public Hostel getHostelById(int hostelId) {
        String sql = "SELECT * FROM hostels WHERE hostel_id = ?";
        Hostel hostel = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, hostelId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                hostel = mapResultSetToHostel(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hostel;
    }

    // READ ALL
    @Override
    public List<Hostel> getAllHostels() {
        List<Hostel> list = new ArrayList<>();
        String sql = "SELECT * FROM hostels";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSetToHostel(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // READ by OWNER
    @Override
    public List<Hostel> getHostelsByOwner(int ownerId) {
        List<Hostel> list = new ArrayList<>();
        String sql = "SELECT * FROM hostels WHERE owner_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, ownerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapResultSetToHostel(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // UPDATE
    @Override
    public boolean updateHostel(Hostel hostel) {
        String sql = "UPDATE hostels SET hostel_name=?, location=?, address=?, hostel_type=?, price=?, status=? WHERE hostel_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, hostel.getHostelName());
            ps.setString(2, hostel.getLocation());
            ps.setString(3, hostel.getAddress());
            ps.setString(4, hostel.getHostelType());
            ps.setDouble(5, hostel.getPrice());
            ps.setString(6, hostel.getStatus());
            ps.setInt(7, hostel.getHostelId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // DELETE
    @Override
    public boolean deleteHostel(int hostelId) {
        String sql = "DELETE FROM hostels WHERE hostel_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, hostelId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // APPROVED HOSTELS
    @Override
    public List<Hostel> getApprovedHostels() {
        List<Hostel> list = new ArrayList<>();
        String sql = "SELECT * FROM hostels WHERE status = 'APPROVED'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSetToHostel(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // PENDING HOSTELS
    @Override
    public List<Hostel> getPendingHostels() {
        List<Hostel> list = new ArrayList<>();
        String sql = "SELECT * FROM hostels WHERE status = 'PENDING'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSetToHostel(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // HELPER METHOD: map ResultSet to Hostel
    private Hostel mapResultSetToHostel(ResultSet rs) throws SQLException {
        Hostel hostel = new Hostel();
        hostel.setHostelId(rs.getInt("hostel_id"));
        hostel.setOwnerId(rs.getInt("owner_id"));
        hostel.setHostelName(rs.getString("hostel_name"));
        hostel.setLocation(rs.getString("location"));
        hostel.setAddress(rs.getString("address"));
        hostel.setHostelType(rs.getString("hostel_type"));
        hostel.setPrice(rs.getDouble("price"));
        hostel.setStatus(rs.getString("status"));
        hostel.setCreatedAt(rs.getTimestamp("created_at")); // <-- added here
        return hostel;
    }

    // UPDATE HOSTEL STATUS
    public boolean updateHostelStatus(int hostelId, String status) {
        String sql = "UPDATE hostels SET status=? WHERE hostel_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, hostelId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
 // SEARCH APPROVED HOSTELS BY NAME OR LOCATION
    public List<Hostel> searchApprovedHostels(String keyword) {
        List<Hostel> list = new ArrayList<>();
        String sql = "SELECT * FROM hostels " +
                     "WHERE status = 'APPROVED' " +
                     "AND (hostel_name LIKE ? OR location LIKE ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            String searchValue = "%" + keyword + "%";
            ps.setString(1, searchValue);
            ps.setString(2, searchValue);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToHostel(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}