<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<style>
	</style>

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
					</div>
					<div class="card-body">
						<p style="text-align: right">작성일자 | ${vo.reviewDate}</p>
						<p>⭐ ${vo.reviewRate}</p>
						<p style="text-align: left">${vo.reviewContents}</p>
						<button type="button" onclick="clickDelete()" style="float: right;">삭제</button>
						<input type="hidden" id="id" value=${vo.reviewId }>
						<script type="text/javascript">
						function clickDelete() {
							var id = document.getElementById("id").value;
							if(confirm("정말로 삭제하시겠습니까?")) {
								location.href = "deleteReview.do?reviewId=" + id;
							}
						}
						</script>
					</div>
				</div>
		</c:forEach>

	  <jsp:include page = "myHome.jsp"></jsp:include>
</body>
