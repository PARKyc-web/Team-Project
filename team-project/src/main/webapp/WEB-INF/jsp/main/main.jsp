<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <script>
    $(document).ready(function(){
      $('.slider').bxSlider({
   	    auto: true,
  		speed: 500,
  		pause: 4000,
  		mode:'fade',
  		pager:true,    	  
      });
    });
  </script>
  
</head>

<!-- Header-->
<header class="bg-dark py-5">
	<div class="container px-4 px-lg-5 my-5" id="mainPage">
		<div class="text-center text-white">
			<h1 class="display-4 fw-bolder">TEAM AirBnB</h1>
			<p class="lead fw-normal text-white-50 mb-0">have fun with TEAM AirBnB</p>
		</div>
	</div>
</header>

<!-- Section-->
<section class="py-5">
	<div class="search-block">
		<form action="searchHotel.do" class="search-form">
			<input type="text" name="search_word" placeholder="Search.......... something">
			<input type="submit" value="Search">
		</form>
	</div>
	<hr>
	<div class="recommend-hotel">
	<h4><i> == Recommend Hotel List == </i></h4>
	</div>
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<!--  카드 반복 시작 -->
			<c:forEach var="i" begin="0" end="7" step ="1" >
			<div class="col mb-5">
				<div class="card h-100">
				
					<!-- Product image-->
					<div class="slider">
						<c:forEach var="inner" items="${pic_list[i]}">
							<img class="card-img-top" 
							src="${inner.path}${inner.name}" width="450px" height="200px" alt="main-page-image" />
							
						</c:forEach>						
					</div>
					
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">${random_list[i].hotelName }</h5>
							<!-- Product price-->
							${random_list[i].hotelPrice}원
						</div>
					</div>
					
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="selectHotel.do?hotelId=${random_list[i].hotelId }">View options</a>
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