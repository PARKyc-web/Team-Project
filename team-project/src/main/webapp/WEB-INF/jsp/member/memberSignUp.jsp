<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
</head>
<body>
<div id="width" style="margin:0px auto; padding:50px; text-align:center">
<form action="memberSignUp.do" method="post">
아이디 <input type="text" name="member_id"><br><br>
비밀번호 <input type="password" name="member_password"><br><br>
<!--이름 <input type="text" name="name"><br><br>
나이	<input type="text" name="age"><br><br>
전화번호 <input type="text" name="phone"><br><br>
이메일 <input type="email" name="email"><br><br>  -->
회원유형 <input type="radio" name="member_type" value="0" checked>user
<input type="radio" name="member_type" value="1">host <br><br>
	<a href="index.jsp"><input type="submit" value="가입"></a> <input type="reset" value="취소">
</form>
</div>
</body>
</html>
