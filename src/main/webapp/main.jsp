<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="og:url" content="http://news.naver.com/main/read.nhn?oid=001&sid1=101&aid=0009814769&mid=shm&mode=LSD&nh=20180116081307">
<meta property="og:title" content="테스트 뉴스">
<meta property="og:image" content="http://imgnews.naver.net/image/001/2018/01/16/AKR20180115146300002_01_i_20180116084056132.jpg?type=w540">
<meta property="og:description" content="네이버 뉴스를 테스트로 해보았습니다.">

<title>It So</title>
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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

#card-group {
	margin: 0px auto !important;
	width: 100%;
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
	width: 300px;
	bottom: 0px;
	right: 50px;
	position: fixed;
	border-top: 2px solid black;
	display: none;
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
			var font = $(this).children('font');
			console.log("숫자: " + $(this).children('font').html());
			console.log(seq);

			$.ajax({
				url : "mainHeart.ajax",
				type : "post",
				data : {
					social_seq : seq
				},
				success : function(data) {
					console.log("들어옴" + data), font.html(data)

				}
			});

		});

		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 500) {
					$('#MOVE_TOP_BTN').fadeIn();

					$('#sidefooter').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();
					$('#sidefooter').fadeOut();
				}

			});

			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});

		$(".followbtn").on('click', function() {
			var seq = $(this).siblings("#seq").val();
			var text = $(this).text();
			var btn = $(this);
			$.ajax({
				url : "followUser.ajax",
				type : "post",
				data : {
					seq : seq,
					text : text
				},
				success : function(response) {
					if (response != null) {
						console.log("DB success : " + response);
						btn.toggleClass("btn-itso");
						btn.toggleClass("btn-indigo");
						btn.html(response);
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
	<div id="card-group">
		<section class="firstSection col-md-12">
			<div class="mainIntro">
				<p>
					<strong>HYPE</strong> the looks you like, and <strong>+FAN</strong>
					the people you like to personalize you feed.
				</p>
			</div>
		</section>


		<section class="secondSection col-md-12">
			<div class="container">

				<div class="btn-group">
					<button class="btn btn-sm dropdown-toggle droptxt1" type="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						id="gender">${gender}</button>

					<div class="dropdown-menu">
						<a class="dropdown-item flex-center droptxt2"
							href="main.go?gender=g&age=${pAge }&main=${main}&feed=${feed}">무관
						</a> <a class="dropdown-item flex-center droptxt2"
							href="main.go?gender=m&age=${pAge }&main=${main}&feed=${feed}">남성</a>
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
		<a id="MOVE_TOP_BTN" href="#">TOP</a>

		<c:choose>
			<c:when test="${fn:length(socialList) > 0}">
				<c:forEach items="${socialList}" var="list" varStatus="status">
					<div class="row gb" style="margin: 0xp auto;">
						<!-- Grid column -->
						<div class="col-lg-4 col-md-12">
							<!--Card-->

							<div class="card">
								<!--Card image-->
								<div class="view">
									<img src="resources/images/${list.photo}" class="card-img-top"
										alt="photo"> <a href="#">
										<div class="mask rgba-white-slight"></div>
									</a>
								</div>


								<!--Card content-->
								<div class="card-body">
									<!--Title-->
									<ul class="list-unstyled">
										<li class="media align-middle"><img
											class="d-flex mr-3 rounded-circle "
											src="/upload/profile/${list.user_photo}"
											style="width: 50px; height: 50px; margin-top: 10px">
											<div class="media-body" style="margin: 0px auto">

												<a class="writer-a"><b class="writerName"
													style="font-size: 20px;">${list.writerName}</b></a> <span>${list.userState}</span>

											</div> <!-- <script type="text/javascript">
										console
												.log("${goodCount[status.count]}");
									</script> -->
											<div>
												<c:set var="loop_flag" value="false" />
												<c:choose>
													<c:when test="${empty goodList }">
														<i class="fa fa-heart-o red-text heart "
															aria-hidden="true" style="float: right; font-size: 25px;"
															value="${list.social_seq}"><font color="black">${heart[status.index].toString()}
														</font></i>


													</c:when>
													<c:otherwise>
														<c:forEach items="${goodList }" var="good"
															varStatus="gstatus">

															<c:if test="${loop_flag == false }">
																<c:choose>
																	<c:when test="${good.social_seq == list.social_seq }">
																		<i class="fa fa-heart red-text heart"
																			aria-hidden="true"
																			style="float: right; font-size: 25px; margin-top: 25px;"
																			value="${list.social_seq}"><font color="black">${heart[status.index].toString()}
																		</font></i>

																		<c:set var="loop_flag" value="true" />
																	</c:when>
																	<c:otherwise>
																		<c:if test="${gstatus.last }">
																			<i class="fa fa-heart-o red-text heart"
																				aria-hidden="true"
																				style="float: right; font-size: 25px; margin-top: 20px;"
																				value="${list.social_seq}"><font color="black">${heart[status.index].toString()}
																			</font></i>
																			<font>${list.userState }</font>

																		</c:if>
																	</c:otherwise>
																</c:choose>
															</c:if>

														</c:forEach>
													</c:otherwise>

												</c:choose>
											</div></li>
									</ul>



									<!--Text-->
									<p class="card-text" id="socialTitle">${list.social_title}</p>
									<c:forEach var="flist" items="${followingList }">
										<c:choose>
											<c:when test="${flist.seq eq list.social_writer}">
												<button type="button" class="btn btn-indigo followbtn"
													style="font-family: 'NanumbarunpenR';">
													<i class="fa fa-upload"> <span
														style="font-family: 'NanumbarunpenR';">팔로우</span></i>
												</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-itso followbtn"
													style="font-family: 'NanumbarunpenR';">
													<i class="fa fa-upload"> <span
														style="font-family: 'NanumbarunpenR';">언팔로우</span></i>
												</button>
											</c:otherwise>
										</c:choose>


									</c:forEach>

									<button type="button" class="btn btn-indigo"
										style="background-color: black; font-family: 'NanumbarunpenR';">
										<i class="fa fa-upload"> <span
											style="font-family: 'NanumbarunpenR';">컬렉션에저장</span></i>
									</button>
									<!--share-->
									<!--kakao-->
									<button type="button"
											class="btn-floating btn-sm btn-is share "
											style="float: right; background-color: #ffff00; color: gray; border: 0px; margin-left: 10px; border-radius: 5x;" id="kakao-link-btn" onclick="kakaogo()">
											<i class="fab fa-kaggle"></i>
										</button>
									<!--twitter-->
									<button type="button" class="btn-floating btn-sm btn-tw share"
										style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 6px;" onclick="twittergo()">
										<i class="fab fa-twitter"></i>
									</button>
									<!--facebook-->
									<button type="button" class="btn-floating btn-sm btn-fb share"
										style="float: right; background-color: #4267b2; color: white; border: 0px; border-radius: 5px;"  onclick="facebookgo()">
										<i class="fab fa-facebook"></i>
									</button>
								</div>
							</div>
							<!--/.Card-->
						</div>
						<!-- Grid column -->

					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">게시글이 없습니다,</td>
				</tr>
			</c:otherwise>
		</c:choose>


		<!-- 오른쪽 추천 follow  -->
		<div id="rightfix" class="right-fixed">
			<ul class="list-unstyled">
				<li class="media"><img class="d-flex mr-3 rounded-circle"
					src="https://mdbootstrap.com/img/Photos/Others/placeholder7.jpg"
					alt="Generic placeholder image">
					<div class="media-body">
						<h5 class="mt-0 mb-1 font-weight-bold">List-based media
							object</h5>
						<button type="button" class="btn btn-indigo btn-sm">
							<i class="fa fa-plus">follow</i>
						</button>

					</div></li>
				<li class="media my-4"><img class="d-flex mr-3 rounded-circle"
					src="https://mdbootstrap.com/img/Photos/Others/placeholder6.jpg"
					alt="An image">
					<div class="media-body">
						<h5 class="mt-0 mb-1 font-weight-bold">List-based media
							object</h5>
						<button type="button" class="btn btn-indigo btn-sm">
							<i class="fa fa-plus">follow</i>
						</button>

					</div></li>
				<li class="media"><img class="d-flex mr-3 rounded-circle"
					src="https://mdbootstrap.com/img/Photos/Others/placeholder5.jpg"
					alt="Generic placeholder image">
					<div class="media-body">
						<h5 class="mt-0 mb-1 font-weight-bold">List-based</h5>
						<button type="button" class="btn btn-indigo btn-sm">
							<i class="fa fa-plus">follow</i>
						</button>

					</div></li>
			</ul>
			<!--side footer -->
			<div id="sidefooter">
				<p>©2018 ItSo. All rights reserved.</p>
				<p>
					<a href="#">language</a>· <a href="#">help</a>· <a href="#">widgets</a>·
					<a href="#">advertise</a>· <a href="#">legal</a>
				</p>
			</div>


		</div>
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

<!-- 카카오api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 페이스북api -->
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
	function metago(){
		
	}
</script>




</html>