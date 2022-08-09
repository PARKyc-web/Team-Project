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
	<table>
		<tbody>
			<c:forEach var="vo" items="${reservation}">
				<form action="${pageContext.request.contextPath }/myReviewWriter.do"
					method="post">
					<ul>
						<li><label for="name">숙소이름 : </label> <input name="name"
							size="10" id="id" type="text" value="${vo.hotelName }" readonly></li>
						<li><label for="in">체크인 : </label> <input name="in"
							type="text" value="${vo.inDate }"></li>
						<li><label for="out">체크아웃 : </label> <input name="out"
							id="mail" type="text" value="${vo.outDate }"></li>
						<li><label for="cost">총비용 : </label> <input name="cost"
							id="pic" type="text" value="${vo.totalPrice }"></li>
						<li><input type="hidden" name="hotelId" value="${vo.hotelId}"></li>
						<li><input type="hidden" name="memberId" value="${vo.memberId}"></li>
						<li><input type="submit" value="리뷰작성"></li>
						</ul>
				</form>

				<%-- <button type="button" onclick ="location.href='${pageContext.request.contextPath }/selectHotel.do?hotelId=${vo.hotelId }'">상세보기</button>
		 --%>

				
				<%--  <tr>
	         <td>숙소이름 : ${vo.hotelName }</td>
	         <td>체크인 : ${vo.inDate }</td>
	         <td>체크아웃 : ${vo.outDate }</td>
	         <td>총비용 : ${vo.totalPrice }</td>    
	         </tr>
	         <tr><td type ="button" submit" value ="리뷰작성"></td>
	         </tr> --%>
			</c:forEach>
		</tbody>
	</table>
	<jsp:include page="myHome.jsp"></jsp:include>
</body>
</html>