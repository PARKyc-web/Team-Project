<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
	background-color: #fff/*#f2f2f2*/;
	border: 1px solid #e6e6e6;
	border-radius: 5px;
	box-shadow: 1px 1px 3px #f0f0f0;
	margin: 1%;
	padding: 5%;
	flex-direction : row;
	font-size:16px;
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
