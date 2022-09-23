package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz02RestController {

	
	@Autowired
	private RealEstateBO realEstateBo;
	
	//요청 url : http://localhost:8080/lesson03/quiz02/1
	
	@RequestMapping("/lesson03/quiz02/1")
	public String quiz02_1() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		
		int test = realEstateBo.addRealEstate(realEstate);
		return "성공" + test;
		
	}
	
	
	//요청 url : http://localhost/lesson03/quiz02/2?realtor_id=5
	@RequestMapping("/lesson03/quiz02/2")
	public String quiz02_2(
			@RequestParam(value="realtorId") int realtorId
	) {
		int row = realEstateBo.addRealEstateAsField(realtorId,"썅떼빌리버 오피스텔 814호", 45 , "월세", 100000, 120);
		return "성공갯수는?" + row;
	}

}
