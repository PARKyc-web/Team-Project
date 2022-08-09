<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container{
width: 800px;
margin: 0 auto;
padding: 10%;
text-align: center;
}
</style>
</head>
<body>
<div id="container">
<h3>정말 AirBnB에서 탈퇴하시겠습니까?</h3>
<form action="myMemberDelete.do">
<input type="submit" value="네">&nbsp;<button type="button" onclick="location.href='myPageMain.do'">아니오</button>
</form>
</div>
</body>
</html>