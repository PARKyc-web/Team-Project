<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>
h3{
	padding-top:5%;
	text-align:center;

}
a{
	text-decoration:none;
	color: inherit; 
}
a:hover{
	text-decoration:none;
	color:gray;
}
#container2{
	    width: 90%;
        background-color: rgba( 255, 255, 255, 0.95 );
        margin: 0 auto;
        margin-top:2%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
    	padding-bottom:7%;
    	
}
.container{
	margin: 0 auto;
	text-align:center;
	display:flex;
	flex-wrap:wrap;
	padding-left:3%;
}
h3{
	color:#616060;
	font-weight:bold;
	margin:20px;
}
.tab{
	width:45%;
	background-color: #fcfcfc;
	border: 1px solid #e6e6e6;
	border-radius: 5px;
	box-shadow: 1px 1px 3px #f0f0f0;
	margin: 1%;
	padding: 6%;
	
	flex-direction : row;
	font-size:17px;
	font-weight:bold;
	color:#2b2b2b;
}
.tab:hover{
/*box-shadow: 1px 1px 3px #fc777b;*/
	/*background-color:#fc777b;*/
}
h6{
color:gray;
text-align:center;
padding-left:60%;
padding-bottom:10%;
}

/*////////////////////////////*/

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 700,
  'GRAD' 0,
  'opsz' 48;
  font-size: 50px;
  color: #fc777b
}
</style>
</head>
<body>
<div id="container2">
	<h3>마이페이지</h3>
	<div class="container">
			<button class="tab" onclick="location.href='myPage.do'">
			<span class="material-symbols-outlined">mood</span><br>
			나의 정보<br></button>
			<button class="tab" onclick="location.href='myReview.do'">
			<span class="material-symbols-outlined">comment</span><br>
			나의 리뷰<br></button>
			<button class="tab" onclick="location.href='myReservation.do'">
			<span class="material-symbols-outlined">cottage</span><br>
			숙소 예약 내역<br></button>
			<button class="tab" onclick="location.href='myWishList.do'">
			<span class="material-symbols-outlined">heart_plus</span><br>
			위시리스트<br></button>
	
			<!-- <div class="tab"><a href="myPage.do">나의 정보</a><br></div>
			<div class="tab"><a href="myReview.do">나의 리뷰</a><br></div>
			<div class="tab"><a href="myReservation.do">숙소 예약 내역</a><br></div>
			<div class="tab"><a href="myWishList.do">위시리스트</a><br></div> -->
			<!-- <a href="memberList.do">회원목록</a> -->
	</div>
</div>			
</body>
