<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<script type="text/javascript">
	function formCheck(){
		if(login.member_id.value == ""){
			alert("아이디를 입력하세요");
			login.member_id.focus();
			return false;
		}
		
		if(login.member_password.value==""){
			alert("비밀번호를 입력하세요");
			login.member_password.focus();
			return false;
		}
		
		login.submit();
	}
</script>
<body>
	<form id="login" name="login" action="memberSignIn.do" method="post" style="margin:0px auto; padding:20px; text-align:center">
		<h3>로그인</h3>
		아이디 <input type="text" id="member_id" name="member_id"><br><br>
		비밀번호 <input type="password" id="member_password" name="member_password"><br><br>
		
		<button type="submit" onclick="formCheck()">로그인</button> 
		<button type="reset">취소</button>
		<p><a href="memberJoin.do">뒤로가기</a></p>
	</form>
</body>
</html>