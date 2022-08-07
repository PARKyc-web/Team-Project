<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<form action="hotelUpload.do" method="post" enctype="multipart/form-data">
	
		<label for="member_id">Member_id</label><input type="text" id="member_id" name="member_id" value="" readonly>
		<br><label for="hotel_name">Hotel_name : </label><input type="text" id="hotel_name" name="hotel_name">
		<br><label>Hotel_location : </label><input type="text" name="hotel_location">
		<br><label>Hotel_Desc : </label><input type="text" name="hotel_desc">
		
		<br><input type="checkbox" name="hotel_option_xx" value="hotel_option_xx">option_num1
		<br><input type="checkbox" name="hotel_option_yy" value="hotel_option_yy">option_num2
		
		
		<h2> 업로드할 사진할 사진을 추가하세요!</h2>
		<div class="uploadImageDiv" id ="uploadImageDiv">
			<img id="user_image" src="#" alt="" onError="this.src='image/hotel_default.webp'">	
		</div>
		<input type="file" accept="image/*" name="uploadImage" id="uploadImage" onchange="PreviewImage();">
		<br><input type="submit">	
	</form>
	
	
	<script>
		function PreviewImage(){
			var preview = new FileReader();
			
			preview.onload = function(e){
				document.getElementById("user_image").src = e.target.result;
			};
			
			preview.readAsDataURL(document.getElementById("uploadImage").files[0]);
		};
	
	</script>
	
</body>
</html>