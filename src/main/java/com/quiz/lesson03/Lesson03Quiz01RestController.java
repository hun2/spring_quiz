package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.New_ReviewBO;

@RestController 
public class Lesson03Quiz01RestController {

	@Autowired
	private New_ReviewBO new_reviewbo;
	
	//요청 url : http://localhost:8080/lesson03/quiz01
	@RequestMapping("/lesson03/quiz01")
	public New_Review quiz01 () {
		return new_reviewbo.getNew_ReviewById(5);
	}
}
