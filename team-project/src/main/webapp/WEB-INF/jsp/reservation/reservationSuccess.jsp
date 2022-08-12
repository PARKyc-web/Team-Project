<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap')
	;

body {
	font-family: 'Noto Sans KR', sans-serif;
	background-image:url('image/bg2.jpg');
		background-repeat: no-repeat;
  		background-position: center;
  		background-size: cover;
}

#container {
    width: 70%;
        background-color: rgba( 255, 255, 255, 0.8 );
        margin: 0 auto;
        margin-top:4%;
        margin-bottom:4%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
}

#form-style {
	margin: 0 auto;
	text-align: center;
	padding: 150px;
}

h3 {
	color: #616060;
	font-weight: bold;
}

#join {
	color: #fff;
	font-size: 25px;
	font-weight: 100;
}

#forms {
	margin: 0 auto;
	width: 80%;
	padding: 10%;
	border-radius: 20px;
}

.signin-button {
	width: 80%;
	padding: 20px;
	color: #fff;
	font-size: 20px;
	font-weight: bold;
	border: none;
	background-color: #fc777b;
	border-radius: 90px;
}

.signin-button:hover {
	color: #fff;
	font-weight: bold;
	background-color: #FF5A5F;
	border: none;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<div id="container">
		<form id="form-style">
			<div id="forms">
				<c:choose>
					<c:when test="${success eq 1 }">
						<h3>예약이 성공적으로 완료되었습니다.</h3>
						<br>
					</c:when>
					<c:otherwise>
						<h3>예약에 실패하였습니다. 다시 시도해주세요.</h3>
						<br>
					</c:otherwise>
				</c:choose>
				<div class="join-group">
					<a href="main.do"><input class="signin-button" type="button"
						value="메인으로 돌아가기"></a><br>
					<br> <a href="myReservation.do"><input
						class="signin-button" type="button" value="예약 내역 확인하기"></a><br>
				</div>
			</div>
		</form>
	</div>

</body>
</html>