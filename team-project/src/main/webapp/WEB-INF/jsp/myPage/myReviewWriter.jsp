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
	color: rgb(80, 209, 134);
	overflow: hidden;
	pointer-events: none;
}
#container{
	width: 600px;
	margin: 0 auto;
}
h3{
	text-align: center;
	font-weight: bold;
}

input[type="submit"]{
		float: right;
		border: 1px rgb(34, 160, 87);;
		border-radius: 12px;
		background-color: rgb(80, 209, 134);
		font-weight: bold;
		color : white;
		
	}
</style>

</head>
<body>
	<div id = "container">
	<h3>리뷰작성</h3>
	<form action="./myReviewSend.do" method="post">
		<!-- 	별점 : <input type="number" step="0.5" max="5.0" min ="0.0" name="rate"><br>
		 -->

		<span class="star"> ★★★★★ <span>★★★★★</span> <input
			type="range" oninput="drawStar(this)" name="rate" value="0"
			step="0.5" min="0" max="5">
		</span>
		<script> const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = (target.value * 20) + "%";
    console.log(target.value);
    console.log(target.value*20);
		// document.querySelector(target).value +"점";
}
</script>

		<br>
		<br>
		<textarea name="contents" cols="40" rows="3" placeholder="리뷰를 작성해주세요." required
			style="width: 500px; height: 200px;"></textarea>

		<input type="hidden" name="hotelId" value="${reservation.hotelId}">
		<input type="hidden" name="memberId" value="${reservation.memberId}">
		<input type="hidden" name="hotelName" value="${reservation.hotelName}">
		<input type="hidden" name="reservationId" value="${reservation.reservationId}">
		<input type="submit" value="작성완료">
	</form>
</div>
</body>
</html>