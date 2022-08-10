<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
    input[type="text"]{
        float: left;
        width: 100px;
        height: 20px;
        border: 2px solid #fc777b;
        border-radius: 5px;
        padding: 5px;
        margin: 10px 0;


    }
</style>
</head>
<body>

	<h3>마이페이지</h3>
	
    <ul>
        <li><label for="id" >개인정보 : </label><br><br>
       <form action="${pageContext.request.contextPath }/myPageModi.do" method="post">
	
        <input type="text" name ="bid" value="${memberInfo.memberId }" readonly>
        <input type="submit" value ="수정"><br>
        
        <input type="text" name ="id" value="${memberInfo.memberId }" readonly><br>
        <input type="text" name ="name" value="${memberInfo.memberName }" readonly><br>
        <input type="text" name ="age" value="${memberInfo.memberAge }" readonly><br>
        <input type="text" name ="phone" value="${memberInfo.phone }" readonly><br>
        <input type="text" name ="email" value="${memberInfo.email }" readonly><br>
        <input type="text" name ="date" value="${memberInfo.signInDate }" readonly> <br>       
        <input type="text" name ="pic" value="${memberInfo.memberPic }" readonly><br>
        </form>
<%--        <li> <label for="id" >내가 쓴 리뷰 : </label><br><br>
       
        <input type="text" name ="review" value="${review.hotelId }" readonly><br>
        <input type="text" name ="review" value="${review.reviewDate }" readonly>
        <input type="text" name ="review" value="${review.reviewContents }" readonly><br>
        
        <li><label for="id" >숙박 내역 : </label><br><br>
        
        <input type="text" name ="hotel" value="${hotel.hotelName }" readonly><br>
        <input type="text" name ="hotel" value="${reservation.inDate }" readonly>~
        <input type="text" name ="hotel" value="${reservation.outDate }" readonly><br>
        <input type="text" name ="hotel" value="${hotel.hotelPrice }" readonly><br>

       <li> <label for="id" >위시리스트 : </label><br><br>
        
        <input type="text" name ="hotel" value="${wish_list.hotelId }" readonly><br>
      --%>   
   
     <!-- 
      	<input type ="submit" value = "내가 쓴 리뷰">
      	<input type ="submit" value = "숙박내역">
      	<input type ="submit" value = "위시리스트"> -->
      </ul>
      <jsp:include page = "myHome.jsp"></jsp:include>
</body>
</html>