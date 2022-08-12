<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
body{
	background-image:url('image/bg.jpg');
	background-repeat: no-repeat;
  	background-position: center;
  	background-size: cover;
}
#container{
	width: 70%;
	margin: 0 auto;
	padding: 5%;
	text-align: center;
	position:relative;
	margin-top:4%;
	background-color: rgba( 255, 255, 255, 0.95 );
	border: 1px solid #f2f2f2;
	border-radius:10px;
	box-shadow: 1px 1px 2px #f0f0f0;

}

#pic{
display:inline-block;
width:60%;
}
#comment{
padding:20px;
}
#submit {
  width:25%;
  padding:15px;
  color: #fff;
  font-size:15px;
  font-weight:bold;
  border:none;
  background-color: #dbdbdb;
  border-radius:90px 0px 0px 90px;
  margin-bottom:3%;
}

#submit-r {
  width:25%;
  padding:15px;
  color: #fff;
  font-size:15px;
  font-weight:bold;
  border:none;
  background-color: #fc777b;
  border-radius:0px 90px 90px 0px;
  margin-bottom:3%;
}

#submit-r:hover{
background-color:#fa5055;
margin-bottom:3%;
}

</style>
</head>
<body>

<div id="container">
<div id="comment">
<h3>정말 AirDnD에서 탈퇴하시겠습니까?</h3>
<h4>멋진 숙소들이 기다리고 있습니다 !</h4>
</div>
<form action="myMemberDelete.do" id="form">
<input id="submit" type="submit" value="네, 탈퇴할래요">&nbsp;<button id="submit-r" type="button" onclick="location.href='myPage.do'">아니오, 탈퇴 안함</button>
<br><br>
</form>

		<div id="pic">
			<c:forEach var="i" begin="0" end="0" step ="1" >
				<div class="slider">
					<c:forEach var="inner" items="${pic_list[i]}">
				
						<img class="card-img-top" 
							 src="${inner.path}${inner.name}"  alt="main-page-image" />
					</c:forEach>
				</div>
			</c:forEach>
		</div>
</div>
</body>
</html>