package com.quiz.lesson04;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@Controller
public class Lesson04Quiz04Controller {

	//요청 url : http://localhost:8080/lesson04/quiz01/1
	// 메인 틀 
	@GetMapping("/lesson04/quiz01/1")
	public String addSellerView() {
		
		return "lesson04/add_seller";
	}
	
	
	@Autowired
	private SellerBO sellerBo;
	
	// insert db 
	//요청 url : http://localhost/lesson04/quiz01/add_seller     
	// post 방식이라 get이아니라서 url 직접바로 접근 불가능.
	@PostMapping("/lesson04/quiz01/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl,
			@RequestParam("temperature") double temperature
			) {
		
		sellerBo.addSeller(nickname, profileImageUrl, temperature);
		return "lesson04/after_add_seller";
		
	}
	
	
	
	// select db
	//요청 url : http://localhost/lesson04/quiz01/seller_info
	@GetMapping("/lesson04/quiz01/seller_info")
	public String getSeller(Model model) {
		
		// db select
		List<Seller> seller = sellerBo.getSeller();
		
		//model 에 담기.
		model.addAttribute("seller", seller);
		return "lesson04/get_seller";
	}
	
	// select 파라미터값
	
	
	@RequestMapping(value = "/lesson04/quiz01/seller_info" , params="id")
	public String getSeller( @RequestParam("id") int id, Model model
			) {
		Seller result = sellerBo.getSellerId(id);
		List<Seller> result2 = new ArrayList<>();
		result2.add(result);
		model.addAttribute("seller", result2);
		return "lesson04/get_seller";
	}
	
	
	
}
