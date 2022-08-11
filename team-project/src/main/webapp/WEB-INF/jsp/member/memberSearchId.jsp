<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		overflow-x:hidden;
		overflow-y:hidden;
	}
	#container{
		padding:10%;
	}
	h3{
		padding:5%;
	}
	.input-style{
	  width:50%;
	  padding:15px;
	  font-size:15px;
	  font-weight:bold;
	  border:3px solid #fc777b;
	  background-color: #fffff;
	  border-radius:90px;
	  text-align:center;
	  box-shadow: 1px 1px 2px #e6e6e6;
	}
</style>
</head>
<body>


<div id ="container">

		<form id="check" name="login" action="memberRealSearchId.do" method="post" style="margin:0px auto; text-align:center">
				<h3>아이디 찾기</h3>
				<input class="input-style" type="text" id="email" name="email" placeholder="이메일을 입력하세요"><br><br>
				
				<button type="submit" class="submit" onclick="location.href='memberRealSearchId.do'">검색</button> 
				
		</form>
		</div>
</body>
</html>