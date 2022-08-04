<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	         <tr>
	         <td>${vo.hotelName }</td>
	         <td>${vo.inDate }</td>
	         <td>${vo.outDate }</td>
	         <td>${vo.totalPrice }</td>        
	         </tr>
	      </c:forEach>
      	</tbody>
   	</table>
</body>
</html>