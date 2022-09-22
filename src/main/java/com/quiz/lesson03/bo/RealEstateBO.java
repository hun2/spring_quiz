package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDao;
	
	
	public RealEstate getRealEstateById(int id) {
		return realEstateDao.selectRealEstateById(id);
	}
	
	
	
	
	public List<RealEstate> getRealEstateByRentPrice(int rentPrice) {
		return realEstateDao.selectRealEstateByRentPrice(rentPrice) ;
	}
	
	
	public List<RealEstate> getRealEstateByAreaPrice(int area, int price) {
		
		return realEstateDao.selectRealEstateByAreaPrice(area, price);
	}
}
