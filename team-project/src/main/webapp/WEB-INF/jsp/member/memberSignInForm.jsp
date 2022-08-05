<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap');
body{
font-family: 'Noto Sans KR', sans-serif;
}
#container{
	margin:0 auto;
	text-align:center;
	background-image: url('image/bg.jpg');
	background-repeat: no-repeat;
  	background-position: center;
  	background-size: cover;
  	padding: 10%;
}
.form-style{
margin: 0 auto; 
text-align:center; 
padding:150px;
}
h3{
	color:#616060;
	font-weight:bold;
	margin:20px;
}

#forms{
margin:0 auto;
width:60%;
background-color:rgba(255,255,255,0.5);
padding:10%;
border-radius:20px;
}
.input-style{
width:30%;
  padding:15px;
  font-size:15px;
  font-weight:bold;
  border:3px solid #fc777b;
  background-color: #fffff;
  border-radius:90px;
  text-align:center;

}

.submit {
  width:7%;
  padding:5px;
  color: #fff;
  font-size:10px;
  font-weight:bold;
  border:none;
  background-color: #fc777b;
  border-radius:90px;
}

</style>
</head>
<script type="text/javascript">
	function formCheck(){
		if(check.member_id.value == ""){
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
	<div id ="container">
		<form id="check" name="login" action="memberSignIn.do" method="post" style="margin:0px auto; padding:20px; text-align:center">
				<h3>로그인</h3>
				<input class="input-style" type="text" id="member_id" name="member_id" placeholder="아이디를 입력하세요"><br><br>
				<input class="input-style" type="password" id="member_password" name="member_password" placeholder="비밀번호를 입력하세요"><br><br>
				
				<button class="submit" type="submit" onclick="formCheck()">로그인</button> 
				<button class="submit" type="reset">취소</button>
				<br><br><p><a href="memberJoin.do">뒤로가기</a></p>
		</form>
	</div>
</body>
</html>