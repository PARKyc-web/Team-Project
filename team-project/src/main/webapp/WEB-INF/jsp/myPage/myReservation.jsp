<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 예약 내역</title>
</head>
<body>
	<h3>숙소 예약 내역</h3>
		
			<c:forEach var="vo" items="${reservation}">			
				<form action="${pageContext.request.contextPath }/myReviewWriter.do"
					method="post">
					<ul>
						<li><label for="name">숙소이름 : </label> <input name="name"
							size="10" id="id" type="text" value="${vo.hotelName }" readonly></li>
						<li><label for="in">체크인 : </label> <input name="in"
							type="text" value="${vo.inDate }" readonly></li>
						<li><label for="out">체크아웃 : </label> <input name="out"
							id="mail" type="text" value="${vo.outDate }" readonly></li>
						<li><label for="cost">총비용 : </label> 
							<input name="cost" id="pic" type="text" value="${vo.totalPrice }" readonly>
							<input type="hidden" name="hotelId" value="${vo.hotelId}">
							<input type="hidden" name="memberId" value="${vo.memberId}"></li>
						<li><input type="hidden" name="reservationId" value="${vo.reservationId}"></li>
						
						<c:if test="${vo.isReserv ne 4}">
							<li><input type="submit" value="리뷰작성"></li>
						</c:if>
					</ul>
				</form>
			</c:forEach>

	<jsp:include page="myHome.jsp"></jsp:include>
</body>
</html>