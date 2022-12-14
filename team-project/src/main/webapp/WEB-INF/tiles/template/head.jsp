<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container px-4 px-lg-5">
		<a href="main.do"><img src="image/logo.png" width="35px;"></a><a class="navbar-brand"
			href="main.do">AirDnD</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="main.do"></a></li>
				<li class="nav-item"><a class="nav-link" href="main.do"></a></li>

			</ul>

			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
						<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
									<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<!-- <form class="d-flex">
				<button class="btn btn-outline-dark" type="submit">
					<i class="bi-cart-fill me-1"></i> Cart <span
						class="badge bg-dark text-white ms-1 rounded-pill">0</span>
				</button>
			</form> -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<c:choose>
					<c:when test="${!empty member}">
						<li class="nav-item"><a class="nav-link">${member.memberId }님
								환영합니다</a></li>
					</c:when>
					<c:when test="${!empty member}">
						<li class="nav-item"><a class="nav-link"
							href="memberLogout.do">Logout</a></li>
					</c:when>
					<c:when test="${empty member}">
						<li class="nav-item"><a class="nav-link" href="memberJoin.do">로그인·회원가입</a></li>
					</c:when>
				</c:choose>
			</ul>
			<c:if test="${!empty member }">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						<c:if test="${empty member }">
							<img src="image/default_pro.jpg" width="32px" height="32px"
								id="profile_image">
						</c:if> <c:if test="${!empty member }">
							<img src="${member.memberPic}" width="32px" height="32px"
								id="profile_image">
						</c:if>

				</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:choose>
							<c:when test="${!empty member}">
								<li><a class="dropdown-item" href="myPageMain.do">마이페이지</a></li>
							</c:when>

							<c:when test="${empty member}">
								<li><a class="dropdown-item" href="memberJoin.do">마이페이지</a></li>
							</c:when>
						</c:choose>

						<li><hr class="dropdown-divider" /></li>
						
						<c:if test="${empty member}">
							<li class="nav-item"><a class="nav-link" href="memberJoin.do">Login/SignUp</a></li>
						</c:if>

						<c:if test="${member.memberType eq 1}">
							<li><a class="dropdown-item" href="hotelUploadForm.do">숙소
									등록</a></li>
							<li><a class="dropdown-item" href="hotelManageForm.do">숙소
									관리</a></li>
						</c:if>

						<c:if test="${!empty member}">
							<li class="nav-item"><a class="dropdown-item" href="memberLogout.do">로그아웃</a></li>
						</c:if>
					</ul></li>
				</ul>
			</c:if>
		</div>
	</div>
</nav>