package com.project.DAO;

import java.util.List;

import com.project.model.Hostel;

public interface HostelDAOInterface {

    boolean addHostel(Hostel hostel);

    Hostel getHostelById(int hostelId);

    List<Hostel> getAllHostels();

    List<Hostel> getHostelsByOwner(int ownerId);

    boolean updateHostel(Hostel hostel);

    boolean deleteHostel(int hostelId);
    List<Hostel> getApprovedHostels(); 
    public List<Hostel> getPendingHostels() ;
   
    
}