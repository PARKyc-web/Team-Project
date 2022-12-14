<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>호텔 상세 페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/selectHotel.css" rel="stylesheet" />
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=yfntmtqunm&submodules=geocoder"></script>

<!-- jQuery 달력 -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- 여기서 부터 이미지 슬라이드 하는 거 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
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
<!-- 여기까지 슬라이드하는 코드 -->
<style>
#heart {
	font-size: xx-large;
	background-color: white;
	border: none;
	transition: all ease 1s;
}

#heart:hover {
	transform: rotateY(180deg);
}
</style>
</head>
<body>

	<!-- Page content-->
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article>
					<!-- Post header-->
					<header class="mb-4">
						<!-- Post title 숙소명-->
						<h3 class="fw-bolder mb-1">🏡 ${hotelInfo.hotelName }</h3>
						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2">
							⭐ ${avgStar} · <a href="#review" style="color: gray">후기
								${countReview }개</a> · ❣️ 슈퍼호스트 · <a href="#location"
								style="color: gray">${hotelInfo.hotelLocation }</a>
						</div>

						<!-- Post categories-->
						<a class="badge bg-secondary text-decoration-none link-light"
							href="#!">#NEW</a> <a
							class="badge bg-secondary text-decoration-none link-light"
							href="#!">#인기 많은</a> <a
							class="badge bg-secondary text-decoration-none link-light"
							href="#!">#Super Host</a>
					</header>
					<!-- Preview image figure-->

					<div class="slider">
						<c:forEach var="inner" items="${picList}">
							<img class="card-img-top" src="${inner.path}${inner.name}"
								width="900px" height="400px" alt="selected-hotel-image" />

						</c:forEach>
					</div>

					<!-- Post content-->
					<section class="mb-5">
						<p class="fs-5 mb-4">${hotelInfo.hotelDesc }</p>
						<hr>
						<!-- 숙소 편의 시설 여부에 따라 취소선을 나타내었습니다. -->
						<h4 class="fw-bolder mb-4 mt-5">숙소 편의시설</h4>
						<!-- WIFI -->
						<c:choose>
							<c:when test="${0 eq hotelInfo.hotelOptionWifi }">
								<p class="fs-5 mb-4">
									🌐
									<del>무선 인터넷</del>
								</p>
							</c:when>
							<c:otherwise>
								<p class="fs-5 mb-4">🌐 무선 인터넷</p>
							</c:otherwise>
						</c:choose>
						<!-- SWIM -->
						<c:choose>
							<c:when test="${0 eq hotelInfo.hotelOptionSwim }">
								<p class="fs-5 mb-4">
									🏊
									<del>수영장</del>
								</p>
							</c:when>
							<c:otherwise>
								<p class="fs-5 mb-4">🏊 수영장</p>
							</c:otherwise>
						</c:choose>
						<!-- KITCHEN -->
						<c:choose>
							<c:when test="${0 eq hotelInfo.hotelOptionKitchen }">
								<p class="fs-5 mb-4">
									🍽️
									<del>주방</del>
								</p>
							</c:when>
							<c:otherwise>
								<p class="fs-5 mb-4" id="kitchen">🍽️ 주방</p>
							</c:otherwise>
						</c:choose>
						<!-- PARKING -->
						<c:choose>
							<c:when test="${0 eq hotelInfo.hotelOptionParking }">
								<p class="fs-5 mb-4">
									🚗
									<del>무료 주차</del>
								</p>
							</c:when>
							<c:otherwise>
								<p class="fs-5 mb-4" id="parking">🚗 무료 주차</p>
							</c:otherwise>
						</c:choose>
						<!-- PET -->
						<c:choose>
							<c:when test="${0 eq hotelInfo.hotelOptionWpet }">
								<p class="fs-5 mb-4">
									🐶
									<del>반려동물 입실 가능</del>
								</p>
							</c:when>
							<c:otherwise>
								<p class="fs-5 mb-4" id="pet">🐶 반려동물 입실 가능</p>
							</c:otherwise>
						</c:choose>
						<a class="badge bg-secondary text-decoration-none link-light"
							href="#!">더보기</a>

						<hr>
						<h4 class="fw-bolder mb-4 mt-5" id="location">호스팅 지역</h4>
						<div id="map" style="width: 100%; height: 400px;"></div>
						<input type='hidden' id="hotelAddress"
							value="${hotelInfo.hotelLocation}">
						<script>
							let hotelAddr = document
									.getElementById('hotelAddress').value;

							var mapOptions = {
								center : new naver.maps.LatLng(37.3595704,
										127.105399), //경도와 위도
								zoom : 16,
								mapTypeControl : true
							};

							var map = new naver.maps.Map('map', mapOptions); // id and mapOption
							// 맵 만드는 부분

							var marker = new naver.maps.Marker({
								position : new naver.maps.LatLng(37.3, 127.1),
								map : map
							});

							var infoWindow = new naver.maps.InfoWindow({
								anchorSkew : true
							});

							function searchAddressToCoordinate(address) {
								naver.maps.Service
										.geocode(
												{
													query : address
												},
												function(status, response) {
													if (status === naver.maps.Service.Status.ERROR) {
														return alert('Something Wrong!');
													}

													if (response.v2.meta.totalCount === 0) {
														return alert('totalCount'
																+ response.v2.meta.totalCount);
													}

													var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(
															item.x, item.y);

													if (item.roadAddress) {
														htmlAddresses
																.push('[도로명 주소] '
																		+ item.roadAddress);
													}

													if (item.jibunAddress) {
														htmlAddresses
																.push('[지번 주소] '
																		+ item.jibunAddress);
													}

													if (item.englishAddress) {
														htmlAddresses
																.push('[영문명 주소] '
																		+ item.englishAddress);
													}

													infoWindow
															.setContent([
																	'<div style="padding:10px;min-width:200px;line-height:150%;">',
																	'<h4 style="margin-top:5px;">검색 주소 : '
																			+ address
																			+ '</h4><br />',
																	htmlAddresses
																			.join('<br />'),
																	'</div>' ]
																	.join('\n'));

													map.setCenter(point);
													marker.setPosition(point);
													//infoWindow.open(map, point);
												});
							}

							function hasArea(area) {
								return !!(area && area.name && area.name !== '');
							}

							function hasData(data) {
								return !!(data && data !== '');
							}

							function checkLastString(word, lastString) {
								return new RegExp(lastString + '$').test(word);
							}

							function hasAddition(addition) {
								return !!(addition && addition.value);
							}

							searchAddressToCoordinate(hotelAddr);
						</script>
						<p class="fs-5 mb-4">${hotelInfo.hotelLocation }</p>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">호스트: ${hostName }님</h4>
						<p class="fs-5 mb-4">⭐ 후기 ${countReview }개 · ✅ 본인 인증 완료 · ❣️
							슈퍼호스트</p>
						<p class="fs-5 mb-4">안녕하세요? ${hotelInfo.hotelLocation } 에서 ${hotelInfo.hotelName}을(를) 운영하고 있는 호스트 ${hostName }입니다.</p>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">알아두어야 할 사항</h4>
						<table>
							<thead>
								<tr>
									<th style="width: 300px;">숙소 이용규칙</th>
									<th style="width: 300px;">건강과 안전</th>
									<th style="width: 300px;">환불 정책</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>체크인: 오후 4:00 이후</td>
									<td>코로나19 방역 수칙을 준수하셔야 합니다.</td>
									<td>모든 예약은 정책에 따라 보호를 받습니다.</td>
								</tr>
								<tr>
									<td>체크아웃 시간: 오후 10:00</td>
									<td>일산화탄소 경보기</td>
								</tr>
								<tr>
									<td>열쇠 보관함(으)로 셀프 체크인</td>
									<td>화재경보기</td>
								</tr>
								<tr>
									<td>흡연 금지</td>
								</tr>
							</tbody>
						</table>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5" id="review">⭐ ${avgStar} · 후기
							${countReview }개</h4>
					</section>
				</article>
				<!-- Comments section-->
				<section class="mb-5">
					<div class="card bg-light">
						<div class="card-body">
							<!-- 리뷰 list로 저장해서 foreach로 여러개 가져올 예정-->
							<c:forEach var="vo" items="${reviewList }">
								<div class="d-flex">
									<div class="flex-shrink-0">
										<img class="rounded-circle" src="user_image/default_pro.jpg" alt="..." style="width: 50px; height:50px"/>
									</div>
									<div class="ms-3">
										<div class="fw-bold">게스트 이름: ${vo.memberId }</div>
										리뷰 일자: ${vo.reviewDate }<br> <b>⭐ ${vo.reviewRate }</b>
										${vo.reviewContents }
									</div>
								</div>
							</c:forEach>
							<c:if test="${empty reviewList}">
								<br>
								<p class="fs-5 mb-4" style="text-align: center">등록된 리뷰가
									없습니다.</p>
							</c:if>
						</div>
					</div>
				</section>
			</div>
			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- Side widget-->
				<div class="card mb-4" style="text-align: center">
					<div class="card-header">위시리스트에 담기</div>
					<div class="card-body">
						<form action="ajaxHeartColor.do" method="get">
							<input type="hidden" name="hotelId" value="${hotelInfo.hotelId }">
							<input type="hidden" name="heartColor" value="${heartColor}">
							<button type="submit" id="heart">
								<c:choose>
									<c:when test="${0 eq heartColor }">
								💗							
							</c:when>
									<c:otherwise>
								🤍
							</c:otherwise>
								</c:choose>
							</button>
						</form>
						<p>click here</p>
					</div>
				</div>
				<!-- 예약 하기-->
				<div class="card mb-4">
					<div class="card-header" style="text-align: center">숙소가 마음에
						드시나요?</div>
					<div class="card-body">
						
							<div style="float:left;"><b style="font-size: x-large;">₩${hotelInfo.hotelPrice }</b> /박</div>
							<div style="float:right; display:inline-block;"><span style="font-size: small;">⭐ <b>${avgStar}</b>
					 · <a href="#review" style="color: gray">후기 ${countReview }개</a></span></div><br><br>
						

						<script type="text/javascript">
							$(function() {
								var invalid = "${invalidDate}";
								invalid = invalid.substring(1,
										invalid.length - 1);
								var some_date_range = invalid.split(", ");

								console.log(some_date_range);
								console.log(some_date_range.length);

								$('input[name="datefilter"]')
										.daterangepicker(
												{
													autoUpdateInput : false,
													locale : {
														cancelLabel : 'Clear',
														"separator" : " - ", // 시작일시와 종료일시 구분자
														"format" : 'YYYY.MM.DD', // 일시 노출 포맷
														"applyLabel" : "확인", // 확인 버튼 텍스트
														"cancelLabel" : "취소", // 취소 버튼 텍스트
														"daysOfWeek" : [ "일",
																"월", "화", "수",
																"목", "금", "토" ],
														"monthNames" : [ "1월",
																"2월", "3월",
																"4월", "5월",
																"6월", "7월",
																"8월", "9월",
																"10월", "11월",
																"12월" ]
													},
													opens : 'center',
													minDate : new Date(),
													// 예약 불가능한 날짜 표시
													isInvalidDate : function(
															date) {
														for (var ii = 0; ii < some_date_range.length; ii++) {
															if (date
																	.format('YYYY-MM-DD') == some_date_range[ii]) {
																return true;
															}
														}
													}
												});

								$('input[name="datefilter"]')
										.on(
												'apply.daterangepicker',
												function(ev, picker) {
													$(this).val(picker.startDate.format('YYYY.MM.DD')
																			+ ' - '
																			+ picker.endDate.format('YYYY.MM.DD'));
													
													// total price를 위한 코드
													var temp = document.getElementById('inputDate').value;
													
													temp = temp.split(" - ");
													var checkIn = temp[0].substring(0, temp[0].length);
													var checkOut = temp[1].substring(0, temp[1].length);
													
													const getDateDiff = (d1, d2) => {
														  const date1 = new Date(d1);
														  const date2 = new Date(d2);
														  
														  const diffDate = date2.getTime() - date1.getTime();
														  
														  return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
														}

													var day = getDateDiff(checkIn, checkOut);
													
													document.getElementById('day').innerText = day
													document.getElementById('totalPrice').innerText = ${hotelInfo.hotelPrice} * day;
													document.getElementById('totalPrice2').innerText = ${hotelInfo.hotelPrice} * day;
												});

								$('input[name="datefilter"]').on(
										'cancel.daterangepicker',
										function(ev, picker) {
											$(this).val('');
										});

							});
						</script>
						<form action="doReservation.do?hotelId=${hotelInfo.hotelId }"
							method="post">
							
							체크인 및 체크아웃 <input type="text" name="datefilter" id="inputDate" onchange="return changeEven()"
								placeholder="여기를 눌러 선택하기"
								style="width: 190px; text-align: center; border: none; float: right;" /><br>
							인원 게스트 <input type="number" name="guestNum" min="1" value="1"
								max=${hotelInfo.maxP }
								style="width: 35px; border: none; text-align: right;">명<br>
							<br>
							<div style=" text-align: center;">
							<input type="submit" value="예약하기" style="margin: 0 auto" />
							</div>
							<br>
							<p style="text-align: center;">예약 확정 전에는 요금이 청구되지 않습니다.</p>
							<div style="float:left;">₩${hotelInfo.hotelPrice } x <span id='day'></span>
							
							박</div> <div style="float:right; display:inline-block;">₩<span id = 'totalPrice'>0</span></div><br>
							<div style="float:left;">서비스 수수료</div > <div style="float:right; display:inline-block;">₩0</div><br>
							<hr>
							<div style="float:left;">총 합계</div> <div style="float:right; display:inline-block;">₩<span id = 'totalPrice2'>0</span></div>
						</form>
					</div>

				</div>
				<!-- Side widget-->
				<div class="card mb-4" style="text-align: center">
					<div class="card-header">❗ 알림</div>
					<div class="card-body">흔치 않은 기회입니다! ${hostName }님의 에어디앤디 숙소는
						보통 예약이 가득 차 있습니다.</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>