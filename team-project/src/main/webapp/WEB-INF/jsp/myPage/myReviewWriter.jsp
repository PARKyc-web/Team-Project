<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
<style>
 .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }</style>

</head>
<body>
	<h3>리뷰작성</h3>
	<form action = "./myReviewSend.do" method = "post">
		내용 : <input type="text" name="contents"><br>
		
	<!-- 	별점 : <input type="number" step="0.5" max="5.0" min ="0.0" name="rate"><br>
		 -->
		 <span class="star">
  ★★★★★
  <span>★★★★★</span>
  <input type="range" oninput="drawStar(this)" name = "rate" value="1" step="1" min="0" max="10">
</span>
<script> const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
}</script>

		<input type="hidden" name="hotelId" value="${reservation.hotelId}">
		<input type="hidden" name="memberId" value="${reservation.memberId}">
		<input type="hidden" name="hotelName" value="${reservation.hotelName}">
		<input type="hidden" name="reservationId" value="${reservation.reservationId}">
		<input type="submit" value="작성완료">
	</form>
</body>
</html>