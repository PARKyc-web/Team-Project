<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<style>
	h3{
	 
    	padding-bottom:1%;
        text-align: center;
	
	}

		#container{
        width: 80%;
        background-color: #fff;
        margin: 0 auto;
        margin-top:4%;
        margin-bottom:4%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
    }
    a{
    	color:gray;
    	text-decoration:none;
    }
    a:hover{
    	color:gray;
    }
    	hr{
		margin: 0 auto;
		width: 80%;
		color: #cccccc;
		margin-top: 30px;
		margin-bottom: 30px;
	}
    

	h4 {
	text-align: center;
}
	

	</style>

</head>
<body>
<div id="container">
<h6><a href='myPageMain.do'>마이페이지</a>&nbsp; > &nbsp;<a href='#'>리뷰 내역</a></h6>
		<br><br>
		<div class="center">
			<h3>리뷰내역</h3>
			<hr>
		
			<c:choose>
			<c:when test="${size eq 0}">
				<h3>작성된 리뷰가 없습니다</h3>
				
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list}">		
			
				<div class="card mb-4" style="text-align: center; width: 800px; margin: 0 auto">
					<div class="card-header">
						<p>${vo.hotelName }</p>
					</div>
					<div class="card-body">
						<p style="text-align: right">작성일자 | ${vo.reviewDate}</p>
						<p>⭐ ${vo.reviewRate}</p>
						<p style="text-align: left">${vo.reviewContents}</p>
						<button type="button" onclick="clickDelete(${vo.reviewId })" style="float: right;">삭제</button>
						<input type="hidden" id="id" value=${vo.reviewId }>
						<script type="text/javascript">
						function clickDelete(hotelNum) {
							//var id = document.getElementById("id").value;
							if(confirm("정말로 삭제하시겠습니까?")) {
								location.href = "deleteReview.do?reviewId=" + hotelNum;
							}
						}
						</script>
					</div>
				</div>
		</c:forEach>

		</c:otherwise>
	</c:choose>
</div>  
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>