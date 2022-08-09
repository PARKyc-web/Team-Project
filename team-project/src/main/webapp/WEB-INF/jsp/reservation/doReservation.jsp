<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>예약 요청</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/selectHotel.css" rel="stylesheet" />
<link href="css/payDropdown.css" rel="stylesheet" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true,
			speed : 500,
			pause : 4000,
			mode : 'fade',
			pager : true,
		});
	});
</script>

</head>
<body>
<c:if test="${empty memberId }">
<script type="text/javascript">
	alert("로그인이 필요한 기능입니다.");
	location.href = '/teamProject/memberJoin.do';
</script>
</c:if>
	<!-- Page content-->
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article>
					<!-- Post header-->
					<header class="mb-4">
						<!-- Post title -->
						<h3 class="fw-bolder mb-1">☑ 예약 요청</h3>
					</header>

					<!-- Post content-->
					<section class="mb-5">
						<h4 class="fw-bolder mb-4 mt-5">예약 정보</h4>
						<p class="fs-5 mb-4">날짜 ${checkInOut }</p>
						<p class="fs-5 mb-4">게스트 ${guestNum }명</p>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">결제 수단</h4>
						
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">환불 정책</h4>
						<p class="fs-5 mb-4">환불 금액을 알고 싶다면 예약 취소 절차를 시작하세요. 그러면 상세 내역이
							표시됩니다. 숙박 기간, 취소 시기, 예약에 적용되는 환불 정책에 따라 체크인 후 예약을 취소하면 일부 환불이 가능할
							수 있습니다.</p>
						<p class="fs-5 mb-4">긴급 상황이나 자연재해로 인해 예약에 지장이 있었다면, 정상참작이 가능한
							상황으로 간주되어 환불이 가능할 수 있습니다.</p>
					</section>
					<form action="reservationSuccess.do" name="rvForm" method="post">
						<input type="hidden" name="checkIn" id="checkIn" value="" />
						<input type="hidden" name="checkOut" id="checkOut" value="" />
						<input type="hidden" name="totalPrice" id="totalPrice" value="" />
						<input type="hidden" name="memberId" value="${member.memberId }" />
						<input type="hidden" name="hotelId" value="${hotelInfo.hotelId }" />
						<input type="submit" value="예약 요청" />
					</form>
				</article>

			</div>
			<!-- Side widget-->
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-header" style="text-align: center">요금 안내</div>
					<div class="card-body">
						<div class="slider">
						<c:forEach var="inner" items="${picList}">
							<img class="card-img-top" src="${inner.path}${inner.name}"
								width="900px" height="200px" alt="selected-hotel-image" />

						</c:forEach>
					</div>
						${hotelInfo.hotelName }
						<div class="text-muted fst-italic mb-2">⭐ ${avgStar}
							(${countReview }) · ❣️ 슈퍼호스트</div>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">요금 세부 정보</h4>
						<form name=>
						<p>₩${hotelInfo.hotelPrice } x <span id="day"></span>박 ₩<span id ="totalPrice2"></span></p>
						<p>청소비 ₩10,000</p> 
						<p>서비스 수수료 ₩176,471</p>
						<p>숙박세와 수수료 ₩17,647</p>
						<hr>
						<p>총 합계 ₩1,444,118</p>
						</form>
					</div>
				</div>
			</div>
			<script type="text/javascript">
						var checkInOut = "${checkInOut }".split(" - ");
						var checkIn = checkInOut[0].substring(0, checkInOut[0].length);
						var checkOut = checkInOut[1].substring(0, checkInOut[1].length);
						
						const getDateDiff = (d1, d2) => {
							  const date1 = new Date(d1);
							  const date2 = new Date(d2);
							  
							  const diffDate = date2.getTime() - date1.getTime();
							  
							  return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
							}

						var day = getDateDiff(checkIn, checkOut);
						
						document.getElementById('checkIn').value = checkIn;
						document.getElementById('checkOut').value = checkOut;
						document.getElementById('totalPrice').value = ${hotelInfo.hotelPrice } * day;
						document.getElementById('totalPrice2').innerHTML = ${hotelInfo.hotelPrice } * day;
						document.getElementById('day').innerHTML = day;
					</script>

		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>