<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.firstContainer {
	height: 100vh;
	margin: auto;
}

.firstSection .mainIntro {
	text-align: center;
	padding: 20px;
	font-weight: 300;
	border-bottom: 1px solid rgb(183, 177, 206);
	line-height: 30px;
	background-image: url("resources/images/background.jpg");
}

.firstSection .mainIntro strong {
	font-weight: 600;
}

.secondSection .container {
	text-align: right;
}

.secondSection .container .btn {
	background-color: white;
	color: black;
	box-shadow: none !important;
}

.dropdown-menu :hover {
	background-color: black;
	color: white;
}

.droptxt1 {
	font-size: 10px;
}

.droptxt2 {
	font-size: 13px;
}

.dropdown-menu {
	border: 1px solid black;
}

.thirdSection .gridPhotoContainer {
	padding: 20px;
}

.thirdSection .row .gridPhoto {
	vertical-align: middle;
	z-index: auto;
	/* position: relative; */
	width: 280px;
	height: 280px;
	margin: auto;
}

.thirdSection .row .gridPhoto img {
	max-width: 100% \9;
	height: auto;
	object-fit: contain;
}

.thirdSection .row .gridPhoto .photoContainer {
	visibility: hidden;
}

.thirdSection .row .gridPhoto:hover .photoContainerHover {
	visibility: visible;
	z-index: 41;
	position: absolute;
	width: 320px;
	height: 450px;
	border: 1px solid antiquewhite;
	background-color: white;
	margin-top: -300px;
	margin-left: -25px;
	padding: 30px;
}

.thirdSection .row .gridPhoto .photoContainer h1 {
	margin-left: 6px;
}

.thirdSection .row .gridPhoto .photoContainer .photoContainerHoverWriter
	{
	color: rgb(183, 177, 206);
	font-size: 15px;
	margin-top: -10px;
	margin-left: 4px;
}

.thirdSection .row .gridPhoto .photoContainer img {
	width: 250px;
	height: 250px;
	object-fit: contain;
	margin-top: -15px;
	margin-left: 5px;
	box-shadow: none;
	border: 1px solid black;
	cursor: pointer;
}

.thirdSection .row .gridPhoto .photoContainer .photoContainerButton1 {
	border: none;
	background-color: black;
	color: white;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	display: inline-block;
	font-size: 11px;
	line-height: 10px;
}

.thirdSection .row .gridPhoto .photoContainer .photoContainerButton2 {
	border: none;
	background-color: black;
	color: white;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	display: inline-block;
	font-size: 11px;
	line-height: 10px;
	margin-left: -5px;
}

.thirdSection .row .gridPhoto .photoContainer .photoContainerHoverHashTag
	{
	color: rgb(27, 126, 240);
	cursor: pointer;
}

a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	width:100px;
	bottom: 100px;
	display: none;
	z-index: 999;
	background-color: black;
	color: white;
	text-align: center;
}
</style>
</head>

<body>

	<div class="firstContainer col-md-8">

		<!-- 메인인트로시작 -->

		<section class="firstSection col-md-12">
		<div class="mainIntro">
			<p>
				<strong>HYPE</strong> the looks you like, and <strong>+FAN</strong>
				the people you like to personalize you feed.
			</p>
		</div>
		</section>

		<!-- 메인인트로종료 -->

		<!-- 드랍박스메뉴시작 -->

		<section class="secondSection col-md-12">
		<div class="container">
			<div class="btn-group">
				<button class="btn btn-sm dropdown-toggle droptxt1" type="button"
					data-toggle="dropdown" aria-haspopup="true" aria=expanded="false">Full
					view</button>
				<div class="dropdown-menu">
					<a class="dropdown-item flex-center droptxt2" href="main.jsp">Full
						view</a> <a class="dropdown-item flex-center droptxt2"
						href="Main2.jsp">Tumbnail view</a>
				</div>
			</div>
		</div>
		</section>

		<!-- 드랍박스메뉴종료 -->

		<!-- 포토컨테이너시작 -->

		<section class="thirdSection col-md-12">
		<div class="gridPhotoContainer row">

			<div class="gridPhoto col-lg-3 col-md-12 mb-3">
				<a href="#"> <img src="resources/images/background.jpg"
					class="img-fluid z-depth-2" alt="Responsive image">
				</a>
				<div class="photoContainer">
					<div class="photoContainerHover z-depth-2">
						<h1 class="photoContainerHoverTitle">TITLE</h1>
						<p class="photoContainerHoverWriter">by 작성자</p>
						<img src="resources/images/background.jpg"
							class="img-fluid z-depth-2" alt="Responsive image"
							onclick="location='main.jsp'">
						<button class="photoContainerButton1 btn btn-elegant"
							id="hypeBtn1" onmouseover="hypeOn()" onmouseout="hypeOut()"
							data-hover="+1">HYPE</button>
						<button class="photoContainerButton2 btn btn-elegant"
							id="hypeBtn2">default</button>
						<dlv class="photoContainerHoverHashTag">
						<P>
							<span onclick="hashtag()">해쉬태그올곳</span>
						</P>
						</dlv>
					</div>
				</div>
			</div>

		</div>
		</section>

		<!-- 포토컨테이너종료 -->
		
		<!-- top버튼 시작 -->

		<a id="MOVE_TOP_BTN" href="#">TOP</a>

		<!--  top버튼 종료 -->
	</div>


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
	const hypeBtn1 = document.getElementById("hypeBtn1");
	let hypeBtn2 = document.getElementById("hypeBtn2");

	// HYPE버튼에 마우스 대면 옆에쪽 버튼에 +1 시키기
	function hypeOn() {
		hypeBtn2.innerHTML = "+1";
	}
	//기본디폴트설정
	function hypeOut() {
		hypeBtn2.innerHTML = "default";
	}
	function hashtag() {

	}

	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>


</html>