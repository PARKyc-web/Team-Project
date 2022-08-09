<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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

<body>
<div id="container">
	<h2>마이페이지</h2>
           
       <form action="${pageContext.request.contextPath }/myPageModi.do" method="post">
	       	<fieldset>
				<legend>개인정보</legend>
			</fieldset>		        
       <ul>
	        <li><label for="id"></label>  
	        	<img src="${memberInfo.memberPic}" onError="image/hotel_default.webp"
	        		 width="200px" height="200px" id="profile_image"></li>
			<li><label for="id">아이디 : </label>
	        <input type="text" name ="bid" value=" ${memberInfo.memberId }" readonly>
	      	      
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
	        <li><input type="submit" value ="수정"></li>    
        </ul>
        
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
      
      <jsp:include page = "myHome.jsp"></jsp:include>
      </div>
</body>
