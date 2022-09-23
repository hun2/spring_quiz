package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class Lesson03Quiz03RestController {

	@Autowired
	private RealEstateBO realEstateBo;
	
	//요청 url : http://localhost/lesson03/quiz03/1?id=8&...
	
	@RequestMapping("/lesson03/quiz03/1")
	public String quiz03( @RequestParam("id") int id, @RequestParam("type")String type, @RequestParam("price")int price) {
		
		int row = realEstateBo.updateRealestateById(id, type, price);
		return "업데이트 완료 갯수 :" + row;
	}
}
