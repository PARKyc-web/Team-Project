<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
         <tr>
         <td>${vo.hotelName }</td>
         <td>${vo.memberId }</td>
         <td>${vo.onOff }</td>
        
         </tr>
      </c:forEach>
      </table>
</body>
</html>