package com.quiz.lesson06final.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06final.model.NewBooking;

@Repository
public interface NewBookingDAO {
	
	
	public Integer insertBooking(NewBooking booking);
	
	
	
	public List<NewBooking> selectBooking();
	
	public Integer deleteBookingById(int id);
	
	public List<NewBooking> selectBookingByNamePhoneNumber(
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
	
}
