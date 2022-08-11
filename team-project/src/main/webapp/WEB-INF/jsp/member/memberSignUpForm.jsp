<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap');
body{
color:#616060;
font-family: 'Noto Sans KR', sans-serif;
	/*background-image:url('image/bg.jpg');*/
		background-repeat: no-repeat;
  		background-position: center;
  		background-size: cover;
}
h3{
padding:20px;
font-weight:bold;
}

#container{
	display:flex;
	flex-wrap:wrap;
	width: 70%;
    background-color: rgba( 255, 255, 255, 0.95 );
    margin: 0 auto;
    margin-top:5%;
	margin-bottom:4%;
	border: 1px solid #f2f2f2;
   	border-radius:10px;
	box-shadow: 1px 1px 2px #f0f0f0;
	padding:2%;
}
.left{
	width:50%;
	flex-direction : row;
	background-image: url('image/bg2.jpg');
	background-repeat: no-repeat;
	background-position: center top;
	background-size : cover;
}
.right{
	width:50%;
	flex-direction : row;
}
#submit{
	border: 1px solid #e6e6e6;
	padding:1.5%;
	background-color: #fc777b;
	color: #fff;
	box-shadow: 1px 1px 2px #f0f0f0;
	border-radius:5px;
}
#submit:hover{
	background-color:#fc6d71;
}
#out{
	border: 1px solid #e6e6e6;
	padding:1.5%;
	background-color: #9c9c9c;
	color: #fff;
	box-shadow: 1px 1px 2px #f0f0f0;
	border-radius:5px;
}
#bold{
	font-weight:bold;
	padding-right:3px;
}
input[type="text"],[type="password"],[type="email"]{
	margin-left:10%;
	border:none;
	padding:10px;
	background-color:transparent;
	box-shadow: 1px 1px 5px #e6e6e6;
	border-radius: 90px;
	border:3px solid transparent;
	outline:none;
}
input[type="text"]:hover,[type="password"]:hover,[type="email"]:hover{
	border:3px solid #fc777b;
}

input[type="text"]:active,[type="password"]:active,[type="email"]:active{
	border:3px solid #fc777b;
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
  background-color: #c4c4c4;
  border-radius:0px 90px 90px 0px;
}

#user{
	padding-top:10px;
	padding-bottom:30px;
}
a{
text-decoration:none;
color: #707070;
}

</style>
</head>
<body>
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script>
       $(document).ready(function(){ 
      
    var numberOfImages=8; 
      
    var imageNum = Math.round(Math.random()*(numberOfImages-1))+1;
     
    var imgPath=('./image/ran_'+imageNum+'.jpg');
   
    $('.left').css('background-image', ('url("'+imgPath+'")'));
     
    });
       
       $(document).ready(function(){ 
 	      
   	    var numberOfImages=2; 
   	      
   	    var imageNum = Math.round(Math.random()*(numberOfImages-1))+1;
   	     
   	    var imgPath=('./image/bg'+imageNum+'.jpg');
   	   
   	    $('body').css('background-image', ('url("'+imgPath+'")'));
   	     
   	    });      
  </script>
<script type="text/javascript">
$(function () {
	$('#member_id').change(function () {
		$('#idCheck').val('unChecked');
	});

	//idCheck 버튼을 클릭했을 때 
	$("#member_id").focusout(function () {
		var userId = $("#member_id").val();
		console.log(userId)

		$.ajax({
			type: 'POST',
			data: {
				id: userId //여기이해해라..
			},
			url: "memberIdCheck.do", //별도 서블릿으로 만들었다. *.do에서 제외(컨트롤러 안탐)
			success: function (data) {
				if (data == "no") {
					//alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					//$("#member_id").val("");
					$("#member_id").focus();
					document.getElementById("idMsg").style.color = 'red';
			        document.getElementById('idMsg').innerText = '이미 존재하는 아이디입니다';
				} else if (data == "") {
					$("#member_id").focus();
					document.getElementById("idMsg").style.color = 'red';
			        document.getElementById('idMsg').innerText = '아이디를 입력하세요';
				} else {
					//alert("사용가능한 아이디입니다.");
					$("#idCheck").val("checked");
					$("#member_password").focus();
					document.getElementById("idMsg").style.color = '#0015d1';
			        document.getElementById('idMsg').innerText = '사용 가능한 아이디입니다';
				}
			},
			error: function (error) {
				alert("error : " + error);
			}
		});
	});
});
</script>
<script>
	function formCheck(){
		
		if(member_password.value == ""){
			alert("비밀번호를 입력하세요");
			login.member_password.focus();
			return false;
		}
		
		if(check.member_id.value == ""){
			alert("아이디를 입력하세요");
			login.member_id.focus();
			return false;
		}
		console.log(check.idCheck.value);
		
		if (check.idCheck.value == "unChecked") {
			alert("아이디 중복체크를 하세요.");
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
		
		if(check.member_name.value==""){
			alert("이름을 입력하세요");
			login.member_password.focus();
			return false;
		}
		
		if(check.member_age.value==""){
			alert("나이를 입력하세요");
			login.member_password.focus();
			return false;
		}
		
		if(check.phone.value==""){
			alert("전화번호를 입력하세요");
			login.member_password.focus();
			return false;
		}
		
		if(check.email.value==""){
			alert("이메일을 입력하세요");
			login.member_password.focus();
			return false;
		}
		
		
		check.submit();
		}
	
</script>
<div id="container">
<div class="left"></div>
<div class="right">
<form action="memberSignUp.do" id="check" method="post" style="margin:0px auto; padding:50px; text-align:center">
<h3>회원가입</h3>
	<div id="user">
	<span id="bold">회원유형  </span>
		<input type="radio" id="member_type" name="member_type" value="0" checked><label for="member_type"> 일반회원 </label>
		<input type="radio" id="member_type2" name="member_type" value="1"><label for="member_type2"> 호스트 <br></label>
		</div>
	<div id="idMsg"></div>
	<span id="bold">아이디 </span><input type="text" id="member_id" name="member_id">&nbsp;
		<input type="hidden" id="idCheck" name="idCheck" value="unChecked" placeholder="id를 입력하세요"></input><br><br>
		<div id="idMsg"></div>
	
	<span id="bold">비밀번호  </span><input type="password" name="member_password" id="member_password" minlength="8" maxlength="15" required><br><br>
	<span id="bold">비밀번호 재확인  </span><input type="password" name="member_password2" id="member_password2" minlength="8" maxlength="15" required><br><br>
	<hr>
	<span id="bold">이름  </span><input type="text" id="member_name" name="member_name"><br><br>
	<span id="bold">나이	 </span><input type="text" id="member_age" name="member_age"><br><br>
	<span id="bold">전화번호  </span><input type="text" id="phone" name="phone"><br><br>
	<span id="bold">이메일  </span><input type="email" id="email" name="email"><br><br>
	<br><br><input type="button" class="submit" value="가입" onclick="formCheck()">&nbsp;<input type="reset" class="submit-r" value="취소">
	
<br><br><a href="memberSignInForm.do">뒤로가기</a>
</form>
</div>
</div>
</body>
</html>