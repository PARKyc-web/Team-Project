<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	background-color:#fff;
	border: 1px solid #f2f2f2;
	border-radius:10px;
	box-shadow: 1px 1px 2px #f0f0f0;

}

#pic{
display:inline-block;
width:60%;
}

</style>
</head>
<body>

<div id="container">
<h3>정말 AirBnB에서 탈퇴하시겠습니까?</h3>
<h4>이런숙소도있는데??</h4>
<form action="myMemberDelete.do" id="form">
<input type="submit" value="네">&nbsp;<button type="button" onclick="location.href='myPage.do'">아니오</button>
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