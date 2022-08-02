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
	
	<form method = "post" name = "">
	</form>
	      <ul>
        <li><label for="id" >아이디 : </label>
          <input size="10" id ="id" type="text" value = "${memberInfo.memberId }" readonly></li>
        <li><label for="name">이름 : </label>
          <input id ="name" type="text" value = "${memberInfo.memberName }" readonly></li>
        <li><label for="age">나이 : </label>
          <input id = "age" type="text" value = "${memberInfo.memberAge }" readonly></li>
        <li><label for="call">전화번호 : </label>
          <input id ="call" type="tel" value = "${memberInfo.phone }"></li>
        <li><label for="mail">이메일 : </label>
          <input id ="mail" type="email" value = "${memberInfo.email }"></li>
        <li><label for ="date">가입날짜 : </label>
          <input size="date" type="text" value = "${memberInfo.signInDate }"></li>
        <li><label for="pic">사진 : </label>
          <input id="pic" type="url"  value = "${memberInfo.memberPic }"></li>
      
      	<li><input type ="submit" value = "수정"></li>
      </ul>
       
	
	
</body>
</html>