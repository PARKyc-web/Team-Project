<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>

#heart {
	font-size: xx-large;
	background-color: white;
	border: none;
	transition: all ease 1s;
}

#heart:hover {
	transform: rotateY(180deg);
}

#container {

	    width: 70%;
        background-color: rgba( 255, 255, 255, 0.95 );
        margin: 0 auto;
        margin-top:1%;
        margin-bottom:7%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
}

h3 {
	
	text-align: center;
	padding:10px;
	padding-bottom:3%;'
}
h4 {
	text-align: center;
}

input[type="submit"] {
	float: center;
	jsp: include.class{
     text-align: center;
}
}

</style>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true,
			speed : 500,
			pause : 4000,
			mode : 'fade',
			pager : true,
		});
	});
</script>
<style>
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
	<br>
	<br>
	<br>
	<div id="container">
	<h6><a href='myPageMain.do'>마이페이지</a>&nbsp; > &nbsp;<a href='#'>위시리스트</a></h6>
		<h3>나의 위시 숙소 리스트</h3>
		<c:choose>
			<c:when test="${size eq 0}">
				<h4>마음에 드는 숙소리스트를 만들어보세요</h4>
				
			</c:when>

			<c:when test="${size ne 0}">
				<c:forEach var="i" begin="0" end="${size-1}" step="1">

					<c:if test="${wishList[i].onOff eq 0}">

						<div class="card mb-4" style="width: 600px; margin: 0 auto">
							<div class="card-header">
								<c:set var="k" value="${k + 1}" />
								No. ${k}

							</div>
							<div class="card-body">
								<div class="slider">
									<c:forEach var="inner" items="${picList[i]}">
										<img class="card-img-top" src="${inner.path}${inner.name}"
											width="900px" height="300px" alt="selected-hotel-image" />
									</c:forEach>
								</div>

								<form action="ajaxHeartColor.do" method="get">
									<input type="hidden" name="hotelId"
										value="${wishList[i].hotelId}"> <input type="hidden"
										name="heartColor" value="0">
								<h4 class="fw-bolder mb-4 mt-5">
									<button type="submit" id="heart">💗</button>
									<a href='${pageContext.request.contextPath}/selectHotel.do?hotelId=${wishList[i].hotelId}'>${wishList[i].hotelName}</a>
								</h4>
								</form>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
</body>
</html>