package com.quiz.lesson04.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Seller;

@Repository
public interface SellerDAO {

	public void addSeller(
			@Param("nickname") String nickname,
			@Param("profileImageUrl") String profileImageUrl, 
			@Param("temperature") String temperature);
	
	
	//전체 db 셀렉
	public List<Seller> selectSeller();
	
	
	//id 파라미터 db 셀렉
	
	public Seller selectSellerId(int id);
	
}
