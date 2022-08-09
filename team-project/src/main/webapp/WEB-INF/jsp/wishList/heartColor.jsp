<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		if ("${heartColor}" == 1) {
			alert("위시리스트에 등록되었습니다.");
		} else {
			alert("위시리스트에서 삭제되었습니다.");
		}
		//history.back();
	</script>
</body>
</html>