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
	<h3>리뷰내역</h3>
	
	<table>
	 <c:forEach var="vo" items="${review }">
         <tr>
         <td>${vo.hotelName }</td>
         <td>${vo.reviewDate }</td>
         <td>${vo.reviewRate }</td>
         <td>${vo.inDate }</td>
         <td>${vo.outDate }</td>
         <td>${vo.reviewContents }</td>
           
            <td>${vo.hotelId }</td>
         </tr>
      </c:forEach>
	</table>
	<%-- <ul>
	 <li> <label for="id" >내가 쓴 리뷰 : </label><br><br>
       
        <input type="text" name ="review" value="${review.hotelId }" readonly><br>
        <input type="text" name ="review" value="${review.reviewDate }" readonly>
        <input type="text" name ="review" value="${review.reviewContents }" readonly><br>
        </li></ul> --%>
</body>
</html>