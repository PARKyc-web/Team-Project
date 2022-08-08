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
	 <c:forEach var="vo1" items="${review1 }">
	 <c:forEach var="vo2" items="${review2 }">
         <tr>
         <td>숙소이름 : ${vo1.hotelName }  |  리뷰 쓴 날짜 : ${vo2.reviewDate }  | 별점 : ${vo2.reviewRate } | 체크인 : ${vo1.inDate } | </td>
  <%--         <td>리뷰 쓴 날짜 : ${vo2.reviewDate }</td> 
         <td>별점 : ${vo2.reviewRate }</td>
         <td>체크인 : ${vo1.inDate }</td>
         <td>체크아웃 : ${vo1.outDate }</td> --%>
         </tr>
         <tr>
         <td>리뷰내용 : ${vo2.reviewContents }</td>
          </tr>
          <tr><td>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</td></tr>
      </c:forEach>
      </c:forEach>
	</table>
		<jsp:include page = "myHome.jsp"></jsp:include>
	<%-- <ul>
	 <li> <label for="id" >내가 쓴 리뷰 : </label><br><br>
       
        <input type="text" name ="review" value="${review.hotelId }" readonly><br>
        <input type="text" name ="review" value="${review.reviewDate }" readonly>
        <input type="text" name ="review" value="${review.reviewContents }" readonly><br>
        </li></ul> --%>
</body>
</html>