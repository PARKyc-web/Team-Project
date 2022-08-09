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
font-family: 'Noto Sans KR', sans-serif;
}
h3{
padding:20px;
}

.container{
	display:flex;
	flex-wrap:wrap;
}
.left{
width:50%;
flex-direction : row;
background-image: url('image/bg2.jpg');
}
.right{
width:50%;
flex-direction : row;
}

</style>
</head>
<body>
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
				} else {
					//alert("사용가능한 아이디입니다.");
					$("#idCheck").val("checked");
					$("#member_password").focus();
					document.getElementById("idMsg").style.color = 'blue';
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
		if(check.member_id.value == ""){
			alert("아이디를 입력하세요");
			login.member_id.focus();
			return false;
		}
		
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
		
		check.submit();
		}
	
</script>
<div class="container">
<div class="left">dd</div>
<div class="right">
<form action="memberSignUp.do" id="check" method="post" style="margin:0px auto; padding:50px; text-align:center">
<h3>회원가입</h3>

	<div id="idMsg"></div>
	아이디* <input type="text" id="member_id" name="member_id">&nbsp;
		<!-- <button type="button" id="idCheck" name="idCheck" value="unChecked">중복체크</button> --><br><br>
		<div id="idMsg"></div>
	
	비밀번호* <input type="password" name="member_password"><br><br>
	비밀번호 재확인* <input type="password" name="member_password2"><br><br>
	<hr>
	이름 <input type="text" id="member_name" name="member_name"><br><br>
	나이	<input type="text" id="member_age" name="member_age"><br><br>
	전화번호* <input type="text" id="phone" name="phone"><br><br>
	이메일* <input type="email" id="email" name="email"><br><br>
	회원유형* 
		<div class="select">
		<input type="radio" id="member_type" name="member_type" value="0" checked><label for=member_type">user</label>
		<input type="radio" id="member_type2" name="member_type" value="1"><label for="member_type2">host <br><br></label>
		</div>
	<input type="button" value="가입" onclick="formCheck()">&nbsp;<input type="reset" value="취소">
	
<br><br><a href="memberJoin.do">뒤로가기</a>
</form>
</div>
</div>
</body>
</html>