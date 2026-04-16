package com.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.model.Booking;
import com.project.utility.DBConnection;

public class BookingDAO {

	Connection con;

	
	public boolean bookHostel(Booking booking) {

		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			int roomId = getRoomIdByHostel(booking.getHostelId());

			String sql = "INSERT INTO bookings(user_id,hostel_id,room_id,status) VALUES(?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, booking.getUserId());
			ps.setInt(2, booking.getHostelId());
			ps.setInt(3, roomId);
			ps.setString(4, "PENDING");

			status = ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	
	public List<Booking> getUserBookings(int userId) {

		List<Booking> list = new ArrayList<>();

		try {
			con = DBConnection.getConnection();

			String sql = """
					    SELECT h.hostel_name, h.location, b.booking_date, b.status
					    FROM bookings b
					    JOIN hostels h ON b.hostel_id = h.hostel_id
					    WHERE b.user_id = ?
					    ORDER BY b.booking_date DESC
					""";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Booking b = new Booking();
				b.setHostelName(rs.getString("hostel_name"));
				b.setLocation(rs.getString("location"));
				b.setBookingDate(rs.getDate("booking_date").toLocalDate());
				b.setStatus(rs.getString("status"));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
	public List<Booking> getBookingsByOwner(int ownerId) {

		List<Booking> list = new ArrayList<>();

		try {
			con = DBConnection.getConnection();

			String sql = """
					    SELECT b.booking_id, b.user_id, b.room_id,
					           h.hostel_name, b.booking_date, b.status
					    FROM bookings b
					    JOIN hostels h ON b.hostel_id = h.hostel_id
					    WHERE h.owner_id = ?
					    ORDER BY b.booking_date DESC
					""";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, ownerId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Booking b = new Booking();
				b.setBookingId(rs.getInt("booking_id"));
				b.setUserId(rs.getInt("user_id"));
				b.setRoomId(rs.getInt("room_id"));
				b.setHostelName(rs.getString("hostel_name"));
				b.setBookingDate(rs.getDate("booking_date").toLocalDate());
				b.setStatus(rs.getString("status"));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Booking> getAllBookings() {
		List<Booking> bookings = new ArrayList<>();
		String sql = "SELECT b.booking_id, u.name AS user_name, h.hostel_name, b.status " + "FROM bookings b "
				+ "JOIN users u ON b.user_id = u.user_id " + "JOIN hostels h ON b.hostel_id = h.hostel_id";

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Booking b = new Booking();
				b.setBookingId(rs.getInt("booking_id"));
				b.setUserName(rs.getString("user_name")); // You need to add userName field in Booking model
				b.setHostelName(rs.getString("hostel_name"));
				b.setStatus(rs.getString("status"));
				bookings.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bookings;
	}

	public int getRoomIdByHostel(int hostelId) {

		int roomId = 0;

		try {
			Connection con = DBConnection.getConnection();
			String sql = "SELECT room_id FROM rooms WHERE hostel_id=? LIMIT 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, hostelId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				roomId = rs.getInt("room_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return roomId;
	}

	public void updateStatus(int bookingId, String status) {

		try {

			Connection con = DBConnection.getConnection();

			String sql = "UPDATE bookings SET status=? WHERE booking_id=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, status);
			ps.setInt(2, bookingId);

			ps.executeUpdate();

			
			if ("CONFIRMED".equals(status)) {

				String roomSql = """
						UPDATE rooms
						SET available_beds = available_beds - 1
						WHERE room_id = (
						    SELECT room_id FROM bookings WHERE booking_id=?
						)
						""";

				PreparedStatement ps2 = con.prepareStatement(roomSql);
				ps2.setInt(1, bookingId);
				ps2.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void cancelBooking(int bookingId) {

		String sql = "UPDATE bookings SET status='CANCELLED' WHERE booking_id=?";

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bookingId);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}