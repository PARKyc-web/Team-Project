<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>회원정보 수정</h3>
	
	<form method = "post" name = "member" action="${pageContext.request.contextPath}/myPageInfoModify.do">
	
	      <ul>
        <li><label for="id" >아이디 : </label>
          <input name="id" size="10" id ="id" type="text" value = "${memberModi.memberId }" readonly></li>
        <li><label for="call">전화번호 : </label>
          <input name="call" id ="call" type="tel" value = "${memberModi.phone }"></li>
        <li><label for="mail">이메일 : </label>
          <input name="mail" id="mail" type="email" value = "${memberModi.email }"></li>
    <%--     <li><label for ="date">가입날짜 : </label>
          <input size="date" type="text" value = "${memberModi.signInDate }"></li> --%>
        <li><label for="pic">사진 : </label>
          <input name="pic" id="pic" type="text"  value = "${memberModi.memberPic }"></li>
      
      	<li><input type ="submit" value = "수정"></li>
      </ul>
       </form>
	
	
</body>
</html>