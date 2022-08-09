<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

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
							<a class="btn btn-outline-dark mt-auto" href="selectHotel.do?hotelId=${random_list[i].hotelId }&memberId=${member.memberId}">자세히보기</a>
						</div>
					</div>
					
				</div>
			</div>
			</c:forEach>			
		</div>
	</div>	 
	
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'/>

<div class='RatingStar'>
  <div class='RatingScore'>
    <div class='outer-star'><div class='inner-star'></div></div>
  </div>
</div>

<style>
	.inner-star::before{color: #FF9600;}
	.outer-star {position: relative;display: inline-block;color: #CCCCCC;}
	.inner-star {position: absolute;left: 0;top: 0;width: 0%;overflow: hidden;white-space: nowrap;}
	.outer-star::before, .inner-star::before {content: '\f005 \f005 \f005 \f005 \f005';font-family: 'Font Awesome 5 free';font-weight: 900;}
</style>

<script>/*<![CDATA[*/ ratings = {RatingScore: 4.5} 
totalRating = 5;table = document.querySelector('.RatingStar');function rateIt() {
	for (rating in ratings) {ratingPercentage = ratings[rating] / totalRating * 100;ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';star = table.querySelector(`.${rating} .inner-star`);numberRating = table.querySelector(`.${rating} .numberRating`);star.style.width = ratingRounded;numberRating.innerText = ratings[rating];}}rateIt()
/*]]>*/</script>