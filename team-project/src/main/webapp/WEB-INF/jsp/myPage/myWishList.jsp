<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>나의 위시 숙소 리스트</h3>


	<table>
		<c:forEach var="vo" items="${wishList }">
			<c:if test="${vo.onOff eq 0}">
				<c:set var="wish_state" value="예약가능"></c:set>
			</c:if>

			<c:if test="${vo.onOff eq 1}">
				<c:set var="wish_state" value="예약불가능"></c:set>
			</c:if>
			<tr>
				<td>${vo.hotelName }</td>
				<td>${vo.memberId }</td>
				<td>${wish_state }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>