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
	<form action = "./myReviewSend.do" method = "post">
		내용 : <input type="text" name="contents"><br>
		별점 : <input type="number" step="0.1" max="5.0" min ="0.0" name="rate"><br>
		<input type="hidden" name="hotelId" value="${reservation.hotelId}">
		<input type="hidden" name="memberId" value="${reservation.memberId}">
		<input type="hidden" name="hotelName" value="${reservation.hotelName}">
		<input type="submit" value="작성완료">
	</form>
</body>
</html>