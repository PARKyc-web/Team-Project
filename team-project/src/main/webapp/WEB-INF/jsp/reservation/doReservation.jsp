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
						<!-- Post title -->
						<h3 class="fw-bolder mb-1">☑ 예약 요청</h3>
					</header>

					<!-- Post content-->
					<section class="mb-5">
						<h4 class="fw-bolder mb-4 mt-5">예약 정보</h4>
						<p class="fs-5 mb-4">날짜 ${checkInOut }</p>
						<p class="fs-5 mb-4">게스트 게스트 ${guestNum }명</p>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">결제 수단</h4>
						
						<script>
						window.onload=()=>{
						      document.querySelector('.dropbtn_click').onclick = ()=>{
						        dropdown();
						      }
						      document.getElementsByClassName('fastfood').onclick = ()=>{
						        showMenu(value);
						      };
						      dropdown = () => {
						        var v = document.querySelector('.dropdown-content');
						        var dropbtn = document.querySelector('.dropbtn')
						        v.classList.toggle('show');
						        dropbtn.style.borderColor = 'rgb(94, 94, 94)';
						      }

						      showMenu=(value)=>{
						        var dropbtn_icon = document.querySelector('.dropbtn_icon');
						        var dropbtn_content = document.querySelector('.dropbtn_content');
						        var dropbtn_click = document.querySelector('.dropbtn_click');
						        var dropbtn = document.querySelector('.dropbtn');

						        dropbtn_icon.innerText = '';
						        dropbtn_content.innerText = value;
						        dropbtn_content.style.color = '#252525';
						        dropbtn.style.borderColor = '#3992a8';
						      }
						    }
						    window.onclick= (e)=>{
						      if(!e.target.matches('.dropbtn_click')){
						        var dropdowns = document.getElementsByClassName("dropdown-content");

						        var dropbtn_icon = document.querySelector('.dropbtn_icon');
						        var dropbtn_content = document.querySelector('.dropbtn_content');
						        var dropbtn_click = document.querySelector('.dropbtn_click');
						        var dropbtn = document.querySelector('.dropbtn');

						        var i;
						        for (i = 0; i < dropdowns.length; i++) {
						          var openDropdown = dropdowns[i];
						          if (openDropdown.classList.contains('show')) {
						            openDropdown.classList.remove('show');
						          }
						        }
						      }
						    }
						</script>
						<div class="dropdown-label">
							Lunch Menus <span style="font-family: Material Icons;">restaurant</span>
						</div>
						<div class="dropdown">
							<button class="dropbtn">
								<span class="dropbtn_icon">more_horiz</span> <span
									class="dropbtn_content">Select a menu...</span> <span
									class="dropbtn_click"
									style="font-family: Material Icons; font-size: 16px; color: #3b3b3b; float: right;"
									onclick="dropdown()">arrow_drop_down</span>
							</button>
							<div class="dropdown-content">
								<div class="fastfood" onclick="showMenu(this.innerText)">Burgerking</div>
								<div class="fastfood" onclick="showMenu(this.innerText)">Mcdonals</div>
								<div class="fastfood" onclick="showMenu(this.innerText)">Lotteria</div>
								<div class="fastfood" onclick="showMenu(this.innerText)">Mom's
									touch</div>
								<div class="fastfood" onclick="showMenu(this.innerText)">In
									n out</div>
								<div class="fastfood" onclick="showMenu(this.innerText)">Subway</div>
								<div class="fastfood" onclick="showMenu(this.innerText)">Shake
									shack</div>
							</div>
						</div>

						<hr>
						<h4 class="fw-bolder mb-4 mt-5">환불 정책</h4>
						<p class="fs-5 mb-4">환불 금액을 알고 싶다면 예약 취소 절차를 시작하세요. 그러면 상세 내역이
							표시됩니다. 숙박 기간, 취소 시기, 예약에 적용되는 환불 정책에 따라 체크인 후 예약을 취소하면 일부 환불이 가능할
							수 있습니다.</p>
						<p class="fs-5 mb-4">긴급 상황이나 자연재해로 인해 예약에 지장이 있었다면, 정상참작이 가능한
							상황으로 간주되어 환불이 가능할 수 있습니다.</p>
					</section>

					<form action="#" method="post" onsubmit="alert('예약이 완료되었습니다.')">
						날짜 <input type="text" name="datefilter" value=${checkInOut } /><br>
						게스트 게스트<input type="text" name="guestNum" value=${guestNum } />명<br>
						<input type="submit" value="예약 요청 누르면 마이 페이지 내 예약 내역 란으로.." />
					</form>
				</article>

			</div>
			<!-- Side widget-->
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-header">Side Widget</div>
					<div class="card-body">
						<p>⭐⭐⭐ 여기에 대표 사진⭐⭐⭐</p>
						${hotelInfo.hotelName }
						<div class="text-muted fst-italic mb-2">⭐ ${avgStar}
							(${countReview }) · ❣️ 슈퍼호스트</div>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">요금 세부 정보</h4>
						<p>₩${hotelInfo.hotelPrice } x 5박 ₩${hotelInfo.hotelPrice * 5}</p>
						<p>청소비 ₩10,000</p>
						<p>서비스 수수료 ₩176,471</p>
						<p>숙박세와 수수료 ₩17,647</p>
						<hr>
						<p>총 합계 ₩1,444,118</p>
					</div>
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