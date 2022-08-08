<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 	  font-family: Georgia, "맑은 고딕", serif;
 	 #container{
        width: 800px;
        margin: 0 auto;
    }
    h2{
        text-align: center;
        font-family: Georgia, "맑은 고딕", serif;
    }
    legend{
    	margin: 0 auto;
    }
    ul{
        list-style: none;
       
    }
    ul li {
        clear: both;
        text-align: center;
    }
       input[type="text"]{
       
        width: 500px;
        height: 40px;
        border: 2px solid #fc777b;
        border-radius: 20px;
        padding: 5px;
        margin: 10px 0;


    }
    input[type="submit"]{
    	padding : right 100px;
    	
    jsp:include.class{
     text-align: center;
    }
    	
    
</style>
</head>
<body>
<div id="container">
	<h2>마이페이지</h2>
	<fieldset>
	<legend>개인정보</legend>
        
    <ul>
       <form action="${pageContext.request.contextPath }/myPageModi.do" method="post">
		<li><label for="id">아이디 : </label>
        <input type="text" name ="bid" value=" ${memberInfo.memberId }" readonly>
        <input type="submit" value ="수정"></li>
      
        <li><label for="id">이름 : </label>
        <input type="text" name ="name" value="${memberInfo.memberName }" readonly></li>
        <li><label for="id">나이 : </label>
        <input type="text" name ="age" value="${memberInfo.memberAge }" readonly></li>
        <li><label for="id">연락처 : </label>
        <input type="text" name ="phone" value="${memberInfo.phone }" readonly></li>
        <li><label for="id">이메일 : </label>
        <input type="text" name ="email" value="${memberInfo.email }" readonly></li>
        <li><label for="id">가입일 : </label>
        <input type="text" name ="date" value="${memberInfo.signInDate }" readonly></li>
        <li><label for="id">사진 : </label>    
        <input type="text" name ="pic" value="${memberInfo.memberPic }" readonly></li>
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
      </fieldset>
      <jsp:include page = "myHome.jsp"></jsp:include>
      </div>
</body>
</html>