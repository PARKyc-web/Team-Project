<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>숙소 예약 내역</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	#container{
		width: 600px;
		margin : 0 auto;

	}
	h3{
		padding-top:3%;
		text-align: center;
	}
	ul{
		list-style: none;
	}
	ul li{
		clear: both;
	}
	.field{
		float: left;
		width: 100px;
		font-size: bold;
		line-height: 55px;
		text-align: center;
		margin-right: 15px;
	}
	input[type="submit"]{
		float: right;
		border: 1px rgb(34, 160, 87);
		border-radius: 12px;
		background-color: rgb(80, 209, 134);
		font-weight: bold;
		color : white;
		
	}
	input[type="text"]{
		border: none;
		width: 450px;
		padding-top: 15px;
	}

	input[type="text"]:focus{
		outline : none;
	}
	
</style>
</head>
<body>
	<h3>숙소 예약 내역</h3>


	<c:forEach var="vo" items="${reservation}">				
			<div id ="container">
					<form action="${pageContext.request.contextPath }/myReviewWriter.do"
						method="post">
						<ul>
							<li><label for="name" class="field">숙소이름 : </label> <input name="name"
	
								size="10" id="id" type="text" value="${vo.hotelName }" readonly></li>
							<li><label for="in" class="field">체크인 : </label> <input name="in"
								type="text" value="${vo.inDate }" readonly></li>
							<li><label for="out" class="field">체크아웃 : </label> <input name="out"
								id="mail" type="text" value="${vo.outDate }" readonly></li>
							<li><label for="cost" class="field">지불금액 : </label> 
								<input name="cost" id="pic" type="text" value="${vo.totalPrice }" readonly>
								<input type="hidden" name="hotelId" value="${vo.hotelId}">
								<input type="hidden" name="memberId" value="${vo.memberId}"></li>
	
							<li><input type="hidden" name="reservationId" value="${vo.reservationId}"></li>
							
							<c:if test="${vo.isReserv ne 4}">
								<li><input type="submit" value="리뷰작성"></li>
							</c:if>
						</ul>
					</form>
			</div>
	</c:forEach>

	<jsp:include page="myHome.jsp"></jsp:include>
</body>
</html>