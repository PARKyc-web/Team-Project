<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	#container{
	display:flex;
	flex-wrap:wrap;
	    width: 1200px;
        background-color: rgba( 255, 255, 255, 0.95 );
        margin: 0 auto;
        margin-top:3%;
        margin-bottom:4%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
}
</style>
</head>
<body>
	<div id="container">
		<form>
			아이디 <input type="text" name="member_id"><br><br>
			비밀번호 <input type="password" name="member_password"><br><br>
			<a href="index.jsp"><input type="submit" value="로그인"></a> <input type="reset" value="취소">
			<p><button id="searchId" onclick="location.href='memberIdSearch.do'" value="아이디 찾기"></button></p>
		</form>
	</div>
</body>
</html>