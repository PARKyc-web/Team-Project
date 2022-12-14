
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>숙소 예약 내역</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
body{

font-family: 'Noto Sans KR', sans-serif;
	/*background-image:url('image/bg2.jpg');*/
		background-repeat: no-repeat;
  		background-position: center;
  		background-size: cover;
}
#container{
	
	    width: 80%;
        background-color: rgba( 255, 255, 255, 0.95 );
        margin: 0 auto;
        margin-top:2%;
        margin-bottom:1%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
    	
}
	#container2{
		position:relative;
		width: 60%;
		margin : 0 auto;
		flex-direction : row;
		padding: 2%;
		text-align:center;
	}
	#container2:hover{
		border-left: 4px solid #fc777b;
	}
	h3{
		text-align: center;
		margin: 0 auto;
		position:relative;
		padding-bottom:1%;
	}
	h4 {
	text-align: center;
}
	
	ul{
		list-style: none;
	}
	ul li{
		clear: both;
	}
	.field{
		float: left;
		width: 100px;
		font-size: bold;
		line-height: 55px;
		text-align: center;
		margin-right: 15px;
	}
	input{
		text-align:center;
	}
	input[type="submit"]{
		float: right;
		border: 1px rgb(34, 160, 87);
		border-radius: 12px;
		background-color: #fc777b;
		font-weight: bold;
		color : white;
		padding:1%;
		
	}
	
	button{
		float: right;
		border: 1px rgb(34, 160, 87);
		border-radius: 12px;
		background-color: orange;
		font-weight: bold;
		color : white;
		padding:1%;
	}
	input[type="text"]{
		border: none;
		width: 450px;
		padding-top: 15px;
	}

	input[type="text"]:focus{
		outline : none;
	}
	
	#card{
		margin: 0 auto;
	}
	hr{
		margin: 0 auto;
		width: 80%;
		color: #cccccc;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	 a{
    	color:gray;
    	text-decoration:none;
    }
    a:hover{
    	color:gray;
    }
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 700,
  'GRAD' 0,
  'opsz' 48;
  font-size: 50px;
}	
</style>
</head>
<body>
<div id="container">
	<h6><a href='myPageMain.do'>마이페이지</a>&nbsp; > &nbsp;<a href='#'>예약 내역</a></h6>
	<h3>숙소 예약 내역</h3>
	<hr>
		<c:choose>
		<c:when test="${size eq 0}">
			<h4>예약된 내역이 없습니다</h4>
			
		</c:when>
		<c:otherwise>
<c:set var="vo" value="${reservation }"></c:set>

		<c:forEach var="i" begin="0" end="${size-1}" step="1">
			<div id="container2">
				<form action="${pageContext.request.contextPath }/myReviewWriter.do"
					method="post">
					<ul>
						<li><label for="name" class="field"><b>숙소이름</b>  </label> <input
							name="name" size="10" id="id" type="text"
							value="${vo[i].hotelName }" readonly></li>
						<li><label for="in" class="field"><b>체크인</b>  </label> <input
							name="in" type="text" value="${vo[i].inDate }" readonly></li>
						<li><label for="out" class="field"><b>체크아웃</b>  </label> <input
							name="out" id="mail" type="text" value="${vo[i].outDate }"
							readonly></li>
						<li><label for="cost" class="field"><b>지불금액</b>  </label> <input
							name="cost" id="pic" type="text" value="${vo[i].totalPrice }"
							readonly> <input type="hidden" name="hotelId"
							value="${vo[i].hotelId}"> <input type="hidden"
							name="memberId" value="${vo[i].memberId}"></li>

						<li><input type="hidden" name="reservationId" id="reservationId"
							value="${vo[i].reservationId}">
							<c:set var="id" value="${vo[i].reservationId}"></c:set>
							<script type="text/javascript">
									arr.push = ${vo[i].reservationId};
									
									function clickDelete(hotelNum) {
										if (confirm("정말로 예약을 취소하시겠습니까?")) {
											location.href = "deleteReservation.do?reservationId="
													+ hotelNum;
										}
									}
								</script>

							</li>

						<c:choose>
							<c:when test="${vo[i].isReserv ne 4 and canWrite[i]}">
								<li><input type="submit" value="리뷰작성"></li>
							</c:when>

							<c:when test="${vo[i].isReserv eq 4 }">
								<li><input type="submit" value="리뷰작성완료" disabled></li>
							</c:when>
							<c:when test="${vo[i].isReserv ne 4 and !canWrite[i]}">
								<button id="submit" type="button" onclick="clickDelete(${vo[i].reservationId})">예약취소하기</button>
							</c:when>
						</c:choose>
					</ul>
				</form>
			</div>
		</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>