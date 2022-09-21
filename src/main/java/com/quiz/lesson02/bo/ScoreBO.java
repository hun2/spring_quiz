package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.ScoreDAO;
import com.quiz.lesson02.model.Score;



@Service
public class ScoreBO {

	@Autowired
	private ScoreDAO scoreDao;
	
	
	public List<Score> getScoreList(){
		
		return scoreDao.selectScoreList();
	}
		
}
