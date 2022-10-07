package com.quiz.lesson06final;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LastQuizController {

	
	
	
	
	@RequestMapping("/lesson6final/lastquiz/show")
	public String quiz03() {
		
		
		return "/lesson06/quiz03";
	}
}
