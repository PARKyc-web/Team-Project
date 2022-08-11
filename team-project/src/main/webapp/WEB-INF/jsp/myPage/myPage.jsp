<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        background-color: #fff;
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
    h3{
    	padding-top:3%;
        text-align: center;
	}
	h6{
	text-align:left;
	}
    ul{
        list-style: none;
       
    }
    ul li {
        clear: both;
        text-align: center;
    }
    #bold{
    	font-weight:bold;
    }
    input[type="text"]{
       	text-align:center;
        width: 200px;
        height: 40px;
        border-top:0px; border-left:0px; border-right:0px;border-bottom: 1px solid #fff;
        padding: 5px;
        margin: 10px 0;
        outline:none;
        background-color:transparent;
    }
     input[type="text"]:hover{
     border-bottom: 1px solid #fc777b;

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

<body>
<div id="container">
           
       <form action="${pageContext.request.contextPath }/myPageModi.do" method="post">
       		<h6><a href='myPageMain.do'>마이페이지</a>&nbsp; > &nbsp;<a href='#'>나의 정보</a></h6>
       <ul>
       		<li><h3><span id="bold">나의 정보</span></h3><br><br></li>
	        <li><label for="id"></label>  
	        	<img src="${memberInfo.memberPic}" onError="image/hotel_default.webp"
	        		 width="200px" height="200px" id="profile_image"><br><br></li>
			<li><label for="id"><span id="bold">아이디</span> </label>
	        <input type="text" name ="bid" value=" ${memberInfo.memberId }" readonly>
	      	      
	        <li><label for="id"><span id="bold">이름  </span></label>
	        <input type="text" name ="name" value="${memberInfo.memberName }" readonly></li>
	        <li><label for="id"><span id="bold">나이  </span></label>
	        <input type="text" name ="age" value="${memberInfo.memberAge }" readonly></li>
	        <li><label for="id"><span id="bold">연락처  </span></label>
	        <input type="text" name ="phone" value="${memberInfo.phone }" readonly></li>
	        <li><label for="id"><span id="bold">이메일  </span></label>
	        <input type="text" name ="email" value="${memberInfo.email }" readonly></li>
	        <li><label for="id"><span id="bold">가입일  </span></label>
	        <input type="text" name ="date" value="${memberInfo.signInDate }" readonly><br><br></li>	    
	        <li><input id="submit" type="submit" value ="정보수정">&nbsp;<button type="button" id="out" onclick="location.href='myMemberDeleteOutput.do'">회원탈퇴</button></li>    
        </ul>
        
        </form>

      </div>
</body>
