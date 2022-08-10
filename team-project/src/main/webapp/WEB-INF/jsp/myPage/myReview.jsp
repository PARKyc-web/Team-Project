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
	 <c:forEach var="vo1" items="${review1 }">
	 <c:forEach var="vo2" items="${review2 }">
				<div class="card mb-4" style="text-align: center; width: 600px; margin: 0 auto">
					<div class="card-header">
						<p>${vo1.hotelName }</p>
					</div>
					<div class="card-body">
						<p style="text-align: right">작성일자 | ${vo2.reviewDate }</p>
						<p>⭐ ${vo2.reviewRate } ${vo2.reviewContents }</p>
						<button>수정</button><button>${vo1.hotelId } 삭제</button>
					</div>
				</div>
			</c:forEach>
      </c:forEach>

		<jsp:include page = "myHome.jsp"></jsp:include>
</body>
</html>