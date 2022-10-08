<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/lesson06/quiz03.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

function location_click(result){
	
	location.href = result;
	
}
</script>
</head>
<body>
	<div class="container">
		
		<jsp:include page="header.jsp"></jsp:include>
		
		<section>
			<h3 class="mt-3">예약하기</h3>
			<div class="form-group">
				<div>이름</div>
				<input type="text" class="form-control col-3" id="name">
				<div>예약날짜</div>
				<input type="text" class="form-control col-3" id="date">
				<div>숙박일수</div>
				<input type="number" class="form-control col-3" id="day">
				<div>숙박인원</div>
				<input type="number" class="form-control col-3" id="headcount">
				<div>전화번호</div>
				<input type="text" class="form-control col-3" id="phoneNumber" maxlength='13'>
				<button class="btn btn-success" id="reservationBtn">예약하기</button>
			
			</div>
			
		</section>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
<script>
	
	
	
	//전화번호 13자리 - 포함 유효성검사
	$(document).on("keyup", "#phoneNumber", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		
	});
	
	
	$(document).ready(function(){
		
		//날짜 datepicker 적용
		$("#date").datepicker ({
			
			//오늘기점으로 과거불가
			minDate: 0,
			//달 넘기기
			changeMonth : true,
			//년도 넘기기
			changeYear : true,
			//날짜형식
			dateFormat : "yy-mm-dd",			
		})
	
		
		$("#reservationBtn").on("click",function(){
			

			var name = $("#name").val().trim();
			var date = $("#date").val();
			var day = $("#day").val().trim();
			var headcount = $("#headcount").val().trim();
			var phoneNumber = $("#phoneNumber").val().trim();
			
			//이름 길이 및 유효성검사
			if (name.length <2 || name.length >12 || name =="" ) {
				alert("이름을 다시 입력하세요");
				$("#name").focus();
				return false;
			}
			
			//이름 숫자 체크
			var namereg = /^[가-힣]{2,4}$/;
			if (!namereg.test(name)) {
				alert("이름을 다시 입력하세요");
				$("#name").focus();
				return false;
			}
			
			//숙박일수 체크 (input type이 number라 글자는 검사 안해도 됨.)
			if (day <=0 || day == "") {
				alert("날짜를 다시 입력하세요. 1일이상");
				$("#day").focus();
				return false;
			}			
			
			
			//숙박인원 체크 (input type이 number라 글자는 검사 안해도 됨.)
			if (headcount <= 0 || headcount == "") {
				
				alert("숙박 인원을 다시 입력하세요. 1명이상");
				$("#headcount").focus();
				return false;
			}
			
			if (phoneNumber == "") {
				alert("전화번호를 다시 입력하세요.");
				$("#phoneNumber").focus();
				return false;
			}
			
			
			
			$.ajax({
			
				
				type : "POST"
				, url : "/lesson06final/lastquiz/reservation_add"
				, data : {name, date, day, headcount, phoneNumber}
				,success : function(data) {
						
					if (data.booking == 1) {
					
						location.href = "/lesson06final/lastquiz/reservation";
					}
						
				}	
				,error : function(e) {
					
					alert("실패");
				}
				
			})
			
			
			
			
			
			
			
			
		}) 
	})
	
	
	

</script>
</html>