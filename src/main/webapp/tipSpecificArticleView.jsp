<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팁 보기 | ITSO</title>
</head>
<body>

<c:forEach items="${tipContent}" var="tipContent">
	<div class="container">${tipContent.tip_title}</div>
	<div>${tipContent.tip_contents}</div>
	<div>${tipContent.tip_viewcount}</div>
	<div>${tipContent.category}</div>

	<div>${tipContent.tip_writer}</div>

</c:forEach>

</body>
</html>