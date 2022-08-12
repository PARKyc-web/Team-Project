<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성 결과페이지(myReviewSendOutput.jsp)</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>

#container{
	
	    width: 80%;
        background-color: rgba( 255, 255, 255, 0.95 );
        margin: 0 auto;
        margin-top:2%;
        margin-bottom:1%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
    	
}
h3{
	padding:3%;
	text-align:center;
}

   a{
    	color:gray;
    	text-decoration:none;
    }
    a:hover{
    	color:gray;
    }
</style>
</head>
<body>
<div id="container">
	<h6><a href='myPageMain.do'>마이페이지</a>&nbsp; > &nbsp;<a href='/myReview.do'>나의 리뷰</a>&nbsp; > &nbsp;<a href='#'>리뷰 작성</a></h6>
	<h3>여행지 리뷰가 작성되었습니다.</h3>
</div>	

</body>
</html>