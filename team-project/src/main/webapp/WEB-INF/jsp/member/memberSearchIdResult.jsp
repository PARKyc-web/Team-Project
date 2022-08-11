<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
	body{
		overflow-x:hidden;
		overflow-y:hidden;
		color:#292929;
	}
	#container{
		padding:10%;
	}
	h3{
		padding:5%;
	}
	.input-style{
	  width:50%;
	  padding:15px;
	  font-size:15px;
	  font-weight:bold;
	  border:3px solid #fc777b;
	  background-color: #fffff;
	  border-radius:90px;
	  text-align:center;
	  box-shadow: 1px 1px 2px #e6e6e6;
	}
	hr{
		margin: 0 auto;
		text-align:center;
		width:70%;
	}
	#result{
		text-align:center;
		margin: 0 auto;
		padding-top:15%;
		font-size:20px;
	}
	#big{
		font-weight:bold;
		font-size:25px;
	}
	

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}

	
</style>
</head>
<body>


<div id ="container">

		<form id="check" name="login" action="memberRealSearchId.do" method="post" style="margin:0px auto; text-align:center">
				<h3>아이디 찾기</h3>
				<input class="input-style" type="text" id="email" name="email" placeholder="이메일을 입력하세요"><br><br>
				
				<button type="submit" class="submit" onclick="location.href='memberRealSearchId.do'">검색</button> 
				
		</form>
		</div>
<c:if test="${vo eq null }">
	<hr>
	<div id="result">
	<span class="material-symbols-outlined">sentiment_very_dissatisfied</span>
	<h3>해당 이메일로 검색된<br>아이디가 없습니다.</h3>
	</div>
</c:if>

<c:if test="${vo ne null }">
	<hr>
    <div id="result">회원님의 아이디는 <br><span id="big">${vo.memberId }</span><br>입니다.</div>
</c:if>
</body>
</html>
