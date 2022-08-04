<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignIn&Up</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap');
body{
font-family: 'Noto Sans KR', sans-serif;
}
#container{
	margin:0 auto;
	text-align:center;
	background-image: url(images/bg.jpg);
}
#join{
 font-size:18px;
 font-weight:100;
}
#form-style{
margin: 0 auto; 
text-align:center; 
padding:150px;
}
.signin-button {
  width:280px;
  padding:20px;
  color: #fff;
  font-weight:bold;
  borer:none;
  background-color: #ffbdbd;
  border-radius:90px;
}
  .signin-button:hover {
    color: #fff;
    font-weight:bold;
    background-color: #f57d7d;
    border:none;
    }
    
</style>
</head>
<body>
	<div id="container">
	<form id="form-style">
		<p id="join">JOIN AirBnB</p><br><br>
		<h3>로그인 / 회원가입</h3><br>
		<div class="join-group">
			<a href="memberSignInForm.do"><input class="signin-button" type="button" name="login" value="로그인"></a><br><br>
			<a href="memberSignUpForm.do"><input class="signin-button" type="button" name="signup" value="회원가입"></a><br>
		</div>
	</form>	
	</div>
</body>
</html>