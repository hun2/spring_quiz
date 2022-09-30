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
		<section class="section col-10">
			<h1>과거 날씨</h1>
			<table class="table text-center">
				<thead>
					<tr>
						<th>날짜</th>
						<th>날씨</th>
						<th>기온</th>
						<th>강수량</th>
						<th>미세먼지</th>
						<th>풍속</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="realweather" items="${weather}"> 
						<tr>
							<td>
								<fmt:formatDate value="${realweather.date}" pattern="yyyy년 MM월 dd일"/>  
							</td>
							<td>
								<c:choose>
									<c:when test="${realweather.weather == '비' }">
										<img src="/img/rainy.jpg">
									</c:when>
									<c:when test="${realweather.weather == '흐림' }">
										<img src="/img/cloudy.jpg">
									</c:when>
									<c:when test="${realweather.weather == '맑음' }">
										<img src="/img/sunny.jpg">
									</c:when>
									<c:when test="${realweather.weather == '구름조금' }">
										<img src="/img/partlyCloudy.jpg">
									</c:when>
								</c:choose>
							</td>
							<td>
								${realweather.temperatures}						
							</td>
							<td>
								${realweather.precipitation}
							</td>
							<td>
								${realweather.microDust}
							</td>
							<td>
								${realweather.windSpeed}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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