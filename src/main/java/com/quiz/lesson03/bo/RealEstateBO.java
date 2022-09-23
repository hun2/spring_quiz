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
	
	
	public int addRealEstate(RealEstate realEstate) {
		return realEstateDao.insertRealEstate(realEstate);
	}
	
	
	public int addRealEstateAsField(int realtorId, String address, int area, String type, int price, Integer rentPrice) {
		return realEstateDao.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
	}
	
	
	// quiz 업데이트
	
	public int updateRealestateById(int id, String type, int price) {
		
		return realEstateDao.updateRealestateById(id, type, price);
	}
	
}
