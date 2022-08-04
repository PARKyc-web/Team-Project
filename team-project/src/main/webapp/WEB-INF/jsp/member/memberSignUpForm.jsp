<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<script>
	function Idcheck(){
		if (${member.memberId}.value == )
		
	}
	
	function Pwcheck(){
		if(${member.memberPassword}.length < 8 || ${member.memberPassword}.length > 15){
			alert("")
		}
	}
</script>
</head>
<body>
<form action="memberSignUp.do" method="post" style="margin:0px auto; padding:50px; text-align:center">
<h3>회원가입</h3>

아이디 <input type="text" id="member_id" name="member_id">&nbsp;
<input type="button" id="id_check" name="id_check" value="중복확인"><br><br>
비밀번호 <input type="password" name="member_password"><br><br>
<hr>
이름 <input type="text" id="member_name" name="member_name"><br><br>
나이	<input type="text" id="member_age" name="member_age"><br><br>
전화번호 <input type="text" id="phone" name="phone"><br><br>
이메일 <input type="email" id="email" name="email"><br><br>
회원유형 <input type="radio" id="member_type" name="member_type" value="0" checked>user
<input type="radio" id="member_type" name="member_type" value="1">host <br><br>
	<input type="button" value="가입" onclick="location.href='memberSignUp.jsp'"><input type="reset" value="취소">
<br><br><a href="memberJoin.do">뒤로가기</a>
</form>
</body>
</html>