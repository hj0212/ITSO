<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	box-sizing: border-box;
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

.active {
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

@media ( max-width : 1334px) {
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
	width: 250px;
	top: 30%;
	right: 0px;
	position: fixed;
}

#rightfix .media {
	margin-bottom: 20px;
}

#rightfix img {
	height: 70px;
	width: 70px;
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
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						id="gender">${gender}</button>

					<div class="dropdown-menu">
						<a class="dropdown-item flex-center droptxt2"
							href="main.go?gender=g&age=${pAge }&feed=${feed}">무관 </a> <a
							class="dropdown-item flex-center droptxt2"
							href="main.go?gender=m&age=${pAge}&main=${main}&feed=${feed}">남성</a>
						<a class="dropdown-item flex-center droptxt2"
							href="main.go?gender=f&age=${pAge }&main=${main}&feed=${feed}">여성</a>
					</div>
					<div class="btn-group">
						<button class="btn btn-sm dropdown-toggle droptxt1" type="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							id="age">${age}</button>
						<div class="dropdown-menu">
							<a class="dropdown-item flex-center droptxt2"
								href="main.go?age=0&gender=${pGender }&main=${main}&feed=${feed}">모든연령
							</a> <a class="dropdown-item flex-center droptxt2"
								href="main.go?age=10&gender=${pGender }&main=${main}&feed=${feed}">10대</a>
							<a class="dropdown-item flex-center droptxt2"
								href="main.go?age=20&gender=${pGender }&main=${main}&feed=${feed}">20대</a>
							<a class="dropdown-item flex-center droptxt2"
								href="main.go?age=30&gender=${pGender }&main=${main}&feed=${feed}">30대</a>
							<a class="dropdown-item flex-center droptxt2"
								href="main.go?age=40&gender=${pGender }&main=${main}&feed=${feed}">40대</a>
						</div>
						<div class="btn-group">
							<button class="btn btn-sm dropdown-toggle droptxt1" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Full view</button>
							<div class="dropdown-menu">
								<a class="dropdown-item flex-center droptxt2"
									href="main.go?main=full&age=${age}&gender=${pGender }&main=${main}&feed=${feed}">Full
									view</a> <a class="dropdown-item flex-center droptxt2"
									href="main.go?main=thumbnail&age=${age}&gender=${pGender }&main=${main}&feed=${feed}">Thumbnail
									view</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>

		<!-- 드랍박스메뉴종료 -->

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
									<div class="photoContainerHover z-depth-1">
										<input type="hidden" class="read" value="readSocial.go?seq=${list.social_seq}" /> 
										<input type="hidden" class="user" value="userpage.go?seq=${list.social_writer }" />
										<h3 class="photoContainerHoverTitle title">${list.social_title}</h3>
										<p class="photoContainerHoverWriter writer">by ${list.writerName}</p>
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
																		<c:when test="${good.social_seq == list.social_seq }">
																			<i class="fa fa-heart red-text heart"
																				aria-hidden="true"
																				style="float: left; font-size: 25px;"
																				value="${list.social_seq}"> <font color="black">
																					${heart[status.index].toString()} </font></i>

																			<c:set var="loop_flag" value="true" />
																		</c:when>
																		<c:otherwise>
																			<c:if test="${gstatus.last }">
																				<i class="fa fa-heart-o red-text heart"
																					aria-hidden="true"
																					style="float: left; font-size: 25px;"
																					value="${list.social_seq}"> <font color="black">
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
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">게시글이 없습니다</td>
				</tr>
			</c:otherwise>
			</c:choose>
	</div>
	</section>
	<!-- 포토컨테이너종료 -->

		<!-- 오른쪽 추천 follow  -->
		<div id="rightfix" class="right-fixed">
		<c:choose>
			<c:when test="${empty recommendList} }">
			
			</c:when>
			<c:otherwise>
				<h5 class="font-weight-bold" style="margin-bottom: 20px;">추천 팔로우</h5>
				<ul class="list-unstyled">
				<c:forEach var="reco" items="${recommendList}">
				<li class="media"><img
					class="d-flex mr-3 rounded-circle  align-self-center"
					src="upload/profile/${reco.photo }"
					alt="Generic placeholder image">
					<div class="media-body mt-0">
						<h5 class="mt-0 mb-0 ">${reco.name }</h5>
						<button type="button" class="btn btn-indigo followbtn btn-sm">
							<span class="unfollow hidden" style="font-family: 'NanumbarunpenR';">
							<i class="fa fa-check" /></i> 언팔로우</span> 
							<span class="follow show" style="font-family: 'NanumbarunpenR';">
							<i class="fa fa-plus" /></i> 팔로우</span>
						</button>
						<input type="hidden" class="writerseq" value="${reco.seq }"/>
					</div></li>
				</c:forEach>
			</ul>
			</c:otherwise>
		</c:choose>
			
			<a id="MOVE_TOP_BTN" href="#" class="btn btn-elegant btn-sm">TOP</a>
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

	<!-- Button trigger modal -->
	<div class="text-center"></div>
	
	<%@include file="footer.jsp"%>

</body>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
<script>
	
	$(".photoContainerHover").on("click", ".image, .title", 
	function readSocial() {
		var cursor = $(this);
		var src = cursor.siblings(".read").val();
		location.href = src;
	});
	
	$(".photoContainerHover").on("click", ".writer", 
	function userpage() {
		var cursor = $(this);
		var src = cursor.siblings(".user").val();
		location.href = src;
	});
	
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
		var writer = $(".writerseq").val();
		var font = $(this).children('font');
		console.log("숫자: " + $(this).children('font').html());
		console.log(seq);
		$.ajax({
			url : "mainHeart.ajax",
			type : "post",
			data : {
				social_seq : seq,
				social_writer : writer
			},
			success : function(data) {
				console.log("들어옴" + data), font.html(data)
			}
		});
	});

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

	$("#managebtn").on("click", function() {
		window.open('userpage.go?view=collection', '_blank');
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

</html>