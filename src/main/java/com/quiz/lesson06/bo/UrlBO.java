package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.UrlDAO;
import com.quiz.lesson06.model.Url;

@Service
public class UrlBO {

	
	@Autowired
	private UrlDAO urlDao;
	
	//insert
	public void addUrl(String name, String url) {
		
		urlDao.insertUrl(name, url);
		
	}
	
	
	//select
	public List<Url> getUrl(){
		
		
		return urlDao.selectUrl();
	}
}
