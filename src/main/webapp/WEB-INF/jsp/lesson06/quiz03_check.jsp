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
			<h3 class="mt-3">예약목록보기</h3>
			<div class="table">
				<table>
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th>삭제</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${bookingList}" var="bookingLists">
							<tr>
								<td>${bookingLists.name }</td>
								<td><fmt:formatDate value="${bookingLists.date}" pattern="yyyy년 MM월 dd일"/></td>
								<td>${bookingLists.headcount}</td>
								<td>${bookingLists.day} </td>
								<td>${bookingLists.phoneNumber} </td>
								<td>
									<c:choose>
										<c:when test="${bookingLists.state eq '대기중'}">
											<span class="text-info">${bookingLists.state}</span>
										</c:when>
										<c:when test="${bookingLists.state eq '확정'}">
											<span class="text-success">${bookingLists.state}</span>
										</c:when>
										<c:when test="${bookingLists.state eq '취소'}">
											<span class="text-danger">${bookingLists.state}</span>
										</c:when>
									</c:choose>
								</td>
								<td><input type="button" data-id="${bookingLists.id}" class="delete btn btn-danger" value="삭제"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
		</section>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
<script>


	$(".delete").on("click", function(e){
		
		var id_check = $(this).data("id");
		
		$.ajax({
			
			
			type : "DELETE"
			, url : "/lesson06final/lastquiz/reserver_delete"
			, data : {"id" : id_check}
			,success : function(data) {
				
				if (data.delete == 1) {
					
					location.reload();
				}
				
			}
			,error : function(e) {
				alert("에러");
			}
		})
		
	})
	
	
	
</script>
</html>