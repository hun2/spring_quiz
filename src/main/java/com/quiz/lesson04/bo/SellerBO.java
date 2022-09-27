package com.quiz.lesson04.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerDAO;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {
	
	
	@Autowired
	private SellerDAO sellerDao;
	
	
	//post
	public void addSeller(String nickname, String profileImageUrl, String temperature) {
	
		sellerDao.addSeller(nickname, profileImageUrl, temperature);
	}
	
	
	//insert
	
	public List<Seller> getSeller(){
		
		return sellerDao.selectSeller();
	}
	
	//id 파라미터 
	public Seller getSellerId(int id){
		
		return sellerDao.selectSellerId(id);
	}

	
	
}
