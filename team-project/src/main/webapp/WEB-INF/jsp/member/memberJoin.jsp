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
	background-image: url('image/bg.jpg');
	background-repeat: no-repeat;
  	background-position: center;
  	background-size: cover;
}
#form-style{
margin: 0 auto; 
text-align:center; 
padding:150px;
}
h3{
	color:#616060;
	font-weight:bold;
}

#join{
 color:#fff;	
 font-size:25px;
 font-weight:100;
}
#forms{
margin:0 auto;
width:60%;
background-color: rgba( 255, 255, 255, 0.95 );
padding:10%;
border-radius:20px;
}
.signin-button {
  width:60%;
  padding:20px;
  color: #fff;
  font-size:20px;
  font-weight:bold;
  border:none;
  background-color: #fc777b;
  border-radius:90px;

}
  .signin-button:hover {
    color: #fff;
    font-weight:bold;
    background-color: #FF5A5F;
    border:none;
    }
    
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div id="container">
	<form id="form-style">
		<p id="join">JOIN AirBnB</p><br><br>
		<div id="forms">
		<h3>로그인 / 회원가입</h3><br>
		<div class="join-group">
			<a href="memberSignInForm.do"><input class="signin-button" type="button" name="login" value="로 그 인"></a><br><br>
			<a href="memberSignUpForm.do"><input class="signin-button" type="button" name="signup" value="회 원 가 입"></a><br>
		</div>
		</div>
	</form>	
	</div>
</body>
</html>