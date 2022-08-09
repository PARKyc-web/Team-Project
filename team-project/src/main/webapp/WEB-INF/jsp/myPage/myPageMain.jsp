<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
h3{
	text-align:center;

}
a{
	text-decoration:none;
	 color: inherit; 
}
.container{
	margin: 0 auto;
	text-align:center;
	display:flex;
	flex-wrap:wrap;
}
h3{
	color:#616060;
	font-weight:bold;
	margin:20px;
}
.tab{
	width:45%;
	background-color: #f2f2f2;
	margin: 1%;
	padding: 5%;
	flex-direction : row;
}
h6{
text-align:center;
padding:20px;
}
</style>
</head>
<body>
	<h3>마이페이지</h3>
	<div class="container">
			<div class="tab"><a href="myPage.do">나의 정보</a><br></div>
			<div class="tab"><a href="myReview.do">나의 리뷰</a><br></div>
			<div class="tab"><a href="myReservation.do">숙소 예약 내역</a><br></div>
			<div class="tab"><a href="myWishList.do">위시리스트</a><br></div>
			<!-- <a href="memberList.do">회원목록</a> -->
	</div>
			<br><h6><a href="myMemberDeleteOutput.do">회원탈퇴</a></h6><br>
</body>
</html>