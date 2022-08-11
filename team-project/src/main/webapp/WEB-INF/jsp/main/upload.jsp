<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>

body{
	background-image:url('image/bg.jpg');
	background-repeat: no-repeat;
  	background-position: center;
  	background-size: cover;
}
#container{
	width: 70%;
	margin: 0 auto;
	padding: 2%;
	text-align: center;
	position:relative;
	margin-top:4%;
	background-color: rgba( 255, 255, 255, 0.95 );
	border: 1px solid #f2f2f2;
	border-radius:10px;
	box-shadow: 1px 1px 2px #f0f0f0;

}
	ul li{
		list-style-type:none;
		padding:5px;
	}
	h2{
		text-align:center;
	}
	.d-flex{
		margin: 0 auto;
	}
</style>
<div id="container">
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0" id="user_image" 
				src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..."
					onError="image/hotel_default.webp" />
			</div>
			<div class="col-md-6">
				<div class="small mb-1"></div>
				<h1>숙소 등록하기</h1>
				<div class="fs-5 mb-5">
					
				</div>
				<form action="hotelUpload.do" method="post" enctype="multipart/form-data">
				<ul>
					<li><label class ="uploadLabel"> 호스트 이름 </label>
					<input type="text" id="member_id" name="member_id" value="${member.memberId }" readonly></li>
					<li><label class="uploadLabel"> 숙소 이름 </label><input type="text" name="hotel_name"></li>
					<li><label class="uploadLabel"> 숙소 위치  </label><input type="text" name="hotel_location"></li>
					<li><label class="uploadLabel"> 숙소 설명 </label><input type="text" name="hotel_desc"></li>
					<li><label class="uploadLabel"> 1박당 가격  </label><input type="text" name="hotel_price"></li>  
					<li><label class="uploadLabel"> 숙소 종류 </label>  
					<select name="hotel_type">
						<option value="호텔" selected>호텔</option>
						<option value="펜션">펜션</option>
						<option value="게스트하우스">게스트하우스</option>
						<option value="전원주택">전원주택</option>
						<option value="아파트">아파트</option>
						<option value="오피스텔">오피스텔</option>
					</select></li>
					<li><label class="uploadLabel">최대 예약 인원 </label><input type="text" name="maxP"></li>
					<br>
					<hr>					
					<h3> 숙소 옵션 </h3>					
					<li><label><input type="checkbox" name="hotel_option_WIFI" value="1">와이파이</label></li>
					<li><label><input type="checkbox" name="hotel_option_swim" value="1">수영장</label></li>
					<li><label><input type="checkbox" name="hotel_option_kitchen"	value="1">주방</label></li>
					<li><label><input type="checkbox"	name="hotel_option_wPet" value="1">반려동물</label></li>
					<li><label><input	type="checkbox" name="hotel_option_parking" value="1">주차장</label></li>
				</ul>					
					<hr>
					<h3> 사진 등록 </h3>
					<input type="file" accept="image/*" name="uploadImage" id="uploadImage" onchange="PreviewImage();">
				 				
				 	<br><br>
				 	<
					<div class="d-flex">
						<button class="btn btn-outline-dark flex-shrink-0" type="submit">
							<i class="bi bi-house me-1"></i> 등록
						</button>
					</div>				
				</form>				

			</div>
		</div>
	</div>
</section>
</div>
<script>
	function PreviewImage() {
		var preview = new FileReader();

		preview.onload = function(e) {
			document.getElementById("user_image").src = e.target.result;
		};

		preview.readAsDataURL(document.getElementById("uploadImage").files[0]);
	};
</script>