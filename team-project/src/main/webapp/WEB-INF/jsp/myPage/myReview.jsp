<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<style>
	</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

		<br><br>
		<div class="center">
			<h3>리뷰내역</h3>
		</div>
		<c:forEach var="vo" items="${list}">		
				<div class="card mb-4" style="text-align: center; width: 800px; margin: 0 auto">
					<div class="card-header">
						<p>${vo.hotelName }</p>
						<p>작성일자 | ${vo.reviewDate}</p>
					</div>
					<div class="card-body">
						<p>⭐ ${vo.reviewRate} <br>
						${vo.reviewContents}</p>
						<button>삭제</button>
					</div>
				</div>
		</c:forEach>


	  <jsp:include page = "myHome.jsp"></jsp:include>
</body>
