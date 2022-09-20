package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02Controller {
	
	//@ResponseBody + return String => response String 으로 내려줌
	//@ResponseBody + return map or list or class => response json 으로 내려줌.
	
	
	
	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_1() {
		List<Map<String, Object>> list = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		
		list.add(map);
		
		Map<String, Object> map1 = new HashMap<>();
		map1.put("rate", 0);
		map1.put("director", "로베르토 베니니");
		map1.put("time", 116);
		map1.put("title", "인생은 아름다워");
		list.add(map1);
		
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("rate", 12);
		map2.put("director", "크리스토퍼 놀란");
		map2.put("time", 147);
		map2.put("title", "인셉션");
		list.add(map2);
		
		Map<String, Object> map3 = new HashMap<>();
		map3.put("rate", 19);
		map3.put("director", "윤종빈");
		map3.put("time", 133);
		map3.put("title", "범죄와의 전쟁 : 나쁜놈들의 전성시대");
		list.add(map3);
		
		Map<String, Object> map4 = new HashMap<>();
		map4.put("rate", 15);
		map4.put("director", "프란시스 로렌스");
		map4.put("time", 137);
		map4.put("title", "헝거게임");
		list.add(map4);
		
		
		return list;
		
		
	}
	
	
	
	@RequestMapping("/2")
	public List<Quiz02> quiz02_2 (){
		
		List<Quiz02> list = new ArrayList<>();
		
		Quiz02 quiz02 = new Quiz02();
		quiz02.setTitle("안녕하세요 가입인사 드립니다");
		quiz02.setUser("haqulu");
		quiz02.setContent("안녕하세요 가입했어요 앞으로 잘 부탁 드랍니다.");
		
		list.add(quiz02);
		
		Quiz02 quiz03 = new Quiz02();
		quiz03.setTitle("헐 대박");
		quiz03.setUser("bada");
		quiz03.setContent("오늘 목요일이였어,,,금요일인줄");
		list.add(quiz03);
		
		Quiz02 quiz04 =  new Quiz02();
		quiz04.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		quiz04.setUser("dulumary");
		quiz04.setContent("....");
		list.add(quiz04);
		return list;
		
	}
	
	
	
	@RequestMapping("/3")
	public ResponseEntity<Quiz02> quiz02_3(){
		Quiz02 quiz02 = new Quiz02();
		quiz02.setTitle("안녕하세요 가입인사 드립니다");
		quiz02.setUser("haqulu");
		quiz02.setContent("안녕하세요 가입했어요 앞으로 잘 부탁 드랍니다.");
		
		return new ResponseEntity<>(quiz02, HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
}
