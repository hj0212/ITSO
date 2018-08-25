<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--   ---------CDN 모음 ------------------------------------------  -->
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   ---------CDN 모음 끝------------------------------------------  -->
<style>
div {
	/* border: 1px solid black; */
	box-sizing: border-box;
}

body {
	margin: 0px;
	font-family: 'NanumbarunpenR';
	font-size: 20px;
}

@font-face {
	font-family: 'NanumbarunpenR';
	src: url('resources/fonts/nanumbarunpenr.ttf') format('truetype');
}

@font-face {
	font-family: 'NanumbarunpenB';
	src: url('resources/fonts/nanumbarunpenb.ttf') format('truetype');
}

#wrapper {
	width: 100%;
}

#voteitemimg {
	width: 10%;
}

#voteitemdiv {
	width: 100%;
}

img {
	border: 0.3px solid lightgray;
	text-align: center;
	vertical-align: middle;
}

input[type="file"] {
	border: 0px;
}

#voteitemimg, .selimg {
	width: 100px;
	height: 100px;
}

.imgsel {
	width: 70%;
}

.btnsdiv a {
	box-shadow: 0px;
	width: 10%;
}

#MOVE_TOP_BTN {
	position: fixed;
	right: 5%;
	width: 50px;
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
	<%@include file="navi.jsp"%>
	<div class="row my-5"></div>
	<div id="wrapper" class="container-fluid col-md-8">
		<h4 class="">오늘 뭐 입지? <button class="btn btn-indigo btn-sm float-right" type="button" id="writevotebtn">글
				쓰기</button></h4>
		
		<hr />
		<div class="row my-2">
			<c:choose>
				<c:when test="${fn:length(svdtos) > 0}">

					<c:forEach var="svdto" items="${svdtos}" varStatus="status">
						<!-- Card -->
						<div class="col-sm-3 px-1 mb-4">
							<div class="card">
								<!--Card image-->
								<div class="view overlay view-cascade ">
									<img class="card-img-top"
										src="upload/stylingvote/${svdto.photo}" alt="titlephoto"
										id="titleimg" /> <a href="#!">
										<div class="mask rgba-white-slight"></div>
									</a>
								</div>

								<!--Card content-->
								<div class="card-body">

									<!--Title-->
									<h4 class="card-title">${svdto.styling_title}</h4>
									<!--Text-->
									<p class="card-text">
										<a class="text-muted amber-text">${svdto.styling_writername}</a>
										<a><i class="fa mr-2 fa-comment amber-text"
											aria-hidden="true"></i>82</a> <a><i class="fa mr-2 fa-eye"
											aria-hidden="true"></i>${svdto.styling_viewcount}</a> 
									</p>
									<p class='card-text'>		
											<a class="text-muted amber-text">${svdto.styling_writedate}</a>
									</p>
									<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
									<button type="button" class="btn btn-light-blue btn-md gobtn">투표
										보기</button>
									<input type="hidden" value="${svdto.styling_vote_seq}">
								</div>
							</div>
						</div>
						<!-- Card -->

					</c:forEach>


					<!-- Card 한개..-->
					<!-- 	<div class="card mb-4 col-sm-4">
						Card image
						<div class="view overlay">
							<img class="card-img-top"
								src="https://mdbootstrap.com/img/Photos/Others/images/14.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						Card content
						<div class="card-body">

							Title
							<h4 class="card-title">Card title</h4>
							Text
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							Provides extra visual weight and identifies the primary action in a set of buttons
							<button type="button" class="btn btn-light-blue btn-md">Read
								more</button>
						</div>
					</div>
				 -->
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="3">게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="row my-2">
			<!-- <button class="btn btn-indigo" type="button" id="writevotebtn">글
				쓰기</button>
			<a href="#top" class="btn btn-indigo ml-auto"></a> -->
		</div>
		<div class="row">
			<div class="md-form form-lg col-md-12 my-2"></div>
		</div>
	</div>
	<div class="col-md-2 offset-md-10">
	<a id="MOVE_TOP_BTN" href="#"><i class="fa fa-arrow-up my-1" aria-hidden="true"></i></a>
	</div>

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
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		document.oncontextmenu = function(e) {
			return false;
		};

		$('#writevotebtn').click(function() {
			
			if("${sessionScope.user.seq ne null}"){
				location.href = "voteStyling.go";
			}else{
				location.href="login.go";
			}
			
		});

		$('.gobtn').click(function() {
			var seq = $(this).next('input').val();
			location.href = "readStylingVote.style?styling_vote_seq=" + seq;
		})
		
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

</body>
</html>