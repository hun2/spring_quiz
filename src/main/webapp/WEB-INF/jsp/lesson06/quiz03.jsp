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
</head>
<body>
	<div class="container">
		
		<jsp:include page="header.jsp"></jsp:include>
		
		<section>
		
			<div class="mainimg">
				<img src="/img/test06_banner1.jpg" width="1110px" height="400px" id="mainimg">
			
			</div>
		
			<div class="mainbottom d-flex">
				<div class="bottom1">
					실시간<br>
					예약하기
				</div>
				<div class="bottom2">
					<span class="mt-3 ml-2">예약확인</span> <br>
					이름 : <input type="text" id="name"> <br>
					전화번호 : <input type="text" id="phoneNumber" maxlength='13'>
					<button class="btn btn-success "id="check">조회</button>
				</div>
				<div class="bottom3">
					예약문의: <br>
					010- <br>
					0000-1111
				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
</body>
<script type="text/javascript">
	
	function location_click(result){
		location.href = result;
	}
	
	//핸드폰번호 넣을때 자동 하이픈 추가
	$(document).on("keyup", "#phoneNumber", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	});
	
	//인터벌
	$(document).ready(function(){
		
		
		var imgList = ["/img/test06_banner1.jpg", "/img/test06_banner2.jpg", "/img/test06_banner3.jpg", "/img/test06_banner4.jpg"];
		var num = 0;
		var changeImg = function(){
			
			$("#mainimg").attr("src" , imgList[num]);
			num ++;
			if (num == 3) {
				num = 0;
			}
		}
		
		setInterval(changeImg, "3000");
		
	})
	
	
	//예약확인 버튼 클릭시 함수출력
	$("#check").on("click", function(){
		var name = $("#name").val().trim();
		var phoneNumber = $("#phoneNumber").val().trim();
		//유효성검사
		if (name == "") {
			alert("name error");
			$("#name").focus();
			return false;
		}
		if (phoneNumber == "") {
			alert("phoneNumber error");
			$("#phoneNumber").focus();
			return false;
		}
		$.ajax({
			type : "GET"
			, url : "/lesson06final/lastquiz/check"
			, data : {"name" : name, "phoneNumber" : phoneNumber}
			, success : function(data) {
				//리턴값이 하나라도 있다는건 결국 예약했다는 증거
				//리턴 리스트가 비었다는건 결국 예약증거가 없음.
				if(data.result == "") {
					alert("예약을 하지 않으셨습니다.");
					location.reload();
				} else {
					
					//데이트 데이터를 자바스크립트로 가지고오면 이상하게 변함
					//자바스크립트에서 가져온 값을 잘라서 앞에만 쓰기
					var time = data.result[0].date;
					var sliceTime = time.substr(0,10);
					console.log(sliceTime);
					alert("이름 :"  + data.result[0].name + "\n" + "날짜 :" + sliceTime + "\n" +  "일수 :" + data.result[0].day + "\n" + "인원 :" + data.result[0].headcount + "\n" + "상태 :" + data.result[0].state);
				}
			}
			, error : function() {
				alert("error");
			}
		})
	})
</script>
</html>