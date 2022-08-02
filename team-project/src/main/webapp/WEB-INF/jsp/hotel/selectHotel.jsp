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
<title>호텔 상세 페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/selectHotel.css" rel="stylesheet" />
</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#!">⛱️airbnb(메인페이지 이동)</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="input-group">
				<input class="form-control" type="text"
					placeholder="Enter search term..."
					aria-label="Enter search term..." aria-describedby="button-search" />
				<button class="btn btn-primary" id="button-search" type="button">검색</button>
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">내 정보</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page content-->
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article>
					<!-- Post header-->
					<header class="mb-4">
						<!-- Post title 숙소명-->
						<h3 class="fw-bolder mb-1">[독채민박] 제주 바닷마을, 호젓한 둘만의 안식처 -
							스테이호재</h3>
						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2">⭐ 4.95 · 후기 114개 ·
							❣️ 슈퍼호스트 · 구좌읍, 제주시, 제주도, 한국</div>

						<!-- Post categories-->
						<a class="badge bg-secondary text-decoration-none link-light"
							href="#!">#NEW</a> <a
							class="badge bg-secondary text-decoration-none link-light"
							href="#!">#인기 많은</a> <a
							class="badge bg-secondary text-decoration-none link-light"
							href="#!">#Super Host</a>
					</header>
					<!-- Preview image figure-->
					<figure class="mb-4">
						<img class="img-fluid rounded"
							src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
					</figure>
					<!-- Post content-->
					<section class="mb-5">
						<p class="fs-5 mb-4">⭐숙소 설명란⭐ 제주의 한적한 바닷마을 김녕리에 위치한 프라이빗 렌탈
							하우스입니다. 하루 한 팀, 성인 두 분만 머무시는 독채형 숙소로 타인과 마주칠 일 없이 프라이빗한 휴식을 만끽할 수
							있습니다.</p>
						<p class="fs-5 mb-4">화이트&우드 톤으로 꾸며진 내부는 편안한 휴식을 도와드립니다. 호스트의
							취향이 담긴 CD들과, CD 플레이어 겸 블루투스 스피커가 비치되어 호스트의 취향을 엿보거나, 나의 취향을 재생하기
							모두 가능합니다.</p>
						<p class="fs-5 mb-4">평상형 마루에 올라앉아 마당의 귤나무를 바라보거나 야외 데크의 릴랙스
							체어에 누워 하늘을 올려다보며 도시의 피로를 씻어 버리세요.</p>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">숙소 편의시설</h4>
						<p class="fs-5 mb-4">무선 인터넷</p>
						<p class="fs-5 mb-4">주방</p>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">호스팅 지역</h4>
						<p class="fs-5 mb-4">⭐⭐⭐여기에 지도⭐⭐⭐</p>
						<p class="fs-5 mb-4">구좌읍, 제주시, 제주도, 한국</p>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">호스트: 호재님</h4>
						<p class="fs-5 mb-4">⭐ 후기 114개 본인 인증 완료 ❣️ 슈퍼호스트</p>
						<p class="fs-5 mb-4">2016년 봄 서울에서 제주로 이주했습니다. 제주에 와서 결혼하고 남편,
							고양이와 살고 있어요. 제가 좋아하는 제주의 마을 김녕에서 작은 민박집을 운영합니다.</p>
						<hr>
						<h4 class="fw-bolder mb-4 mt-5">⭐ 4.95 · 후기 114개</h4>
					</section>
				</article>
				<!-- Comments section-->
				<section class="mb-5">
					<div class="card bg-light">
						<div class="card-body">
							<!-- Comment form 리뷰 입력란 -->
							<form class="mb-4">
								<textarea class="form-control" rows="3"
									placeholder="리뷰를 작성해주세요. 이 textarea는 숙박을 완료한 게스트에게만 보이거나(아니면 hidden) 예약 내역에서 바로 리뷰를 작성할 수 있도록 만들면 좋을듯?"></textarea>
							</form>
							<!-- 리뷰 list로 저장해서 foreach로 여러개 가져올 예정-->
							<c:forEach var="i" begin="1" end="3">
								<div class="d-flex">
									<div class="flex-shrink-0">
										<img class="rounded-circle"
											src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
											alt="..." />
									</div>
									<div class="ms-3">
										<div class="fw-bold">게스트 ${i }</div>
										${i }번째 리뷰 : 일단 숙소 위치 너무 좋았어요. 관광객 위주 느낌보다는 제주 감성 잔뜩 입은 김녕읍이구요, 앞에 바로 바닷가
									산책로가 있어서 너무 좋았어요 숙소 자체는 인테리어 부터 청결도, 가구 가전 모두 흠잡을데 없이 좋았습니다!!!!
									</div>
								</div>
							</c:forEach>
							<!-- Single comment-->
							<div class="d-flex">
								<div class="flex-shrink-0">
									<img class="rounded-circle"
										src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
								</div>
								<div class="ms-3">
									<div class="fw-bold">Yoori(게스트)</div>
									일단 숙소 위치 너무 좋았어요. 관광객 위주 느낌보다는 제주 감성 잔뜩 입은 김녕읍이구요, 앞에 바로 바닷가
									산책로가 있어서 너무 좋았어요 숙소 자체는 인테리어 부터 청결도, 가구 가전 모두 흠잡을데 없이 좋았습니다!!!!
								</div>
							</div>
							<!-- Comment with nested comments-->
							<div class="d-flex mb-4">
								<!-- Parent comment-->
								<div class="flex-shrink-0">
									<img class="rounded-circle"
										src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
								</div>
								<div class="ms-3">
									<div class="fw-bold">Mingyeong(게스트)</div>
									편안하고 따뜻함이 가득한 스테이 호재에서 하루동안 잘 머물다 갑니다😊 호스트님께서 체크인도 일찍 도와주신 덕분에
									여유롭게 누릴수 있었습니다~!
									<!-- Child comment 1-->
									<div class="d-flex mt-4">
										<div class="flex-shrink-0">
											<img class="rounded-circle"
												src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
												alt="..." />
										</div>
										<div class="ms-3">
											<div class="fw-bold">호재(호스트)</div>
											이용해주셔서 감사합니다.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- 예약 하기-->
				<div class="card mb-4">
					<div class="card-header">숙소가 마음에 드시나요?</div>
					<div class="card-body">
						<p>₩248,000 /박 ₩248,000/박 4.95 · 후기 114개</p>
						<p>⭐⭐⭐여기에 달력⭐⭐⭐</p>
						<button type="button">예약하기</button>
						<p style="text-align: center;">예약 확정 전에는 요금이 청구되지 않습니다.</p>
						<p>₩248,000 x 5박 ₩1,240,000</p>
						<p>청소비 ₩10,000</p>
						<p>서비스 수수료 ₩176,471</p>
						<p>숙박세와 수수료 ₩17,647</p>
						<hr>
						<p>총 합계 ₩1,444,118</p>
					</div>

				</div>
				<!-- Side widget-->
				<div class="card mb-4">
					<div class="card-header">Side Widget</div>
					<div class="card-body">흔치 않은 기회입니다.호재님의 에어비앤비 숙소는 보통 예약이 가득 차
						있습니다.</div>
				</div>
				<!-- Categories widget-->
				<div class="card mb-4">
					<div class="card-header">Categories</div>
					<div class="card-body">
						<div class="row">
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">Web Design</a></li>
									<li><a href="#!">HTML</a></li>
									<li><a href="#!">Freebies</a></li>
								</ul>
							</div>
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">JavaScript</a></li>
									<li><a href="#!">CSS</a></li>
									<li><a href="#!">Tutorials</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">여긴 원래 나의 Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>