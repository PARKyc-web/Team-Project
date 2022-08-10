<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3{
		text-align: center;
	}
 #container {
 font-family: Georgia, "맑은 고딕 ", serif ;
	width: 600px;
	margin: 0 auto;
}

h3 {
	text-align: center;
	font-family: Georgia, "맑은 고딕", serif;
}

input[type="submit"] {
	float: center;
	jsp: include.class{
     text-align: center;
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

</head>
<body>
	<div id="container">
		<h3>나의 위시 숙소 리스트</h3>
			<c:forEach var="vo" items="${wishList}">
				<c:if test="${vo.onOff eq 0}">
					<div class="card mb-4"
						style="text-align: center; width: 800px; margin: 0 auto">
						<div class="card-header">
							<c:set var="i" value="${i + 1}" />
							No. ${i} 수정해야함*****
						</div>
						<div class="card-body">
							<div class="slider">
								<c:forEach var="inner" items="${picList}">
									<img class="card-img-top" src="${inner.path}${inner.name}"
										width="900px" height="200px" alt="selected-hotel-image" />

								</c:forEach>
							</div>
							<p>${vo.hotelName}</p>
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath}/selectHotel.do?hotelId=${vo.hotelId}'">상세보기</button>
						</div>
					</div>
				</c:if>

			</c:forEach>


		<jsp:include page="myHome.jsp"></jsp:include>
	</div>
</body>
</html>