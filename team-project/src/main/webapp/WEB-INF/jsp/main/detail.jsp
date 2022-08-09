<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
	ul li{
		list-style-type:none;
		padding:5px;		
	}
	
	ul li label{		
		vertical-align:top;
	}
		
</style>
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
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
		
			<div class="col-md-6">			
				<div class="slider">
					<c:forEach var="inner" items="${hotelPic[i]}">
						<img class="card-img-top mb-5 mb-md-0" 
							 src="${inner.path}${inner.name}" width="450px" height="200px" alt="hotel-detail-image" />							
					</c:forEach>						
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="small mb-1"></div>
				<h2 class="display-5 fw-bolder">숙소 상세페이지</h2>
				<div class="fs-5 mb-5">
				
				</div>
				<form action="hotelUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="hotel_id" value="${hotel.hotelId}">
				<ul>
					<li><label class ="uploadLabel">숙소주인 : </label>
					<input type="text" id="member_id" name="member_id" value="${member.memberId }" readonly></li>
					<li><label class="uploadLabel">숙소명 : </label>
						<input type="text" name="hotel_name" value="${hotel.hotelName }" readonly></li>
					<li><label class="uploadLabel">숙소위치	: </label>
						<input type="text" name="hotel_location" value="${hotel.hotelLocation }"></li>
					<li><label class="uploadLabel">숙소설명 : </label>
						<textarea name="hotel_desc" cols="30" rows="10">${hotel.hotelDesc }</textarea></li>
					<li><label class="uploadLabel">1박당 가격 : </label>
						<input type="text" name="hotel_price" value="${hotel.hotelPrice }"></li>  
					<li><label class="uploadLabel">숙소종류 : </label>  
					<select name="hotel_type">
						<option value="호텔" selected>호텔</option>
						<option value="펜션">펜션</option>
						<option value="게스트하우스">게스트하우스</option>
						<option value="전원주택">전원주택</option>
						<option value="아파트">아파트</option>
						<option value="오피스텔">오피스텔</option>
					</select></li>
					<li><label class="uploadLabel">최대예약 인원 : </label>
						<input type="text" name="maxP" value="${hotel.maxP }"></li>
					<br>					
					<h3> == 숙소옵션 변경 == </h3>					
					<li><label><input type="checkbox" name="hotel_option_WIFI" value="1">와이파이</label></li>
					<li><label><input type="checkbox" name="hotel_option_swim" value="1">수영장</label></li>
					<li><label><input type="checkbox" name="hotel_option_kitchen" value="1">주방</label></li>
					<li><label><input type="checkbox" name="hotel_option_wPet" value="1">반려동물</label></li>
					<li><label><input type="checkbox" name="hotel_option_parking" value="1">주차장</label></li>
				</ul>					
					<h3> == 사진 추가등록 == </h3>
					<img src="#" id="user_image" width="320px" height="180px" onError="image/hotel_default.webp" alt=" ">
					<input type="file" accept="image/*" name="uploadImage" id="uploadImage" onchange="PreviewImage();">
				 				
				 	<br><br>
					<div class="d-flex">
						<button class="btn btn-outline-dark flex-shrink-0" type="submit">
							<i class="bi bi-house me-1"></i> 정보수정
						</button>
					</div>
				</form>				

			</div>
		</div>
	</div>
</section>

<script>
	function PreviewImage() {
		var preview = new FileReader();

		preview.onload = function(e) {
			document.getElementById("user_image").src = e.target.result;
		};

		preview.readAsDataURL(document.getElementById("uploadImage").files[0]);
	};
</script>