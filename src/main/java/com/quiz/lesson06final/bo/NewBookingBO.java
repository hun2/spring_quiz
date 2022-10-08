package com.quiz.lesson06final.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06final.dao.NewBookingDAO;
import com.quiz.lesson06final.model.NewBooking;

@Service
public class NewBookingBO {

	@Autowired
	private NewBookingDAO newBookingDao;
	
	//insert
	public Integer addBooking(NewBooking booking) {
		
		
		return newBookingDao.insertBooking(booking);
	}
	
	//select
	public List<NewBooking> getBooking() {
		
		return newBookingDao.selectBooking();
	}
	
	//delete
	
	public Integer deleteBookingById(int id)  {
		
		return newBookingDao.deleteBookingById(id);
		
	}
	
	
	//select
	public List<NewBooking> getBookingByNamePhoneNumber(String name, String phoneNumber) {
		
		return newBookingDao.selectBookingByNamePhoneNumber(name, phoneNumber);
	}
}
