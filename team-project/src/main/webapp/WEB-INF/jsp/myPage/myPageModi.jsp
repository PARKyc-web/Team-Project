<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
 	body{
		background-image:url('image/bg.jpg');
		background-repeat: no-repeat;
  		background-position: center;
  		background-size: cover;
	}
 	#container{
    	width: 800px;
        background-color:#fff;
        margin: 0 auto;
        margin-top:4%;
        margin-bottom:4%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
    }
    a{
    	color:gray;
    	text-decoration:none;
    }
    a:hover{
    	color:gray;
    }
    #bold{
    	font-weight:bold;
    }
    h3{
    	padding-top:5%;
        text-align: center;
    }
    #big{
    	font-size: 20px;
    }
    ul{
        list-style: none;
    }
    ul li {
        clear: both;
        text-align: center;
    }

    input[type="text"],[type="tel"],[type="email"]{
       	text-align:center;
        width: 250px;
        height: 40px;
        border-top:0px; border-left:0px; border-right:0px;border-bottom: 1px solid #fff;
        padding: 5px;
        margin: 10px 0;
        outline:none;
    }
    
     input[type="tel"]:hover,[type="email"]:hover{
     border-bottom: 1px solid #fc777b;
     }
    
    input[type="submit"]{
    	float : center;
    	border: 1px solid #e6e6e6;
		padding:1.5%;
		background-color: #fc777b;
		color: #fff;
		box-shadow: 1px 1px 2px #f0f0f0;
		border-radius:5px;
    }	
    #uploadImage{
    padding-left: 100px;
    }
    jsp:include.class{
     text-align: center;
    }

	#submit{
		border: 1px solid #e6e6e6;
		padding:1.5%;
		background-color: #fc777b;
		color: #fff;
		box-shadow: 1px 1px 2px #f0f0f0;
		border-radius:5px;
	}
	#submit:hover{
		background-color:#fc6d71;
	}
	#out{
		border: 1px solid #e6e6e6;
		padding:1.5%;
		background-color: #9c9c9c;
		color: #fff;
		box-shadow: 1px 1px 2px #f0f0f0;
		border-radius:5px;
	}
    	
    
</style>
</head>
<body>
<div id="container">
	<form method = "post" name = "member" 
		  action="${pageContext.request.contextPath}/myPageInfoModify.do" enctype="multipart/form-data">
		<h6><a href='myPageMain.do'>마이페이지</a>&nbsp; > &nbsp;<a href='myPage.do'>나의 정보</a>&nbsp; > &nbsp;<a href='#'>회원정보 수정</a></h6>
	      <ul>
	      <li><h3><span id="bold">회원정보 수정</span></h3></li>
          <li><br><img src="${memberModi.memberPic}" width="300px" height="300px" id="mypage_image" 
          	       name="mypage_image" onError="hotel_default.webp"></li>
          <li><br><label for="pic"></label>
          <input type="file" accept="image/*" name="uploadImage" id="uploadImage" onchange="PreviewImage();"></li>
         
          <li><br><label for="id" ><span id="bold">아이디 </span></label>
          <input name="id" size="10" id ="id" type="text" value = "${memberModi.memberId }" readonly></li>
          <li><label for="call"><span id="bold">전화번호  </span></label>
          <input name="call" id ="call" type="tel" value = "${memberModi.phone }"></li>
          <li><label for="mail"><span id="bold">이메일  </span></label>
          <input name="mail" id="mail" type="email" value = "${memberModi.email }"></li>
          <li><br><input type ="submit" value = "수정">&nbsp;<input type ="reset" id="out" value = "취소"></li>
      </ul>
       </form>
	</div>

<script>
$("#uploadImage").on('change',function(){
	  var fileName = $("#uploadImage").val();
	  $(".upload-name").val(fileName);
	});

	function PreviewImage() {
		var preview = new FileReader();

		preview.onload = function(e) {
			document.getElementById("mypage_image").src = e.target.result;
		};

		preview.readAsDataURL(document.getElementById("uploadImage").files[0]);
	};
</script>	
</body>
</html>