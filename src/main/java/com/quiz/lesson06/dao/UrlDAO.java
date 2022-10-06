package com.quiz.lesson06.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Url;

@Repository
public interface UrlDAO {

	// insert
	public void insertUrl(
			@Param("name") String name, 
			@Param("url") String url) ;
	
	//select
	
	public List<Url> selectUrl();
	
	
	
	//select 
	
	public Boolean existUrlByUrl(String url);
	
	
	//delete
	public void deleteUrlById(int id);
	
	
}
