<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<!-- Section-->
<section class="py-5">
	<div class="search-block">
		<form action="main.do" class="search-form">
			<input type="text" name="search" placeholder="Search.......... something">
			<input type="submit" value="Search">
		</form>
		
		<form action="main.do" class="filter-form">
			<input type="text" name="option-loc" placeholder="Search..Option-loc">
			<input type="text" name="option-price" placeholder="Search..Option-price">
			<input type="text" name="option" placeholder="Search..Option-">
			<button id="filter-btn">Filter</button>
		</form>
	</div>
		
	<hr>
	
	<div class="recommend-hotel">
	<h4><i> == Search Hotel List == </i></h4>
	<small><b>(검색된 숙소 ${count}개)</b></small>
	</div>
	
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<!--  카드 반복 시작 -->
			<c:forEach var="i" begin="0" end="11" step ="1" >
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Product image-->
					<img class="card-img-top"
						src="tileExample/image/111.webp" width="450px" height="180px" alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">검색된 호텔의 이름</h5>
							<!-- Product price-->
							75,000원
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>			
		</div>
	</div>	 
</section>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="tileExample/js/scripts.js"></script>
