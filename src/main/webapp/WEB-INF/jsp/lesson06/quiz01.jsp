<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>즐겨찾기 추가하기</h1>
	제목
	<input type="text" class="form-control col-5" placeholder="이름" name="name" id="name">
	주소
	<div class="d-flex">
		<input type="text" class="form-control col-5" placeholder="url" name="url" id="url">
		<input type="button" class="btn btn-info" value="중복확인" id="check">
	</div>
	<button class="btn btn-success col-5 mt-3" id="button">추가</button>
	 
	
</body>


<script type="text/javascript">
	
	
	$("#check").on("click", function(e){
	
		
		
		//유효성 검사
		var url = $("#url").val();
		if (url == "") {
			alert("url을 확인하셍");
		}
		
		$.ajax({
			
			//request 
			type : "GET"
			, url : "/lesson06/quiz01/get_url"
			, data : {"url" : url}
		
			
			//response
			
			,success : function(data) {
				if (data.isDuplication) {
					alert("중복");
				} else  {
					alert("중복아님");
				}
			}
			
			, error :  function(e) {
				
				
			}
		})
		
		
	})
	



	$('#button').on('click', function(e){
		
		const name =  $('#name').val();
		const url = $('#url').val();
		
		if (name  == '') {
			alert("이름을 입력하세요");
			$('#name').focus();
			return false;
		}
		
		if (url == '') {
			alert("url을 입력하세요");
			$('#url').focus();
			return false;
		}
		
		if (url.startsWith("http") == false && url.startsWith("https") == false) {
			alert("주소 형식이 잘못되었습니다.");
			$('#url').focus();
			return false;
		}
		
		$.ajax({
			//request 구역
			type : "POST"
			,url : "/lesson6/quiz01_add"
			, data : {"name" : name, "url" : url }
			
			// -----------------------------------------------------
			//response 구역
			//여기 밑에서 data는 controller의 return 값임. ★위에 data랑 절대 햇갈리지 말기★
			//url 로 post => controller 에서 해당 url 맵핑된거 내용 처리 후 return 값처리
			// 그 리턴값 ( = data가 ) 성공일때 밑에 if문타고 error일땐 에러쪽을 타게 됨.
			,success : function(data){
				if (data =="성공") {
					alert("성공");
					location.href ="/lesson06/quiz01_go"
				} else {
					alert("입력실패");
				}
			}
			, error : function(e) {
				alert ("문제");
			}
			
			
		});
		
		
		
		
		
		
	})



</script>
</html>