<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>숙소 예약 내역</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
#container {
	width: 600px;
	margin: 0 auto;
}

h3 {
	padding-top: 3%;
	text-align: center;
}

ul {
	list-style: none;
}

ul li {
	clear: both;
}

.field {
	float: left;
	width: 100px;
	font-size: bold;
	line-height: 55px;
	text-align: center;
	margin-right: 15px;
}

input[type="submit"] {
	float: right;
	border: 1px rgb(34, 160, 87);
	border-radius: 12px;
	background-color: rgb(80, 209, 134);
	font-weight: bold;
	color: white;
}

button {
	float: right;
	border: 1px rgb(34, 160, 87);
	border-radius: 12px;
	background-color: orange;
	font-weight: bold;
	color: white;
}

input[type="text"] {
	border: none;
	width: 450px;
	padding-top: 15px;
}

input[type="text"]:focus {
	outline: none;
}
</style>
</head>
<body>
	<h3>숙소 예약 내역</h3>

	<c:set var="vo" value="${reservation }"></c:set>


	<c:if test="${size ne 0}">
		<c:forEach var="i" begin="0" end="${size-1}" step="1">
			<div id="container">
				<form action="${pageContext.request.contextPath }/myReviewWriter.do"
					method="post">
					<ul>
						<li><label for="name" class="field">숙소이름 : </label> <input
							name="name" size="10" id="id" type="text"
							value="${vo[i].hotelName }" readonly></li>
						<li><label for="in" class="field">체크인 : </label> <input
							name="in" type="text" value="${vo[i].inDate }" readonly></li>
						<li><label for="out" class="field">체크아웃 : </label> <input
							name="out" id="mail" type="text" value="${vo[i].outDate }"
							readonly></li>
						<li><label for="cost" class="field">지불금액 : </label> <input
							name="cost" id="pic" type="text" value="${vo[i].totalPrice }"
							readonly> <input type="hidden" name="hotelId"
							value="${vo[i].hotelId}"> <input type="hidden"
							name="memberId" value="${vo[i].memberId}"></li>

						<li><input type="hidden" name="reservationId" id="reservationId"
							value="${vo[i].reservationId}"></li>

						<c:choose>
							<c:when test="${vo[i].isReserv ne 4 and canWrite[i]}">
								<li><input type="submit" value="리뷰작성"></li>
							</c:when>

							<c:when test="${vo[i].isReserv eq 4 }">
								<li><input type="submit" value="리뷰작성완료" disabled></li>
							</c:when>
							<c:when test="${vo[i].isReserv ne 4 and !canWrite[i]}">
								<button type="button" onclick="clickDelete()">예약취소하기</button>
								<script type="text/javascript">
									function clickDelete() {
										var id = document.getElementById("reservationId").value
										if (confirm("정말로 예약을 취소하시겠습니까?")) {
											location.href = "deleteReservation.do?reservationId="
													+ id;
										}
									}
								</script>
							</c:when>
						</c:choose>
					</ul>
				</form>
			</div>
		</c:forEach>
	</c:if>

	<jsp:include page="myHome.jsp"></jsp:include>
</body>
</html>