package com.quiz.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	
	@ResponseBody
	@RequestMapping("/test1")
	public String helloworld() {
		
		return "hello";
	}
	
	
}
