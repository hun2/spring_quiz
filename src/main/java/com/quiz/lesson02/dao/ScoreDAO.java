package com.quiz.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Score;

@Repository
public interface ScoreDAO {

	
	public List<Score> selectScoreList();
	
	
	
}
