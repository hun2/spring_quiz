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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	

</head>
<body>

<h1>즐겨찾기 목록</h1>
<table class="table">
	<thead>
		<tr>
			<th><b>No.</b></th>
			<th><b>이름</b></th>
			<th><b>주소</b></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${url}" var="urls">
			<tr>
				<td>${urls.id }</td>
				<td>${urls.name}</td>
				<td>${urls.url}</td>
				<td><button class="delete btn btn-danger" data-id="${urls.id}">삭제</button>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>

<script>
	

	$(".delete").on("click", function(e){
		
		var id_check = $(this).data("id");
		
		$.ajax({
			
			type : "GET"
			// delete 로 보내면 됨.
			, url : "/lesson06/quiz01/delete"
			, data : {"id" : id_check}
		
		
			,success : function(data) {
				if (data.deleteId == "1") {
					location.href ="/lesson06/quiz01_go";
					//그자리에서 스크롤 안내려가고 리로딩 하는법
					// location.reload(true)
					
				} else {
					alert("성공은 했는데 실패요")
				}
			}
			, error : function(e) {
				
				alert ("에러");
			}
			
		})
		
		
	})
	
	


</script>


</html>