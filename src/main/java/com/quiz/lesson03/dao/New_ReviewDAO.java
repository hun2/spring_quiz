package com.quiz.lesson03.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.New_Review;

@Repository
public interface New_ReviewDAO {

	public New_Review selectNew_ReviewById(int id);
}
