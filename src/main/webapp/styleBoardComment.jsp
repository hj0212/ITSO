<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css"
	rel="stylesheet">
<style>
@font-face {
	font-family: 'NanumbarunpenR';
	src: url('resources/fonts/nanumbarunpenr.ttf') format('truetype');
}

@font-face {
	font-family: 'NanumbarunpenB';
	src: url('resources/fonts/nanumbarunpenb.ttf') format('truetype');
}

body {
	font-family: 'NanumbarunpenR';
}

#wrapper {
	min-height: 100%;
	width: 980px;
	margin: 0 auto;
}

.vertical-align-none {
	vertical-align: -50%;
}

#snsLists {
	display: inline;
}

.chevrons {
	display: inline;
}

.inline-block {
	display: inline-block;
}

.block {
	display: block;
}

.list-style-none {
	list-style-type: none;
}

.info {
	list-style-type: none;
	display: inline-block;
	padding: 10px;
}

.avatar {
	width: 64px;
	height: 64px;
	display: inline;
}

#lookAction {
	border-bottom: 1px #9AA9B2 solid;
}

.comment-child-border {
	border-left: 1px #e6e6e6 solid;
}

.border-bottom-line {
	border-bottom: 1px #9AA9B2 solid;
}

.comment-child {
	margin-top: 15px;
	margin-left: 32px;
}

.brand-icon {
	width: 64px;
}

#wrapper a, a:hover {
	color: black;
}

#right-side {
	width: 30%;
	display: inline-block;
}

#left-side {
	width: 70%;
	display: inline-block;
}
</style>
</head>

<body>

	<!-- 리플박스 시작 -->

	<div class="container mt-4">
		<table id="comment">
			<tbody>
				<tr>
					<td><img class="avatar rounded-circle z-depth-1-half mr-3"
						src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg">
					</td>
					<td>
						<div>
							<a href="#">Risovic N.</a> <a href="#">@risovic</a>
						</div>
						<div>Nice dress, color, and the vibe</div>
						<div id=comment>
							0 <a href="#">▲</a>· reply · flag · 6 months ago
						</div>

					</td>
				</tr>


				<tr>
					<table>
						<tr>
							<td>
								<div class="comment-child">
									<img class="ml-4 avatar rounded-circle z-depth-1-half mr-3"
										src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg">
								</div>
							</td>
							<td></td>
							<td>
								<div>
									<a href="#">Alex X.</a> <a href="">@Alex</a>
								</div>
								<div>How sweet of her.</div>

								<div id=comment>
									2 <a href="#">▲</a· reply>· flag · 6 months ago 
								</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="comment-child">
									<img class="ml-4 avatar rounded-circle z-depth-1-half mr-3"
										src="https://mdbootstrap.com/img/Photos/Avatars/avatar-10.jpg">
								</div>
							</td>
							<td></td>
							<td>
								<div>
									<a href="#">Lauren A.</a> <a href="">@Lauren</a>
								</div>
								<div>I envy her body ratio</div>

								<div id=comment>
									5 <a href="#">▲</a>· reply· flag · 6 months ago
								</div>
							</td>
						</tr>
					</table>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 리플박스종료 -->
	<!--  리플시작 -->
	<form action="" method="post">
		<div class="container mt-4">
			<div class="form-group">
				<textarea class="form-control rounded-0"
					id="exampleFormControlTextarea2" rows="3" placeholder="댓글 달기"></textarea>

				<!-- Default inline 1-->

				<div class="custom-control custom-checkbox custom-control-inline">

					<input type="checkbox" class="custom-control-input"
						id="defaultInline1"> <label class="custom-control-label"
						for="defaultInline1">페이스북</label>
				</div>

				<!-- Default inline 2-->
				<div class="custom-control custom-checkbox custom-control-inline">
					<input type="checkbox" class="custom-control-input"
						id="defaultInline2"> <label class="custom-control-label"
						for="defaultInline2">카카오톡</label>
				</div>

				<!-- Default inline 3-->
				<div class="custom-control custom-checkbox custom-control-inline">
					<input type="checkbox" class="custom-control-input"
						id="defaultInline3"> <label class="custom-control-label"
						for="defaultInline3">인스타그램</label>
				</div>

				<!-- Default inline 3-->
				<div
					class="ml-4 custom-control custom-checkbox custom-control-inline">
					<input type="checkbox" class="custom-control-input"
						id="defaultInline3">
				</div>

				<button class="btn btn-grey btn-sm">쓰기</button>
			</div>
		</div>
	</form>
<!-- 리플종료 -->

</body>
<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<script>
	
</script>


</html>