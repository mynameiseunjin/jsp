<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div align="center">
	<br>
	<div><h1>회원목록</h1></div>
	<div>
		<c:forEach items="${members }" var="m">
			${m.memberId }: ${m.memberName }<br> 
		</c:forEach>
	</div>
</div>

</body>
</html>