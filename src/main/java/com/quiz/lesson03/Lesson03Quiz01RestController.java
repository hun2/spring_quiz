package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.New_ReviewBO;
import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.New_Review;
import com.quiz.lesson03.model.RealEstate;

@RestController 
public class Lesson03Quiz01RestController {

	@Autowired
	private New_ReviewBO new_reviewbo;
	
	//요청 url : http://localhost:8080/lesson03/quiz01
	@RequestMapping("/lesson03/quiz01")
	public New_Review quiz01 () {
		return new_reviewbo.getNew_ReviewById(5);
	}
	
	
	
	
	
	
	//문제 1번 
	//요청 url : http://localhost/lesson03/quiz01/1?id=20
	
	@Autowired
	private RealEstateBO realEstatebo;
	
	
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01_1(
		@RequestParam(value = "id") int id
	){
		
		return realEstatebo.getRealEstateById(id);
		
	}
	
	
	//문제 2번
	//요청 url : http://localhost/lesson03/quiz01/2?rent_price=90
	
	@RequestMapping("/lesson03/quiz01/2")
	public List<RealEstate> quiz01_2(
			@RequestParam(value="rentPrice", required = false) Integer rentPrice
	) {
		
		return realEstatebo.getRealEstateByRentPrice(rentPrice);
	}
	
	
	//문제 3번
	//요청 url : http://localhost/lesson03/quiz01/3?area=90&price=130000
	
	@RequestMapping("/lesson03/quiz01/3")
	
	public List<RealEstate> quiz01_3(
		@RequestParam(value="area") int area ,
		@RequestParam(value="price") int price
	) {
		return realEstatebo.getRealEstateByAreaPrice(area, price);
	}
	
	
}
