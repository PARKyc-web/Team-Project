<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 	  font-family: Georgia, "맑은 고딕", serif;
 	 #container{
        width: 600px;
        margin: 0 auto;
    }
    h3{
        text-align: center;
        font-family: Georgia, "맑은 고딕", serif;
    }
  
     
    input[type="submit"]{
    	float : center;
    	
    jsp:include.class{
     text-align: center;
    }
   	
    
</style>
</head>
<body>
<div id="container">
	<h3>나의 위시 숙소 리스트</h3>


	<table>
		<c:forEach var="vo" items="${wishList }">
		<%-- 	<c:when test="${empty vo }">
			  <c:out value="위시리스트를 만들어보세요." />
			</c:when> --%>
			<c:if test="${vo.onOff eq 0}">
				<c:set var="wish_state" value="예약가능"></c:set>
			</c:if>

			<c:if test="${vo.onOff eq 1}">
				<c:set var="wish_state" value="예약불가능"></c:set>
			</c:if>
			<tr>
				<td>숙소이름 : ${vo.hotelName }</td>
				
				<td>예약상태 : ${wish_state }</td>
				<td><button type="button" onclick ="location.href='${pageContext.request.contextPath }/selectHotel.do?hotelId=${vo.hotelId }'">상세보기</button></td>
			
			<!-- <a href="a.html#result">Go to result.</a> -->
			</tr>
		</c:forEach>
	</table>
		<jsp:include page = "myHome.jsp"></jsp:include>
</div>
</body>
</html>