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
	background-image:url('image/bg2.jpg');
		background-repeat: no-repeat;
  		background-position: center;
  		background-size: cover;
}
#container{
	display:flex;
	flex-wrap:wrap;
	    width: 1200px;
        background-color: rgba( 255, 255, 255, 0.95 );
        margin: 0 auto;
        margin-top:5%;
        margin-bottom:7%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
}
.left{
width:50%;
flex-direction : row;
/*background-image: url('image/bg2.jpg');*/
background-repeat: no-repeat;
background-position: center top;
background-size : cover;
}
.right{
width:50%;
flex-direction : row;
padding-top:13%;
padding-bottom:13%;
}

h3{
	color:#616060;
	font-weight:bold;
	margin:20px;
	padding:3%;
}
#forms{
margin:0 auto;
width:60%;
background-color:rgba(255,255,255,0.5);
padding:3%;
border-radius:20px;
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

.submit {
  width:25%;
  padding:15px;
  color: #fff;
  font-size:15px;
  font-weight:bold;
  border:none;
  background-color: #fc777b;
  border-radius:90px 0px 0px 90px;
}
.submit:hover{
 background-color:#fa5055;
}


.submit-r {
  width:25%;
  padding:15px;
  color: #fff;
  font-size:15px;
  font-weight:bold;
  border:none;
  background-color: #fc777b;
  border-radius:0px 90px 90px 0px;
}

.submit-r:hover{
background-color:#fa5055;
}
h6{
	padding:5%;
	color: #707070;
}
a:hover{
 color:red;
}

</style>
</head>
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script>
       $(document).ready(function(){ 
      
    var numberOfImages=8; 
      
    var imageNum = Math.round(Math.random()*(numberOfImages-1))+1;
     
    var imgPath=('./image/ran_'+imageNum+'.jpg');
   
    $('.left').css('background-image', ('url("'+imgPath+'")'));
     
    });
  </script>

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
		<div class="left"></div>
		<div class="right">
		<form id="check" name="login" action="memberSignIn.do" method="post" style="margin:0px auto; text-align:center">
				<h3>로그인</h3>
				<input class="input-style" type="text" id="member_id" name="member_id" placeholder="아이디를 입력하세요"><br><br>
				<input class="input-style" type="password" id="member_password" name="member_password" placeholder="비밀번호를 입력하세요"><br><br>
				
				<button type="submit" class="submit" onclick="formCheck()">로그인</button> 
				<button type="button" class="submit-r" onclick="location.href='memberSignUpForm.do'">회원가입</button>
				<br><h6><a style="cursor:pointer" onclick="searchId()">아이디</a> · <a style="cursor:pointer" onclick="searchPwd()">비밀번호</a> 찾기</h6>
		</form>
		</div>
	</div>
	<script>
		function searchId(){
			window.open("memberSearchId.do", "PopupWin",'width=500, height=600, left=500, top=250')
		}
		
		function searchPwd(){
			window.open("memberSearchPwd.do", "PopupWin",'width=500, height=600, left=700, top=250')
		}
	
		
	</script>
</body>
</html>