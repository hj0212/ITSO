<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 결과</title>
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
<style>
#wrapper {
	min-height: 100%;
	position: relative;
	margin-bottom: 100px; /* footer height */
}

* {
	box-sizing: border-box;
}

.text-small {
	font-size: 0.75rem;
}

body {
	width: 100%;
	margin: 0px auto;
}

.gb {
	margin: 0px auto !important;
	width: 100%;
	margin-bottom: 10px !important;
}

.col-lg-4 {
	margin: 0px auto !important;
}

.follow:hover {
	background-color: #e9e9e9 !important;
}

.heart {
	cursor: pointer;
}

.share {
	cursor: pointer;
}

.share:hover {
	box-shadow: 1px 2px 2px 0px black;
}

@media ( max-width : 1100px) {
	#rightfix {
		display: none;
	}
}

@media ( max-width : 1100px) {
	#MOVE_TOP_BTN {
		visibility: hidden;
	}
}

.avatar {
	margin-bottom: 5px;
}

#rightfix {
	width: 300px;
	top: 30%;
	right: 50px;
	position: fixed;
}

.media-body {
	height: 70px;
	line-height: 70px;
	margin-top: 10px;
}

.media-body button {
	color: white;
	cursor: pointer;
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
	margin-bottom: 10px;
}

.secondSection .container .btn {
	background-color: white;
	color: black;
	box-shadow: none !important;
}

.btn-group .dropdown-menu :hover {
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

.btn-group {
	margin-left: 3px;
}

button.dropdown-toggle {
	border: 1px solid #e9e9e9;
}

#sidefooter {
	width: 100%;
	bottom: 0px;
	border-top: 2px solid black;
	text-align: center;
}

#sidefooter p {
	font-style: oblique;
}

#sidefooter p a {
	font-style: oblique;
	color: black;
}

#MOVE_TOP_BTN {
	position: fixed;
	right: 5%;
	width: 100px;
	bottom: 100px;
	display: none;
	z-index: 999;
	background-color: black;
	color: white;
	text-align: center;
}

.writerName:hover {
	color: aqua;
}

.btn-floating {
	
}

.footer-brand {
	width: 70px;
}

.hidden {
	display: none;
}

.show {
	display: block;
}
/* ---------------- 모달 스타일 ------------------*/
#collectionarea {
	text-align: center;
	overflow: auto;
	-ms-overflow-style: none;
}

::-webkit-scrollbar {
	display: none;
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
	margin: 0 auto 10px auto !important;
	background: white;
	height: 236px;
}

.collectionItem:hover {
	transform: scale(1.05);
	transition: all 0.1s ease-in-out;
}

.collectionPhoto {
	height: 100%;
	padding-left: 5px;
}

.collectionPhotoItem {
	float: left;
	display: inline;
	padding: 1px;
}

.collectionPhotoItem img {
	width: 105px;
	height: 80px; 
	overflow: hidden; 
}

#saveModal .active {
	border: 3px solid #21FCFF;
	margin-left: 1px;
}

.btn-group {
	margin-left: 3px;
}

.mainItem {
	width: 600px;
	margin: 0 auto;
	border-top: 1px solid #eee;
}

.sharebtnarea button {
	width: 30px;
	height: 30px;
}

@media ( max-width : 600px) {
	.state {
		display: none;
	}
}

#social_contents a {
	color: dodgerblue;
}

#social_contents a:hover {
	color: black;
}

#user-tab, #tag-tab, #tip-tab, #itemtag-tab {
	color: black;
}

.user-image, .user-fans, .user-looks {
	width: 10%;
}

.user-info {
	width: 70%;
}

.user-image img {
	width: 60px;
	height: 60px;
	border-radius: 50%;
}

.user-name {
	font-size: 18px;
}

.status-message {
	color: darkgray;
}

.user-fans, .user-looks {
	font-size: 18px;
}

.tip-image img {
	width: 60px;
	height: 60px;
	border-radius: 50%;
}

/* tagdiv */
.thirdSection .gridPhotoContainer {
	margin: 20px;
	/* padding: 20px; */
}

.thirdSection .row .gridPhoto {
	vertical-align: middle;
	z-index: auto;
	/* position: relative; */
	width: 280px;
	height: 280px;
	margin: auto;
	padding: 10px;
}

.thirdSection .row .gridPhoto img {
	/*
	max-width: 100% \9;
	height: auto;
	object-fit: none;
	 */
	width: 100%;
	height: 100%;
}

.thirdSection .row .gridPhoto .photoContainer {
	visibility: hidden;
	text-align: left;
}
/* hover */
.thirdSection .row .gridPhoto:hover  .photoContainerHover {
	visibility: visible;
	z-index: 41;
	position: absolute;
	width: 320px;
	height: 450px;
	border: 1px solid antiquewhite;
	background-color: white;
	margin-top: -350px;
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
	cursor: pointer;
}

@media screen and (min-width: 960px) {
	.thirdSection .row .gridPhoto {
		height: 280px;
	}
}

@media screen and (max-width: 959px) and (min-width: 850px) {
	.thirdSection .row .gridPhoto {
		width: 260px;
		height: 260px;
	}
}

@media screen and (max-width: 849px) and (min-width: 750px) {
	.thirdSection .row .gridPhoto {
		width: 240px;
		height: 240px;
	}
}

@media screen and (max-width: 749px) and (min-width: 650px) {
	.thirdSection .row .gridPhoto {
		width: 220px;
		height: 220px;
	}
}

@media screen and (max-width: 649px) and (min-width: 550px) {
	.thirdSection .row .gridPhoto {
		width: 180px;
		height: 180px;
	}
}

@media screen and (max-width: 549px) and (min-width: 450px) {
	.thirdSection .row .gridPhoto {
		height: 280px;
	}
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

.thirdSection .row .gridPhoto .photoContainer .savebtn {
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
	overflow: auto;
	-ms-overflow-style: none;
}

::-webkit-scrollbar {
	display: none;
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
	margin: 0 auto 10px auto !important;
	background: white;
	height: 236px;
}

.collectionItem:hover {
	transform: scale(1.05);
	transition: all 0.1s ease-in-out;
}

.collectionPhoto {
	height: 100%;
	padding-left: 5px;
}

.collectionPhotoItem {
	float: left;
	display: inline;
	padding: 1px;
}

.collectionPhotoItem img {
	width: 105px;
	height: 80px; 
	overflow: hidden; 
}

#savemodal .active {
	border: 3px solid #21FCFF;
	margin-left: 1px;
}

.btn-group {
	margin-left: 3px;
}

.container.dropdown-toggle {
	border: 1px solid #e9e9e9;
}

.photoContainerHoverWriter a, .photoContainerHoverTitle a {
	color: black;
}

.rect img {
	width: 200px;
	height: 200px;
}

.rect {
	width: 200px;
	height: 200px;
	background: #eee;
	display: inline;
	float: left;
	margin-right: 5px;
	margin-bottom: 5px;
	overflow: hidden;
}

/* collection-div */
.textbtn {
	font-size: 12px;
	display: inline;
	margin-right: 5px;
	border: none;
	background: transparent;
	padding: 8px;
}
</style>
<script>
		$(document).ready(function() {
			$(".heart").click(function() {
				var heartVal = $(this).attr("class");
				if (heartVal == "fa fa-heart red-text heart") {
					$(this).attr("class", "fa fa-heart-o red-text heart");
				} else {
					$(this).attr("class", "fa fa-heart red-text heart");
				}
			});
			$(".heart").on('click', function() {
				var seq = $(this).attr("value");
				var writer	= $(".writerseq").val();
				var font = $(this).children('font');
				console.log("숫자: " + $(this).children('font').html());
				console.log(seq);
				$.ajax({
					url : "mainHeart.ajax",
					type : "post",
					data : {
						social_seq : seq , 
						social_writer :writer
					},
					success : function(data) {
						console.log("들어옴" + data), font.html(data)
					}
				});
			});
		$(function() {
			$(window).scroll(function() {
				var scrolltop = $(window).scrollTop();
				if ($(this).scrollTop() > 500) {
					$('#MOVE_TOP_BTN').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();
				}
				if (scrolltop == $(document).height()
						- $(window).height()) {
					$("#sidefooter").fadeIn();
				} else {
					$("#sidefooter").fadeOut();
				}
			});
			
			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
					return false;
				});
			});
		
		$(".followbtn").on('click',function() {
				var seq = $(this).siblings('.writerseq').val();
				var text = $(this).find('.show').text();
				console.log("text: " + text);
				var btn = $(".writerseq[value='" + seq + "']")
						.siblings("button.followbtn");
				var span = btn.find('span');
				$.ajax({
					url : "followUser.ajax",
					type : "post",
					data : {
						seq : seq,
						text : text
					},
					success : function(response) {
						if (response != null) {
							console.log("DB success : "
									+ response);
							btn.toggleClass("btn-itso");
							btn.toggleClass("btn-indigo");
							span.toggleClass("hidden");
							span.toggleClass("show");
						}
					},
					error : function(response) {
						console.log("DB Failed")
					}
				});
			})
		});
	</script>
</head>
<body>
	<%@include file="navi.jsp"%>
	<!-- Grid row -->
	<section class="firstSection">
	<div class="mainIntro">
		<p>
			<strong>HYPE</strong> the looks you like, and <strong>+FAN</strong>
			the people you like to personalize you feed.
		</p>
	</div>
	</section>
	<div id="wrapper" class="container">
		<div class="row">
			<section class="secondSection col-md-12 mt-3">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="user-tab"
					data-toggle="tab" href="#userdiv" role="tab"
					aria-controls="userdiv" aria-selected="true"> 사용자 (<c:choose>
							<c:when test="${empty userList}">0</c:when>
							<c:otherwise>${userList.size()}</c:otherwise>
						</c:choose>)
				</a></li>
				<li class="nav-item"><a class="nav-link" id="tag-tab"
					data-toggle="tab" href="#tagdiv" role="tab" aria-controls="tagdiv"
					aria-selected="false">태그(<c:choose>
							<c:when test="${empty socialList}">0</c:when>
							<c:otherwise>${socialList.size()}</c:otherwise>
						</c:choose>)
				</a></li>
				<li class="nav-item"><a class="nav-link" id="tip-tab"
					data-toggle="tab" href="#collectiondiv" role="tab"
					aria-controls="collectiondiv" aria-selected="false"> 컬렉션(<c:choose>
							<c:when test="${empty searchedCollectionList}">0</c:when>
							<c:otherwise>${searchedCollectionList.size()}</c:otherwise>
						</c:choose>)
				</a></li>
				<li class="nav-item">
					<a class="nav-link" id="tip-tab" data-toggle="tab" href="#tipdiv" role="tab" aria-controls="tipdiv" aria-selected="false">
					 팁 게시글(<c:choose><c:when test="${empty tipList}">0</c:when><c:otherwise>${tipList.size()}</c:otherwise></c:choose>)
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="itemtag-tab" data-toggle="tab" href="#itemtagdiv" role="tab" aria-controls="itemtagdiv" aria-selected="false">
						브랜드(<c:choose><c:when test="${empty brandList}">0</c:when><c:otherwise>${brandList.size()}</c:otherwise></c:choose>)
					</a>
				</li>
			</ul>
			<div class="tab-content text-center" id="myTabContent">
				<div class="tab-pane fade show active" id="userdiv" role="tabpanel"
					aria-labelledby="user-tab">
					<div class="col-md-12 search-users mt-3">
						<table style="width: 100%;">
							<c:choose>
								<c:when test="${!empty userList}">
									<c:forEach var="userList" items="${userList}">
										<tr>
											<td class="user-image"><img
												src="upload/profile/${userList.photo}" alt=""
												onerror="this.src='resources/images/background.jpg'">
											</td>
											<td class="user-info">
												<div class="user-name">
													<a href="userpage.go?seq=${userList.seq}"><b>${userList.name}</b></a>
												</div>
												<div class="status-message">${userList.state}</div>
											</td>
											<td class="user-fans">
												<button
													class="btn btn-indigo btn-sm followbtn waves-effect waves-light">+FOLLOW</button>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
										검색 결과가 없습니다.
									</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="tagdiv" role="tabpanel"
					aria-labelledby="tag-tab">
					<!-- 포토컨테이너시작 -->
					<section class="thirdSection col-md-12">
					<div class="gridPhotoContainer row">
						<c:choose>
							<c:when test="${fn:length(socialList) > 0}">
								<c:forEach items="${socialList}" var="list" varStatus="status">

									<div class="gridPhoto">

										<a href="readSocial.go?seq=${list.social_seq}"> <!-- <img src="resources/images/background.jpg"
								class="img-fluid z-depth-2" alt="Responsive image"> --> <img
											src="upload/social/${list.photo}" class="img-fluid z-depth-2"
											alt="Responsive image">

										</a>
										<div class="photoContainer">
											<div class="photoContainerHover z-depth-2">
												<input type="hidden" class="read"
													value="readSocial.go?seq=${list.social_seq}" /> <input
													type="hidden" class="user"
													value="userpage.go?seq=${list.social_writer }" />
												<h3 class="photoContainerHoverTitle title">${list.social_title}</h3>
												<p class="photoContainerHoverWriter writer">by
													${list.writerName}</p>
												<img src="upload/social/${list.photo}"
													class="img-fluid z-depth-2 image" alt="Responsive image">
												<div class="hashtagarea mt-1" style="margin-left: 5px;">
													<span>${list.social_contents}</span>
												</div>
												<c:if test="${!empty sessionScope.user }">
													<div class="btnarea " style="display: block; height: 31px;">
														<div class="goodarea"
															style="margin-top: 3px; margin-left: 5px; float: left;">
															<input type="hidden" class="writerseq"
																value="${list.social_writer }" />
															<c:set var="loop_flag" value="false" />
															<c:choose>
																<c:when test="${empty goodList }">
																	<i class="fa fa-heart-o red-text heart "
																		aria-hidden="true"
																		style="float: right; font-size: 25px;"
																		value="${list.social_seq}"> <font color="black">
																			${heart[status.index].toString()} </font></i>
																</c:when>
																<c:otherwise>
																	<c:forEach items="${goodList }" var="good"
																		varStatus="gstatus">

																		<c:if test="${loop_flag == false }">
																			<c:choose>
																				<c:when
																					test="${good.social_seq == list.social_seq }">
																					<i class="fa fa-heart red-text heart"
																						aria-hidden="true"
																						style="float: left; font-size: 25px;"
																						value="${list.social_seq}"> <font
																						color="black">
																							${heart[status.index].toString()} </font></i>

																					<c:set var="loop_flag" value="true" />
																				</c:when>
																				<c:otherwise>
																					<c:if test="${gstatus.last }">
																						<i class="fa fa-heart-o red-text heart"
																							aria-hidden="true"
																							style="float: left; font-size: 25px;"
																							value="${list.social_seq}"> <font
																							color="black">
																								${heart[status.index].toString()} </font></i>


																					</c:if>
																				</c:otherwise>
																			</c:choose>
																		</c:if>

																	</c:forEach>
																</c:otherwise>

															</c:choose>

														</div>
														<button type="button" class="btn-floating btn-sm savebtn"
															style="float: right; background-color: #fff; color: black; border: 0px; border-radius: 5px; padding-right: 0;"
															title="컬렉션에 저장" data-toggle="modal"
															data-target="#saveModal">
															컬렉션에 저장 <i class="fa fa-download"></i>
														</button>
														<input type="hidden" class="socialseq"
															value="${list.social_seq }" />
												</c:if>
											</div>

										</div>
									</div>
					</div>
					</c:forEach> </c:when> <c:otherwise>
						<div class="col-md-12">검색 결과가 없습니다.</div>
					</c:otherwise> </c:choose>
				</div>
			</section>
			<!-- 포토컨테이너종료 -->
		</div>

		<div class="tab-pane fade" id="collectiondiv" role="tabpanel"
			aria-labelledby="collection-tab">
			<table class="table">
				<tbody>
					<c:choose>
						<c:when test="${!empty searchedCollectionList }">
							<c:set var="num" value="0" />
							<c:forEach var="clist" items="${searchedCollectionList }">
								<tr>
									<td width=190><h4>
											<a href="collection.go?seq=${clist.collection_seq }">
												<div class="collectiontitle">${clist.collection_title }</div>
											</a>
										</h4>
										<div class="collectioncontents">${clist.collection_contents }</div>
										<div class="linkarea mt-2">
											<button class="btn btn-itso btn-sm ml-0"
												style="padding-left: 8px; padding-right: 8px;">
												<a href="collection.go?seq=${clist.collection_seq }"
													style="color: white;">보기</a>
											</button>
										</div></td>
									<td><c:set var="loop" value="true" /> <c:set var="num"
											value="0" /> <c:forEach var="slist" items="${searchedPhotoList }">
											<c:if test="${loop eq true }">
												<c:if
													test="${slist.collection_seq eq clist.collection_seq }">
													<c:set var="num" value="${num+1 }" />
													<div class="rect">
														<img src="upload/social/${slist.photo }" alt="" />
													</div>
													<c:if test="${num > 3 }">
														<c:set var="loop" value="false" />
													</c:if>
												</c:if>
											</c:if>
										</c:forEach></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td>생성한 컬렉션이 없습니다.
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div class="tab-pane fade" id="tipdiv" role="tabpanel"
			aria-labelledby="tip-tab">
			<div class="col-md-12 search-tip mt-3">
				<table style="width: 100%">
					<c:choose>
						<c:when test="${!empty tipList}">
							<c:forEach var="tipList" items="${tipList}">
								<tr>
									<td class="tip-image"><img
										src="resources/images/${tipList.photo}" alt=""
										onerror="this.src='resources/images/background.jpg'" /></td>
									<td class="user-name"><a
										href="userpage.go?seq=${tipList.tip_writer}">${tipList.name}</a>
									</td>
									<td class="tip-info"><a
										href="getSpecificTipView.tip?seq=${tipList.tip_seq}">[${tipList.category}]${tipList.tip_title}</a>
									</td>
									<td class="tip-like" style="text-align: left;"><i
										class=" fa fa-heart red-text"></i>${tipList.tip_like_count}</td>
									<td class="view-count" style="text-align: left"><i
										class="fa  fa-eye"></i>${tipList.tip_viewcount}</td>
									<td>${tipList.tip_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
										검색 결과가 없습니다.
									</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
		
		<div class="tab-pane fade" id="itemtagdiv" role="tabpanel" aria-labelledby="itemtab-tab">
								<!-- 포토컨테이너시작 -->
					<section class="thirdSection col-md-12">
					<div class="gridPhotoContainer row">
						<c:choose>
							<c:when test="${fn:length(brandList) > 0}">
								<c:forEach items="${brandList}" var="list" varStatus="status">

									<div class="gridPhoto">

										<a href="readSocial.go?seq=${list.social_seq}"> <!-- <img src="resources/images/background.jpg"
								class="img-fluid z-depth-2" alt="Responsive image"> --> <img
											src="upload/social/${list.photo}" class="img-fluid z-depth-5"
											alt="Responsive image">

										</a>
										<div class="photoContainer">
											<div class="photoContainerHover z-depth-2">
												<input type="hidden" class="read"
													value="readSocial.go?seq=${list.social_seq}" /> <input
													type="hidden" class="user"
													value="userpage.go?seq=${list.social_writer }" />
												<h3 class="photoContainerHoverTitle title">${list.social_title}</h3>
												<p class="photoContainerHoverWriter writer">by
													${list.writerName}</p>
												<img src="upload/social/${list.photo}"
													class="img-fluid z-depth-2 image" alt="Responsive image">
												<div class="hashtagarea mt-1" style="margin-left: 5px;">
													<span>${list.social_contents}</span>
												</div>
												<c:if test="${!empty sessionScope.user }">
													<div class="btnarea " style="display: block; height: 31px;">
														<div class="goodarea"
															style="margin-top: 3px; margin-left: 5px; float: left;">
															<input type="hidden" class="writerseq"
																value="${list.social_writer }" />
															<c:set var="loop_flag" value="false" />
															<c:choose>
																<c:when test="${empty goodList }">
																	<i class="fa fa-heart-o red-text heart "
																		aria-hidden="true"
																		style="float: right; font-size: 25px;"
																		value="${list.social_seq}"> <font color="black">
																			${heart2[status.index].toString()} </font></i>
																</c:when>
																<c:otherwise>
																	<c:forEach items="${goodList }" var="good"
																		varStatus="gstatus">

																		<c:if test="${loop_flag == false }">
																			<c:choose>
																				<c:when
																					test="${good.social_seq == list.social_seq }">
																					<i class="fa fa-heart red-text heart"
																						aria-hidden="true"
																						style="float: left; font-size: 25px;"
																						value="${list.social_seq}"> <font
																						color="black">
																							${heart2[status.index].toString()} </font></i>

																					<c:set var="loop_flag" value="true" />
																				</c:when>
																				<c:otherwise>
																					<c:if test="${gstatus.last }">
																						<i class="fa fa-heart-o red-text heart"
																							aria-hidden="true"
																							style="float: left; font-size: 25px;"
																							value="${list.social_seq}"> <font
																							color="black">
																								${heart2[status.index].toString()} </font></i>


																					</c:if>
																				</c:otherwise>
																			</c:choose>
																		</c:if>

																	</c:forEach>
																</c:otherwise>

															</c:choose>

														</div>
														<button type="button" class="btn-floating btn-sm savebtn"
															style="float: right; background-color: #fff; color: black; border: 0px; border-radius: 5px; padding-right: 0;"
															title="컬렉션에 저장" data-toggle="modal"
															data-target="#saveModal">
															컬렉션에 저장 <i class="fa fa-download"></i>
														</button>
														<input type="hidden" class="socialseq"
															value="${list.social_seq }" />
												</c:if>
											</div>

										</div>
									</div>
					</div>
					</c:forEach> </c:when> <c:otherwise>
						<div class="col-md-12">검색 결과가 없습니다.</div>
					</c:otherwise> </c:choose>
				</div>
			</section>
			<!-- 포토컨테이너종료 -->
		</div>
	</div>
	</section>
	</div>
	</div>

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
							<i class="fa fa-plus"></i> 컬렉션 생성
						</button>
						<button class="btn btn-indigo" id="managebtn">컬렉션 관리</button>
					</div>

					<c:choose>
						<c:when test="${not empty collectionList }">
							<div id="collectionarea" class="mt-2">
								<c:set var="num" value="0"></c:set>
								<c:forEach items="${collectionList}" var="clist">

									<div class="collectionItem z-depth-1 mt-2">
										<h4 class="mt-1 mb-1">${clist.collection_title }</h4>
										<h6>${clist.collection_contents }</h6>
										<input type="hidden" class="collectionseq"
											value="${clist.collection_seq }" />
										<div class="collectionPhoto">

											<c:set var="check" value="true" />
											<c:set var="num" value="0" />

											<c:forEach items="${photoList }" var="plist"
												varStatus="status">
												<c:choose>
													<c:when test="${check eq true }">
														<c:if
															test="${plist.collection_seq == clist.collection_seq }">
															<c:set var="num" value="${num+1 }" />

															<div class="collectionPhotoItem">
																<img src="/upload/social/${plist.photo }" alt=""><input
																	type="hidden" class="socialseq"
																	value="${plist.social_seq }" />
															</div>
															<c:if test="${num == 4 || status.last}">
																<c:set var="check" value="false" />
															</c:if>
														</c:if>
													</c:when>
													<c:otherwise>


													</c:otherwise>
												</c:choose>

											</c:forEach>
										</div>
										<h6 class="mb-0" style="height: 19px;"></h6>
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<p class="mt-1 mb-0" id="firstmsg">생성된 컬렉션이 없습니다.</p>
							<div id="collectionarea" class="mt-2 first"></div>
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
						<input type="text" id="inputMD" class="form-control"
							name="collection_title" maxlength="30"> <label
							for="inputMD">컬렉션 이름</label>
					</div>
					<div class="md-form mt-1">
						<textarea id="form7" class="md-textarea form-control"
							rows="3" name="collection_contents"></textarea>
						<label for="form7">컬렉션 상세 설명</label>
					</div>
				</div>

				<!--Footer-->
				<div class="modal-footer justify-content-center">
					<button class="btn btn-itso" data-toggle="modal"
						data-target="#modal" id="createcolbtn">생성</button>
					<button class="btn btn-outline-itso waves-effect"
						data-dismiss="modal">취소</button>
				</div>
			</div>
			<!--/.Content-->
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<script>
	$("#managebtn").on("click", function () {
	    window.open('mypage.go?view=collection', '_blank');
	})

	social_seq = 0;
		$('.savebtn').on("click", function () {
		    social_seq = $(this).siblings(".socialseq").val();
		    console.log(social_seq);

		    var clistsize = "${fn:length(collectionList)}";

		    for (var i = 1; i <= clistsize; i++) {
		        var cursor = $(".collectionItem:nth-of-type(" + i + ")");
		        var plistsize = cursor.find(".collectionPhotoItem").length;

		        for (var j = 1; j <= plistsize; j++) {
		            var collection_socialseq = $(cursor).find(".collectionPhotoItem:nth-of-type(" + j + ")").find(".socialseq").val();
		            console.log("검사 : " + i + "," + j + ":" + social_seq + ":" + collection_socialseq);
		            if (social_seq == collection_socialseq) {
		                cursor.addClass("active");
		                console.log("true");
		                break;
		            }
		        }
		    }
		})
		$("#collectionarea").on("click", ".collectionItem", function () {
		    var cursor = $(this);
		    cursor.toggleClass('active');
		    var collection_seq = $(this).children(".collectionseq").val();
		    console.log("collection_seq: " + collection_seq);
		    console.log("social_seq: " + social_seq);

		    var num = $(this).find(".collectionPhotoItem").length;
		    $.ajax({
		        url: "saveCollection.ajax",
		        type: "post",
		        data: {
		            collection_seq: collection_seq,
		            social_seq: social_seq
		        },
		        success: function (data) {
		            console.log("ajax: " +
		                data.photo + "," +
		                data.social_seq)
		            if (data.photo != null) {
		                console.log("여기");
		                if (num > 3) {
		                	console.log("숨겨");
		                cursor.find(".collectionPhoto").append(
		                    '<div class="collectionPhotoItem" style="display:none;">' +
		                    '<img src="/upload/social/' + data.photo + '"> <input type="hidden" class="socialseq" value="' + data.social_seq + '">' +
		                    '</div>');
		                } else {
		                	console.log("보여");
		                	 cursor.find(".collectionPhoto").append(
		 		                    '<div class="collectionPhotoItem">' +
		 		                    '<img src="/upload/social/' + data.photo + '"> <input type="hidden" class="socialseq" value="' + data.social_seq + '">' +
		 		                    '</div>');
		                }
		            } else {
		                cursor.find(".collectionseq[value='" + collection_seq + "']").siblings(".collectionPhoto")
		                    .find(".socialseq[value='" + social_seq + "']").parent().remove();
		            }
		        },
		        error: function (response) {
		            console.log("DB Failed")
		        }

		    });

		})

		$("#createcolbtn")
		    .on('click', function () {
		        var collection_title = $("input[name='collection_title']").val();
		        var collection_contents = $("textarea[name='collection_contents']").val();
		        
		        if(collection_title == "") {
		        	alert("컬렉션 이름을 입력하세요.");
		        } else if(collection_contents == "") {
		        	alert("컬렉션 상세 설명을 입력하세요.");
		        } else {
		        	
		        $.ajax({
		            url: "createCollection.ajax",
		            type: "post",
		            data: {
		                collection_title: collection_title,
		                collection_contents: collection_contents
		            },
		            success: function (data) {
		                console.log("생성" + data);
		                var dto = JSON.parse(data);
		                
		                console.log("체크: " + $("#collectionarea").hasClass("first"));
					    if($("#collectionarea").hasClass("first")) {
					    	console.log("처음");
					    	$("#firstmsg").remove();
					    }
					    
		                $("input[name='collection_title']").val("");
		                $("textarea[name='collection_contents']").val("");
		                $("#createModal").modal('hide');

		                $("#collectionarea").append(
		                    '<div class="collectionItem z-depth-1 mt-2">' +
		                    '<h4 class="mt-1 mb-1 text-truncate">' +
		                    dto.collection_title +
		                    '</h4><h6 class="text-truncate">' +
		                    dto.collection_contents +
		                    '</h6>' +
		                    '<input type="hidden" class="collectionseq" value="' + dto.collection_seq + '"/>' +
		                    '<div class="collectionPhoto"></div></div><h6 class="mb-0" style="height: 19px;"></h6>');

		                $("#saveModal").modal('show');

		            }
		        });
		        }
		    });
		$("#createModal").on('show.bs.modal', function () {
		    $("#saveModal").modal('hide');
		});

		$("#createModal").on('hidden.bs.modal', function () {
		    $("#saveModal").modal('show');
		});

		$("#saveModal").on('hidden.bs.modal', function () {
		    console.log("닫힘");
		    $(".collectionItem").removeClass("active");
		});

		</script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
	<!-- 카카오api -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>

	<script>
		var newURL = window.location.protocol + window.location.host
				+ window.location.pathname;
		var titletext = '${list.social_title}';
	
		console.log("<c:out value='${param.mode}'/>");
	
		var mode = "<c:out value='${list.social_title}'/>";
	
		//트위터 공유  
		function twittergo(url, text) {
			var url = window.location.protocol + window.location.host
					+ window.location.pathname;
			var text = document.title;
	
			console.log(text);
			console.log(titletext);
	
			window.open("https://twitter.com/intent/tweet?text=" + text + "&url="
					+ url, "", "width=700, height=400");
		}
	
		//카카오톡공유  
		Kakao.init('6f7ebead2317edc298ae9592c2996720');
		function kakaogo() {
			Kakao.Link.createDefaultButton({
				container : '#kakao-link-btn',
				objectType : 'feed',
				content : {
					title : document.title,
					description : '내용, 주로 해시태그',
					imageUrl : document.images[0].src, //이미지 주소 올곳 
					link : {
						webUrl : document.location.href,
						mobileWebUrl : document.location.href
					}
				},
				social : {
					likeCount : 999999
				//좋아요우 올곳 
				},
				buttons : [ {
					title : '웹에서보기',
					link : {
						mobileWebUrl : document.location.href,
						webUrl : document.location.href
					}
				} ]
			});
		}
	
		//페이스북 
		function facebookgo() {
			//var url =  window.location.host + window.location.pathname; 
			var url = 'http://192.168.20.35/controller/main.go'
			var encodeUrl = encodeURIComponent(url);
			var facebook = 'https://www.facebook.com/sharer/sharer.php?u=';
			var link = facebook + encodeUrl;
			window.open(link, "", "width=700, height=400");
	
		}
	
		//메타태그 변경 
		function metago() {
	
		}
	</script>
</body>
</html>