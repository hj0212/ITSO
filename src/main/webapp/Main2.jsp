<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
	width: 100px;
	bottom: 100px;
	display: none;
	z-index: 999;
	background-color: black;
	color: white;
	text-align: center;
}

/* ---------------- 모달 스타일 ------------------*/
#collectionarea {
	text-align: center;
}

@media ( max-width : 575px) {
	.collectionItem {
		width: 80%;
	}
}

@media ( min-width : 576px) and (max-width: 991px) {
	.collectionItem {
		width: 50%;
		float: left;
	}
}

@media ( min-width : 991px) {
	.collectionItem {
		width: 30%;
	}
}

.collectionItem {
	display: inline-block;
	margin: 0 auto !important;
	background: white;
}

.collectionItem:hover {
	transform: scale(1.05);
	transition: all 0.1s ease-in-out;
}

.collectionPhoto {
	width: 100%;
	height: auto;
}

.collectionPhoto td {
	height: overflow: hidden;
}

.collectionPhoto img {
	width: 100%;
}

.active {
	border: 3px solid #21FCFF;
}
</style>
</head>

<body>

	<%@include file="navi.jsp"%>

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
						href="main2.jsp">Tumbnail view</a>
				</div>
			</div>
		</div>
		</section>

		<!-- 드랍박스메뉴종료 -->

		<!-- 포토컨테이너시작 -->


		<section class="thirdSection col-md-12">


		<div class="gridPhotoContainer row">
<script>console.log("${empty socialList }");</script>
			<c:choose>
				<c:when test="${fn:length(socialList) > 0}">
					<c:forEach items="${socialList}" var="list">

						<div class="gridPhoto col-lg-3 col-md-12 mb-3">
							<a href="#"> <img src="resources/images/background.jpg"
								class="img-fluid z-depth-2" alt="Responsive image">
							</a>
							<div class="photoContainer">
								<div class="photoContainerHover z-depth-2">
									<h1 class="photoContainerHoverTitle">${list.social_title}</h1>
									<p class="photoContainerHoverWriter">by
										${list.social_writer}</p>
									<!-- <img src="resources/images/background.jpg"
										class="img-fluid z-depth-2" alt="Responsive image"
										onclick="location='main.jsp'"> -->
									<img src="upload/social/${list.photo}"
										class="img-fluid z-depth-2" alt="Responsive image"
										onclick="location='main.jsp'">
									<button class="photoContainerButton1 btn btn-elegant"
										id="hypeBtn1" onmouseover="hypeOn()" onmouseout="hypeOut()"
										data-hover="+1">HYPE</button>
									<a href="" class="photoContainerButton2 btn btn-elegant"
										data-toggle="modal" data-target="#saveModal">save</a>
									<div class="photoContainerHoverHashTag">
										<P>
											<span onclick="hashtag()">해쉬태그올곳</span>
										</P>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="3">게시글이 없습니다,</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		</section>
		<!-- 포토컨테이너종료 -->

		<!-- top버튼 시작 -->
		<a id="MOVE_TOP_BTN" href="#">TOP</a>
		<!--  top버튼 종료 -->

		<!-- saveModal -->
		<div class="modal fade" id="saveModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<!--Content-->
				<div class="modal-content">
					<!--Header-->
					<div class="modal-header">
						<p class="heading lead mb-0">컬렉션으로 저장하기</p>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<!--Body-->
					<div class="modal-body">
						<div id="modalbtnarea">
							<button class="btn btn-itso" data-toggle="modal"
								data-target="#createModal">
								<i class="fas fa-plus"></i> 컬렉션 생성
							</button>
							<button class="btn btn-outline-itso waves-effect"
								data-dismiss="modal">컬렉션 수정</button>
						</div>

						<c:choose>
						<c:when test="${not empty collectionList }">
						<div id="collectionarea" class="mt-2">
							<c:set var="num" value="0"></c:set>
							<c:forEach items="${collectionList}" var="clist" varStatus="status">
							<div class="collectionItem z-depth-1 mx-2">
								<h4 class="mt-1 mb-1">${clist.collection_title }</h4>
								<h6>${clist.collection_contents }</h6>
								<table class="collectionPhoto" border="1">
									<tr>
										<td><img src="/upload/social/${clist.photo }" alt=""></td>
										<td><img src="/upload/social/${clist.photo }" alt=""></td>
									</tr>
									<tr>
										<td><img src="/upload/social/${clist.photo }" alt=""></td>
										<td><img src="/upload/social/${clist.photo }" alt=""></td>
									</tr>
								</table>
								<h6 class="mb-0" style="height: 19px;"></h6>
							</div>
							</c:forEach>
						</div>
						</c:when>
						<c:otherwise>
						<p class="mt-1 mb-0">생성된 컬렉션이 없습니다.</p>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!--/.Content-->
			</div>
		</div>


		<!-- createModal -->
		<div class="modal fade" id="createModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm" role="document">
				<!--Content-->
				<div class="modal-content">
					<!--Header-->
					<div class="modal-header">
						<p class="heading lead mb-0">컬렉션 생성</p>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<!--Body-->
					<div class="modal-body">
						<div class="md-form">
							<input type="text" id="inputMDEx" class="form-control"> <label
								for="inputMDEx">컬렉션 이름</label>
						</div>
						<div class="md-form">
							<textarea type="text" id="form7" class="md-textarea form-control"
								rows="3"></textarea>
							<label for="form7">컬렉션 상세 설명</label>
						</div>
					</div>

					<!--Footer-->
					<div class="modal-footer justify-content-center">
						<button class="btn btn-itso" data-toggle="modal"
							data-target="#modal">생성</button>
						<button class="btn btn-outline-itso waves-effect"
							data-dismiss="modal">취소</button>
					</div>
				</div>
				<!--/.Content-->
			</div>
		</div>

		<!-- Button trigger modal -->
		<div class="text-center"></div>
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
	
	$("#collectionarea").on("click", ".collectionItem", function() {
        /*$(this).css("background", "black");*/
        $(this).children(".check").toggleClass('active');
    })

    $("#createModal").on('show.bs.modal', function() {
        $("#saveModal").hide();
    });

    $("#createModal").on('hidden.bs.modal', function() {
        $("#saveModal").show();
    });
</script>


</html>