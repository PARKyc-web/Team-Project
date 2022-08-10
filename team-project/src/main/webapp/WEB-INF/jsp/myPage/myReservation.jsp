<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 예약 내역</title>
<style>
	#container{
		width: 600px;
		margin : 0 auto;
	font-family : Georgia, "맑은 고딕", serif;

	}
	h3{
		text-align: center;
	}
	ul{
		list-style: none;
	}
	ul li{
		clear: both;
	}
	.field{
		float: left;
		width: 100px;
		font-size: bold;
		line-height: 55px;
		text-align: center;
		margin-right: 15px;
	}
	input[type="submit"]{
		float: right;
		border: 1px rgb(34, 160, 87);
		border-radius: 12px;
		background-color: rgb(80, 209, 134);
		font-weight: bold;
		color : white;
		
	}
	input[type="text"]{
		border: none;
		width: 450px;
		padding-top: 15px;
	}
	input[type="text"]:hover{
	border: none;
	}
</style>
</head>
<body>
	<h3>숙소 예약 내역</h3>
	<div id ="container">
	<table>
		<tbody>
		
		
			<c:forEach var="review" items="${review }">
			<script>
			console.log(${review});
			</script>
			$(document).ready(function () {
						<c:if test = "${review.reviewId eq null}">
          				 <c:set var="write" value="리뷰작성"></c:set>
          				 console.log(${review.reviewId});
          				 <!--  $("#sub_app_condition").show(); -->
      					  </c:if>
						<c:if test="${review.reviewId ne null}">
          				  <c:set var="write" value="리뷰작성완료"></c:set>
          				 console.log(value);
          				 <!--  $("#sub_app_condition").hide();                // 아니면 거절 사유 숨김 --> 
        				</c:if> 
        				}
        	</c:forEach>
			<c:forEach var="vo" items="${reservation}">
				<form action="${pageContext.request.contextPath }/myReviewWriter.do"
					method="post">
					<ul>
						<li><label for="name" class="field">숙소이름 : </label> <input name="name"
							size="10" id="id" type="text" value="${vo.hotelName }" readonly></li>
						<li><label for="in" class="field">체크인 : </label> <input name="in"
							type="text" value="${vo.inDate }" readonly></li>
						<li><label for="out" class="field">체크아웃 : </label> <input name="out"
							id="mail" type="text" value="${vo.outDate }" readonly></li>
						<li><label for="cost" class="field">지불금액 : </label> 
							<input name="cost" id="pic" type="text" value="${vo.totalPrice }" readonly>
							<input type="hidden" name="hotelId" value="${vo.hotelId}">
							<input type="hidden" name="memberId" value="${vo.memberId}"></li>
						<li><input type="submit" name="write" value="리뷰작성"></li>


					<!-- 	<input type="button" value="Disable me" disabled>
 -->

					
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
</div>
</body>
</html>