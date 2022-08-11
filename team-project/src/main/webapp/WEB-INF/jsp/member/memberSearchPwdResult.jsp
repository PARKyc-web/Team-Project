<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
		hr{
		margin: 0 auto;
		text-align:center;
		width:70%;
	}
	#result{
		text-align:center;
		margin: 0 auto;
		padding-top:15%;
		font-size:20px;
	}
	#big{
		font-weight:bold;
		font-size:25px;
	}
	.submit{
	border: 1px solid #e6e6e6;
	padding:1.5%;
	background-color: #fc777b;
	color: #fff;
	box-shadow: 1px 1px 2px #f0f0f0;
	border-radius:5px;
}
.submit:hover{
	background-color:#fc6d71;
}
	
	
</style>
</head>
<body>
<div id ="container">

		<form id="check" name="login" action="memberRealSearchPwd.do" method="post" style="margin:0px auto; text-align:center">
				<h3>비밀번호 찾기</h3>
				<input class="input-style" type="text" id="member_id" name="member_id" placeholder="아이디를 입력하세요"><br><br>
				<input class="input-style" type="email" id="email" name="email" placeholder="이메일을 입력하세요"><br><br>
				
				<button type="submit" class="submit" onclick="location.href='memberRealSearchPwd.do'">검색</button> 
				
		</form>
		</div>
<c:if test="${vo eq null }">
	<hr>
	<div id="result">
	<span class="material-symbols-outlined">sentiment_very_dissatisfied</span>
	<h3>해당 정보로 검색된<br>비밀번호가 없습니다.</h3>
	</div>
</c:if>

<c:if test="${vo ne null }">
	<hr>
    <div id="result">회원님의 비밀번호는 <br><span id="big">${vo.memberPassword}</span><br>입니다.</div>
</c:if>
		
		
</body>
</html>