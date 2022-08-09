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
}

#container {
	margin: 0 auto;
	text-align: center;
	background-image: url('image/bg.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
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
	width: 60%;
	background-color: rgba(255, 255, 255, 0.5);
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
					<c:when test="${result eq 1 }">
						<h3>������ ���������� �Ϸ�Ǿ����ϴ�.</h3>
						<br>
					</c:when>
					<c:otherwise>
						<h3>���࿡ �����Ͽ����ϴ�. �ٽ� �õ����ּ���.</h3>
						<br>
					</c:otherwise>
				</c:choose>
				<div class="join-group">
					<a href="main.do"><input class="signin-button" type="button"
						value="�������� ���ư���"></a><br>
					<br> <a href="myReservation.do"><input
						class="signin-button" type="button" value="���� ���� Ȯ���ϱ�"></a><br>
				</div>
			</div>
		</form>
	</div>

</body>
</html>