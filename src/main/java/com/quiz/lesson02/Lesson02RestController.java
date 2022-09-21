package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.ScoreBO;
import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Score;

@RestController
public class Lesson02RestController {

	
	//순번 18, service 객체 소환 ( 의존성 주입)
	@Autowired
	private StoreBO storeBO;
	
	//순번 1, 맵핑을 먼저 한다. 
	//순번 2, 객체를 생성한다. 어떤 리턴타입으로 할지 메서드명 등.
	//순번 3, 컨트롤러에서 => 서비스로 디비 내노라고 요청함
	//순번 4, 우리는 서비스를 만들러 간다.
	
	@RequestMapping("/lesson02/quiz01")
	public List<com.quiz.lesson02.model.Store> quiz01(){
		//순번 19service 의 메소드 ( 즉 레파지토리의 메소드) 를 리턴~        
		List<com.quiz.lesson02.model.Store> storeList = storeBO.getStoreList();
		return storeList;          //객체 => json 으로.
	}
	
	
	@Autowired
	private ScoreBO scoreBo;
	
	
	@RequestMapping("/lesson02/test01")
	public List<Score> test01 (){
		
		List<Score> scoreList =  scoreBo.getScoreList();
		return scoreList;
	}
	
	
}
