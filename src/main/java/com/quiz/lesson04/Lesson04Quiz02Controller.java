package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@Controller
public class Lesson04Quiz02Controller {

	//요청 url : http://localhost:8080/lesson04/quiz02/1
	@RequestMapping("/lesson04/quiz02/1")
	public String quiz02() {
		
		return "lesson04/add_realtor";
	}
	
	@Autowired
	private RealtorBO realtorBo;
	
	//post (객체에 담아서 보내는 방법)
	//요청 url : http://localhost:8080/lesson04/quiz02/add_realtor
	@PostMapping("/lesson04/quiz02/add_realtor")
	public String quiz02_1(
			Realtor realtor , Model model
			) {
		
		
		//insert db
		realtorBo.addRealtor(realtor);
		
		//select db
		Realtor result = realtorBo.getRealtorById(realtor.getId());
		
		//model 담기
		
		model.addAttribute("realtor", result);
		
		//return 
		
		return "/lesson04/after_add_realtor";
		
	}
	
}
