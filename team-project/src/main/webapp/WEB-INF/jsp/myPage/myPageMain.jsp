<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.container{
	margin:0 auto;
	text-align:center;
	display:flex;
}
h3{
	color:#616060;
	font-weight:bold;
	margin:20px;
}
.tab{
	width:500px;
	height:500px;
	background-color: #e8e8e8;
	margin: 5%;
	padding: 5%;
	flex-direction : row;
}

</style>
</head>
<body>
	<div class="container">
	<h3>마이페이지</h3>
			<div class="tab"><a href="myPage.do">나의 정보</a><br></div>
			<div class="tab"><a href="myReview.do">나의 리뷰</a><br></div>
			<div class="tab"><a href="myReservation.do">숙소 예약 내역</a><br></div>
			<div class="tab"><a href="myWishList.do">위시리스트</a><br></div>
			<br><a href="myMemberDeleteOutput.do">회원탈퇴</a><br>
			<!-- <a href="memberList.do">회원목록</a> -->

	</div>
</body>
