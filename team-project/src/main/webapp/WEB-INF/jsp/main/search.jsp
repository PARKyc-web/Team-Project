<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
  
  <style>
  .center {
  text-align: center;
}

.center h1{
	margin-top:30px;
}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid green;
  margin: 0 4px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
  
  
</head>

<!-- Section-->
<section class="py-5">
	<div class="search-block">
		<form action="searchHotel.do?pageNum=1&amount=12" method="post" class="search-form">
			<input type="text" name="search_word" placeholder="어디로 떠나시나요?">
			<input type="submit" value="GO !">
		</form>
		
		<!-- <form action="main.do" class="filter-form">
			<input type="text" name="option-loc" placeholder="Search..Option-loc">
			<input type="text" name="option-price" placeholder="Search..Option-price">
			<input type="text" name="option" placeholder="Search..Option-">
			<button id="filter-btn">Filter</button>
		</form> -->
	</div>
		

	
	<div class="recommend-hotel">
	<h4><i> == Search Hotel List == </i></h4>
	<small><b>(${word}의 검색결과 : ${page.total}개)</b></small>
	</div>
	
	
	<c:choose>
		<c:when test="${count eq 0}">
			<c:set var="real_count" value="1"></c:set>
		</c:when>
		
		<c:when test="${count > 0}">
			<c:set var="real_count" value="${count}"></c:set>	
		</c:when>
	</c:choose>
	
	<c:if test="${count eq 0}">
		<div class="center">
			<h1>${word}에 대한 검색 결과가 없습니다!</h1>
		</div>
	</c:if>
	
	<c:if test="${count > 0}">	
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<!--  카드 반복 시작 -->
			<c:forEach var="i" begin="0" end="${real_count-1}" step ="1" >
			<div class="col mb-5">
				<div class="card h-100">
				
					<!-- Product image-->
					<div class="slider">
						<c:forEach var="inner" items="${hotelPicList[i]}">
						<img class="card-img-top"
						src="${inner.path}${inner.name}" width="450px" height="200px" alt="..." />
						</c:forEach>
					</div>
					
						
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">${hotelList[i].hotelName}</h5>
							<!-- Product price-->
							${hotelList[i].hotelPrice}
						</div>
					</div>
					
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="selectHotel.do?hotelId=${hotelList[i].hotelId}">View options</a>
						</div>
					</div>
					
				</div>
			</div>
			</c:forEach>	
					
		</div>
	</div>	
	</c:if>
		<div class="center">
  <div class="pagination">
  <c:if test="${page.prev }">
  	<a href="searchHotel.do?pageNum=${page.startPage-1 }&amount=${page.cri.amount}&search_word=${word}">prev</a>
  </c:if>
  
  <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
  		<a href="searchHotel.do?pageNum=${num }&amount=${page.cri.amount}&search_word=${word}">${num }</a>
  
  </c:forEach>
    
    <c:if test="${page.next }">
  	<a href="searchHotel.do?pageNum=${page.endPage+1 }&amount=${page.cri.amount}&search_word=${word}">next</a>
 	 </c:if>
  
  </div>  
</div>
</section>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="tileExample/js/scripts.js"></script>
