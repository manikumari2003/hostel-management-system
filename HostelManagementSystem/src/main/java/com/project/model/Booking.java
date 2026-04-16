package com.project.model;

import java.time.LocalDate;

public class Booking {

	private int bookingId;
	private int userId;
	private int hostelId;
	private LocalDate bookingDate;
	private int roomId;
	private String status;
	private String hostelName;
	private String location;
	private String userName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Booking() {
	}

	public Booking(int bookingId, int userId, int hostelId, LocalDate bookingDate, int roomId, String status,
			String hostelName, String location) {
		super();
		this.bookingId = bookingId;
		this.userId = userId;
		this.hostelId = hostelId;
		this.bookingDate = bookingDate;
		this.roomId = roomId;
		this.status = status;
		this.hostelName = hostelName;
		this.location = location;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getHostelId() {
		return hostelId;
	}

	public void setHostelId(int hostelId) {
		this.hostelId = hostelId;
	}

	public LocalDate getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(LocalDate bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getHostelName() {
		return hostelName;
	}

	public void setHostelName(String hostelName) {
		this.hostelName = hostelName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
