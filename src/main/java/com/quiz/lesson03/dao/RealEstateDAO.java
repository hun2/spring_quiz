package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	public RealEstate selectRealEstateById(int id);
	
	
	public List<RealEstate> selectRealEstateByRentPrice(int rentPrice);
	
	
	// @Param 은 하나의 Map을 만들어준다
	// @Param 은 repository DAO에서만 사용
	// @Param("rentPrice") int rentPrice 이런식으로 넣어주면 됨.
	
	
	
	public List<RealEstate> selectRealEstateByAreaPrice(
			@Param("area") int area ,
			@Param("price") int price
	);
	
	public int insertRealEstate(RealEstate realEstate);
	
	
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId,
			@Param("address") String address,
			@Param("area") int area, 
			@Param("type") String type, 
			@Param("price") int price, 
			@Param("price") Integer rentPrice);
	
	
	
	public int updateRealestateById(
			@Param("id") int id,
			@Param("type") String type, 
			@Param("price") int price);
}
