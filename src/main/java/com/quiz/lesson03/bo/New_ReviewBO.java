package com.quiz.lesson03.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.New_Review;
import com.quiz.lesson03.dao.New_ReviewDAO;

@Service
public class New_ReviewBO {
	
	@Autowired
	private New_ReviewDAO new_reviewdao;
	
	public New_Review getNew_ReviewById(int id) {
		return new_reviewdao.selectNew_ReviewById(id);
	}
}
