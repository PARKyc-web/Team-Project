<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="main.do">AirBnB</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="main.do">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="main.do">About</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#!">All Products</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#!">Popular Items</a></li>
						<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
					</ul></li>
					
				<c:choose>
					<c:when test="${empty member}">
						<li class="nav-item"><a class="nav-link" href="memberJoin.do">Login/SignUp</a></li>
					</c:when>
					
					<c:when test="${!empty member}">
						<li class="nav-item"><a class="nav-link" href="memberLogout.do">Logout</a></li>
					</c:when>
				</c:choose>				
			</ul>
			
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
						<form class="d-flex">
				<button class="btn btn-outline-dark" type="submit">
					<i class="bi-cart-fill me-1"></i> Cart <span
						class="badge bg-dark text-white ms-1 rounded-pill">0</span>
				</button>
			</form>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
			<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">MY-INFO</a>
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
						<li><a class="dropdown-item" href="#!">Info Info</a></li>
						<li><a class="dropdown-item" href="#!">Info Info Info</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>