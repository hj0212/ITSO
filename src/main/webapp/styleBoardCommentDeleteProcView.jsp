<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comment Delete Proc View</title>
</head>
<body>
	<c:choose>
 		<c:when test="${commetResult>0}">
 			<script>
 				alert("댓글 삭제 성공");
 				location.href="main.go";	
 			</script>
 		</c:when>
 			<c:otherwise>
 				<script>
 					alert("댓글 삭제 실패");
					location.href="main.go";	
 				</script>
 		</c:otherwise>
	</c:choose>
</body>
</html>