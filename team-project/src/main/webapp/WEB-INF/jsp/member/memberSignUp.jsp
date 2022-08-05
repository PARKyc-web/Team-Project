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

<!-- 
	 하영씨 주신 파일에는 스크립트 밖에 없는데... 
	 윗 부분이 필요없는건지 아니면 실수로 날린건지 잘 모르겠어서
	 우선 살려뒀는데 혹시 필요없으면 삭제하시면 될 것 같습니다!
 -->
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
</body>
</html>
