package com.quiz.lesson06final;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06final.bo.NewBookingBO;
import com.quiz.lesson06final.model.NewBooking;

@Controller
public class LastQuizController {

	@Autowired
	private NewBookingBO newBookingBo;
	
	
	
	@RequestMapping("/lesson6final/lastquiz/show")
	public String quiz03() {
		
		
		return "/lesson06/quiz03";
	}
	
	
	
	@RequestMapping("/lesson06final/lastquiz/reservation")
	public String quiz03_reservation() {
		
		
		return "lesson06/quiz03_reservation";
	}
	
	
	//예약 요청
	@ResponseBody
	@PostMapping("/lesson06final/lastquiz/reservation_add")
	public Map<String, Integer> quiz03_reservation_add(NewBooking booking) {
		Integer result =  newBookingBo.addBooking(booking);
		Map<String, Integer> booked = new HashMap<>();
		booked.put("booking", result);
		return booked;
	}
		
	//예약확인
	@GetMapping("/lesson06final/lastquiz/reservation_check")
	public String quiz03_reservation_check(Model model) {
		
		
		//db select
		List<NewBooking> booking =  newBookingBo.getBooking();
		model.addAttribute("bookingList", booking);
		return "lesson06/quiz03_check";
		
	}
		
	
	//삭제
	@ResponseBody
	@DeleteMapping("/lesson06final/lastquiz/reserver_delete")
	public Map<String, Integer> quiz03_reservation_delect(@RequestParam("id")int id){
		
		Map<String,Integer> result = new HashMap<>();
		Integer delete = newBookingBo.deleteBookingById(id);
		result.put("delete", delete);
		return result;
	}
	
	
	@ResponseBody
	@GetMapping("/lesson06final/lastquiz/check")
	public Map<String, List<NewBooking> > quiz03_check(@RequestParam("name")String name, @RequestParam("phoneNumber") String phoneNumber ){
		
		NewBooking newbooking = new NewBooking();
		Map<String, List<NewBooking>> check = new HashMap<>();
		List<NewBooking> result = newBookingBo.getBookingByNamePhoneNumber(name, phoneNumber);
		
		check.put("result", result);
		
		return check;
		
	}
	
}
