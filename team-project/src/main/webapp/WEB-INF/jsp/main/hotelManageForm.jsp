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
<style>
#container{
	
	    width: 90%;
        background-color: rgba( 255, 255, 255, 0.95 );
        margin: 0 auto;
        margin-top:2%;
        margin-bottom:1%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
    	
}
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
<div id="container">
<h2 class="center">나의 숙소</h2>
  <c:choose>
	  <c:when test="${count eq 0 }">
	  	<br><h2> 등록된 숙소가 없습니다.!</h2>
	  </c:when>
	  <c:when test="${count ne 0 }">
	  <div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<!--  카드 반복 시작 -->
	
				
				<c:forEach var="i" begin="0" end="${count-1 }" step ="1" >
				<div class="col mb-5">
					<div class="card h-100">
					
						<!-- Product image-->
						<div class="slider">
							<c:forEach var="inner" items="${picList[i]}">
								<img class="card-img-top" 
								src="${inner.path}${inner.name}" width="450px" height="200px" alt="main-page-image" />
								
							</c:forEach>						
						</div>
						
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">${list[i].hotelName }</h5>
								<!-- Product price-->
								${list[i].hotelPrice}원
							</div>
						</div>
						
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" 
								   href="hotelDetailForm.do?hotelId=${list[i].hotelId }&memberId=${member.memberId}">자세히보기</a>
							</div>
						</div>
						
					</div>
				</div>
				</c:forEach>			
			</div>
		</div>	 
		
		<div class="center">
		  <div class="pagination">
		  <c:if test="${page.prev }">
		  	<a href="searchHotel.do?pageNum=${page.startPage-1 }&amount=${page.cri.amount}">prev</a>
		  </c:if>
		  
		  <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
		  		<a href="searchHotel.do?pageNum=${num }&amount=${page.cri.amount}">${num }</a>  
		  </c:forEach>
		    
		    <c:if test="${page.next }">
		  	<a href="searchHotel.do?pageNum=${page.endPage+1 }&amount=${page.cri.amount}">next</a>
		 	 </c:if>
		  
		  </div>  
		</div>
	</c:when>
</c:choose>
</div>