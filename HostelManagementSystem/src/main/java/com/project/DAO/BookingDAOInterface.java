package com.project.DAO;

import java.util.List;

import com.project.model.Booking;

public interface BookingDAOInterface {
    boolean bookHostel(Booking booking);
    List<Booking> getUserBookings(int userId);
    List<Booking> getBookingsByOwner(int ownerId);
    public List<Booking> getAllBookings(int bookingId);
}
