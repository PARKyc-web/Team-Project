<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginSession</title>
</head>
<body>
	<%
	String id = request.getParameter("member_id");
	String pw = request.getParameter("member_password");
	
	String dbid = "user1";
	String dbpwd = "1111";
	
	if(dbid.equals(id)){
		if(dbpwd.equals(pw)){
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
		}
		else{
			//비번오류
			response.sendRedirect("로그인실패.jsp");
		}
	}else{
		//없는아이디
		response.sendRedirect("로그인실패.jsp");
	}
	%>
</body>
</html>