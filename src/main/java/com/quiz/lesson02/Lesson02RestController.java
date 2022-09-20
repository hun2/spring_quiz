package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;

@RestController
public class Lesson02RestController {

	@Autowired
	private StoreBO storeBO;
	
	@RequestMapping("/lesson02/quiz01")
	public List<com.quiz.lesson02.model.Store> quiz01(){
		
		List<com.quiz.lesson02.model.Store> storeList = storeBO.getStoreList();
		return storeList;
	}
}
