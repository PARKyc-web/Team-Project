<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원정보 수정결과(myPageModiOutput.jsp)</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h3>${member.memberId }님의 정보가 수정되었습니다.</h3>
	<jsp:include page = "myHome.jsp"></jsp:include>
</body>
</html>