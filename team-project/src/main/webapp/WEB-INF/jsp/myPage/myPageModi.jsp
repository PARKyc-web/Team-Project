<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>

 	  font-family: Georgia, "맑은 고딕", serif;
 	 #container{
        width: 600px;
        margin: 0 auto;
    }
    h3{
        text-align: center;
        font-family: Georgia, "맑은 고딕", serif;
    }
    ul{
        list-style: none;
    }
    ul li {
        clear: both;
        text-align: center;
    }
       input[type="text"],[type="tel"],[type="email"]{
       
        width: 350px;
        height: 40px;
        border: 2px solid #fc777b;
        border-radius: 20px;
        padding: 5px;
        margin: 10px 0;


    }
    input[type="submit"]{
    	float : center;
    	
    jsp:include.class{
     text-align: center;
    }
    	
    
</style>
</head>
<body>
<div id="container">

	<h3>회원정보 수정</h3>
	
	<form method = "post" name = "member" action="${pageContext.request.contextPath}/myPageInfoModify.do">
	
	      <ul>
          <li><label for="id" >아이디 : </label>
          <input name="id" size="10" id ="id" type="text" value = "${memberModi.memberId }" readonly></li>
          <li><label for="call">전화번호 : </label>
          <input name="call" id ="call" type="tel" value = "${memberModi.phone }"></li>
          <li><label for="mail">이메일 : </label>
          <input name="mail" id="mail" type="email" value = "${memberModi.email }"></li>
          <li><img src="#" width="200px" height="200px" id="profile_image"></li>
          <li><label for="pic">사진 : </label>
          <input type="file" accept="image/*" name="uploadImage" id="uploadImage" onchange="PreviewImage();"></li>
          
          
          <!-- <br><input name="pic" id="pic" type="text"  value = "${memberModi.memberPic }"></li> -->
      	<li><input type ="submit" value = "수정"></li>
      </ul>
       </form>
	</div>

<script>
	function PreviewImage() {
		var preview = new FileReader();

		preview.onload = function(e) {
			document.getElementById("profile_image").src = e.target.result;
		};

		preview.readAsDataURL(document.getElementById("uploadImage").files[0]);
	};
</script>	
</body>
</html>