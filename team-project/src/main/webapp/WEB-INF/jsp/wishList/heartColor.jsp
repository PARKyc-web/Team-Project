<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty memberId }">
		<script type="text/javascript">
			alert("로그인이 필요한 기능입니다.");
			location.href = '/teamProject/memberJoin.do';
		</script>
	</c:if>
	
	<script type="text/javascript">
		if ("${heartColor}" == 0) {
			alert("위시리스트에서 삭제되었습니다.");
		} else {
			alert("위시리스트에 등록되었습니다.");
		}
		location.href = document.referrer;
	</script>
</body>
</html>