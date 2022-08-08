<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
</head>
<body>
<script type="text/javascript">

		
	function idCheck(){
		console.log(document.querySelector("#member_id").value)
		
		fetch("idCheck.do", document.querySelector("#member_id").value)
		  .then((response) => console.log("response:", response))
		  .catch((error) => console.log("error:", error));
		
	}	

	function formCheck(){
		if(check.member_id.value == ""){
			alert("아이디를 입력하세요");
			login.member_id.focus();
			return false;
		}
		
		if(check.member_password.value==""){
			alert("비밀번호를 입력하세요");
			login.member_password.focus();
			return false;
		}
		
		if(check.member_password2.value==""){
			alert("비밀번호를 재확인해주세요");
			login.member_password.focus();
			return false;
		}
		
		if(check.member_password.value != check.member_password2.value){
			alert("비밀번호가 일치하지 않습니다");
			login.member_password.focus();
			return false;
		}
		
		if(check.member_password.length<8 || check.member_password.length>15){
			alert("비밀번호는 8~15자리로 입력해주세요");
			login.member_password.focus();
			return false;
		}
		
		check.submit();
		}
		
		
	
</script>
<form action="memberSignUp.do" id="check" method="post" style="margin:0px auto; padding:50px; text-align:center">
<h3>회원가입</h3>
<ul>
	<li>아이디* <input type="text" id="member_id" name="member_id">&nbsp;
		<input type="button" id="id_check" name="id_check" value="중복확인" onclick="idCheck()"><br><br>
	</li>
	<li>비밀번호* <input type="password" name="member_password"><br><br></li>
	<li>비밀번호 재확인* <input type="password" name="member_password2"><br><br></li>
	<li><hr></li>
	<li>이름 <input type="text" id="member_name" name="member_name"><br><br></li>
	<li>나이	<input type="text" id="member_age" name="member_age"><br><br></li>
	<li>전화번호* <input type="text" id="phone" name="phone"><br><br></li>
	<li>이메일* <input type="email" id="email" name="email"><br><br></li>
	<li>회원유형* <input type="radio" id="member_type" name="member_type" value="0" checked>user
		<input type="radio" id="member_type" name="member_type" value="1">host <br><br>
	</li>
	<li><input type="button" value="가입" onclick="formCheck()"><input type="reset" value="취소">
</ul>
<br><br><a href="memberJoin.do">뒤로가기</a>
</form>
</body>
</html>