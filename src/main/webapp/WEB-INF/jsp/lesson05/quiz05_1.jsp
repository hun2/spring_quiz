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
<link rel="stylesheet" type="text/css" href="/css/lesson05/quiz05.css">
<!--부트스트랩  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
		
		function test(result){
			
			location.href = result;
			
		}
	
	
	
	
</script>

</head>
<body>
	<div class="body d-flex">
	
		<header class="header col-2">
			<div class="mt-3">
				<img src="/img/logo.jpg" width="300px" height="60px">
			</div>
			<div class="menu" onclick="test('/lesson05/quiz05')">
				<b>날씨</b>
			</div>
			<div class="menu" onclick="test('/lesson05/quiz05_1')">
				<b>날씨입력</b>
			</div>
			<div class="menu">
				<b>테마날씨</b>
			</div>
			<div class="menu">
				<b>관측기후</b>
			</div>
			
		</header>
		<section class="section col-10 ">
			<h1>날씨 입력</h1>
			<form action="" method="post"> 
				<div class="d-flex form-group container">
					<label for="date">날짜</label>
					<input type="text" class="form-control col-2 mr-5" id="date" name="date" placeholder="yyyy-mm-dd">
					<label for="weather">날씨</label>
					<select class="form-control col-2 mr-5" name="weather" id="weather">
						<option value="맑음">맑음</option>
						<option value="비">비</option>
						<option value="흐림">흐림</option>
						<option value="맑음">구름조금</option>
					</select>
					<label for="microDust">미세먼지</label>
					<select class="form-control col-2 mr-5" name="microDust" id="microDust">
						<option value="좋음">좋음</option>
						<option value="좋음">보통</option>
						<option value="좋음">나쁨</option>
						<option value="좋음">최악</option>
					</select>
				</div>
				<div>
					
				
				</div>
			</form>
		</section>
	</div>
	<footer class="d-flex">
		<div class="col-2 mr-5">
			<img src="/img/logo.jpg" width="300px" height="60px">
		</div>
		<div class="col-10">
			<span>(07062) 서울시 동작구 여의대방로16길 61</span><br>
			<span>Copyright ©2022 KMA. All Right RESERVED</span>
		</div>
	</footer>
	

		
</body>
</html>