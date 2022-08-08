<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0" id="user_image" 
				src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..."
					onError="image/hotel_default.png" />
			</div>
			<div class="col-md-6">
				<div class="small mb-1"></div>
				<h1 class="display-5 fw-bolder">숙소 등록 페이지</h1>
				<div class="fs-5 mb-5">
					
				</div>
				<form action="hotelUpload.do" method="post" enctype="multipart/form-data">
					<label class ="uploadLabel">Member_id : </label>
					<input type="text" id="member_id" name="member_id" value="">
					<br> <label class="uploadLabel">Hotel_name : </label><input type="text" name="hotel_name">
					<br> <label class="uploadLabel">Hotel_location	: </label><input type="text" name="hotel_location">
					<br> <label class="uploadLabel">Hotel_Desc : </label><input type="text" name="hotel_desc">
					<br> <label class="uploadLabel">Hotel_Price : </label><input type="text" name="hotel_price">  
					<br> <label class="uploadLabel">Hotel_Type : </label><input type="text" name="hotel_type">  
					<br> <label class="uploadLabel">Hotel_maxP : </label><input type="text" name="maxP">
					<br><br>					
					<h3> == 숙소 옵션 == </h3>					
					<label><input type="checkbox" name="hotel_option_WIFI" value="1">와이파이</label>
					<br> <label><input type="checkbox" name="hotel_option_swim" value="1">수영장</label>
					<br> <label><input type="checkbox" name="hotel_option_kitchen"	value="1">주방</label>
					<br> <label><input type="checkbox"	name="hotel_option_wPet" value="1">반려동물</label>
					<br> <label><input	type="checkbox" name="hotel_option_parking" value="1">주차장</label>

					<br><br>	
					<h3> == 사진 등록 == </h3>
					<input type="file" accept="image/*" name="uploadImage" id="uploadImage" onchange="PreviewImage();">
				 				
				 	<br><br>	 	
					<div class="d-flex">
						<button class="btn btn-outline-dark flex-shrink-0" type="submit">
							<i class="bi-cart-fill me-1"></i> 등록
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