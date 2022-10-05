package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.UrlBO;
import com.quiz.lesson06.model.Url;

@Controller
public class Lesson06Controller {

	@Autowired
	private UrlBO urlBo;
	
	@RequestMapping("/lesson06/quiz01")
	public String quiz01() {
		
		return "lesson06/quiz01";
	}

	@ResponseBody    // ajax호출은 반드시 responsebody 가 필수 ★
	@PostMapping("/lesson6/quiz01_add")
	public String quiz01_add(
			@RequestParam("name") String name, 
			@RequestParam("url") String url) {
		
		
		urlBo.addUrl(name, url);
		return "성공";    //js  data값
	}
	
	
	@RequestMapping("/lesson06/quiz01_go")
	public String quiz01_view(Model model) {
		
		//select 
		List<Url> url = urlBo.getUrl();
		
		
		model.addAttribute("url", url);
		return "lesson06/quiz01_view";
	}


}
