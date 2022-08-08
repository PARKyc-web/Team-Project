<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
</head>
<body>
	<h3>리뷰작성</h3>
	<!-- .do를 실행하는 파일은 무조건 FrontController를 실행하도록 web.xml에 써놓았음 -->
	<form action = "../myReviewSend.do" method = "post">
		내용 :<input type="text" name="contents"><br>
		별점 :<input type="number" name="rate"><br>
		<input type="submit" value="완료">
	</form>
</body>
</html>