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
<!--부트스트랩  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
	
		<table class="table text-center">
			<thead>
				<tr>
					<th><b>No</b></th>
					<th><b>이름</b></th>
					<th><b>전화번호</b></th>
					<th><b>국적</b></th>
					<th><b>이메일</b></th>
					<th><b>자기소개</b></th> 
				</tr>
			</thead>
			<tbody>
			<c:forEach var="member" items="${members}" varStatus="status" >
				<tr>
					<td>${status.count}</td>
					<td>${member.name}</td>
					<c:choose>
						<c:when test="${fn:startsWith(member.phoneNumber, '010')}">
							<td>${member.phoneNumber}</td>
						</c:when>
						
						<c:otherwise>
							<td>유효하지 않은 전화번호
						</c:otherwise>
					</c:choose>
					<td>
						${fn:replace(member.nationality, '삼국시대', '삼국 -')}
					</td>
					<td>
						<c:set value="${fn:split(member.email, '@')}" var="test" />
						<b>${test[0]}</b>@${test[1]}
					</td>
					<td>
						<c:choose>
							<c:when test="${fn:length(member.introduce) > 15}">
								${fn:substring(member.introduce, 0, 15)} ...
							</c:when>
							<c:otherwise>
								${member.introduce}
							</c:otherwise>
						</c:choose>
						 
					</td>
					
				</tr>
			</c:forEach>
			</tbody>
		
		
		</table>
	
	</div>
</body>
</html>