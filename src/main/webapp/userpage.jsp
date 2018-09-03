<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<!--   ---------CDN 모음 끝------------------------------------------  -->
<title></title>
<style>
body {
	background-color: #eeeeee;
}

#wrapper {
	min-height: 100%;
	position: relative;
	margin-bottom: 100px; /* footer height */
}

#wrapper div {
	background-color: #fff;
}

#header {
	height: 150px;
}

#profile {
	padding: 10px;
}

#imgarea {
	height: 145px;
	width: 145px;
	overflow: hidden;
	display: inline;
	float: left;
}

.profileimg {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

#infoarea {
	padding-top: 20px;
	padding-left: 5px;
	display: inline;
}

#infoarea p {
	display: inline;
}

#profilestat {
	display: inline;
	float: right;
	width: 280px;
}

#profilestat div {
	width: 55px;
	float: left;
	font-size: 18px;
	padding-left: 5px;
}

#profilestat a.active, #tablist a.active {
	font-weight: normal;
}

#profilestat div p:first-of-type {
	font-weight: bold;
}

@media ( min-width : 868px) {
	#profilestat {
		margin-top: 35px;
	}
}

@media ( max-width : 868px) {
	#profilestat {
		margin-top: 15px;
		width: 100%;
	}
}

#profileimgarea {
	/* followpanel */
	width: 100px;
	height: 100px;
	overflow: hidden;
	display: inline;
	float: left;
}

table .profilearea {
	height: 80px;
	width: 80px;
	overflow: hidden;
	display: inline;
	float: left;
}

.rect {
	width: 200px;
	height: 200px;
	background: #eee;
	display: inline;
	float: left;
	margin-right: 5px;
	margin-bottom: 5px;
}

.rect img {
	width: 200px;
	height: 200px;
}

.tab-pane {
	padding-top: 10px;
	padding-bottom: 10px;
}

.active {
	font-weight: bold;
}

.textbtn {
	font-size: 12px;
	display: inline;
	margin-right: 5px;
	border: none;
	background: transparent;
	padding: 8px;
}

.mainItem {
	width: 600px;
	margin: 0 auto;
	border-top: 1px solid #eee;
	padding: 15px;
}

@media ( max-width : 600px) {
	.state {
		display: none;
	}
}

.tab-content a {
	color: black;
}

#social_contents a {
	color: dodgerblue;
}

#social_contents a:hover {
	color: black;
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

.media-body {
	height: 70px;
	line-height: 70px;
	margin-top: 10px;
}

.hidden {
	display: none;
}

.writerName:hover {
	color: aqua;
}

.followbtn {
	margin-top: 6px;
}

.tip-date {
	text-align: right;
	width: 130px;
}
</style>

<script>
	$(document)
			.ready(
					function() {
						$("#myinfobtn").click(function() {
							location.href = "myinfo.go";
						})

						$(".followbtn").on(
								'click',
								function() {
									var seq = $(this).siblings("#seq").val();
									var text = $(this).find(".show").text();
									var btn = $(this);
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

						function getUrlParameter(sParam) {
							var sPageURL = decodeURIComponent(window.location.search
									.substring(1)), sURLVariables = sPageURL
									.split('&'), sParameterName, i;

							for (i = 0; i < sURLVariables.length; i++) {
								sParameterName = sURLVariables[i].split('=');

								if (sParameterName[0] === sParam) {
									return sParameterName[1] === undefined ? true
											: sParameterName[1];
								}
							}
						}
						;

						var view = getUrlParameter('view');

						if (view == "collection") {
							$("a[href='#collectionPanel']").addClass(
									"active show");
							$("#collectionPanel").addClass("in show active");
						} else {
							$("a[href='#socialPanel']").addClass("active show");
							$("#socialPanel").addClass("in show active");
						}

						function setModal(seq, title, contents) {
							$("#seqform").val(seq);
							$("#titleform").val(title);
							$("#contentsform").text(contents);
						}

						$(".editbtn").on(
								"click",
								function() {
									var collection_seq = $(this).siblings(
											"input[name='collectionseq']")
											.val();
									var collection_title = $(this).parent()
											.siblings("h4").children("a")
											.children(".collectiontitle")
											.html();
									var collection_contents = $(this).parent()
											.siblings(".collectioncontents")
											.html();

									setModal(collection_seq, collection_title,
											collection_contents);
								});

						$("#savebtn")
								.on(
										"click",
										function() {
											var collection_seq = $("#seqform")
													.val();
											var collection_title = $(
													"#titleform").val();
											var collection_contents = $(
													"#contentsform").val();

											$
													.ajax({
														url : "editCollection.ajax",
														type : "post",
														data : {
															collection_seq : collection_seq,
															collection_title : collection_title,
															collection_contents : collection_contents
														},
														success : function(
																response) {
															if (response != null) {
																location.href = "userpage.go?view=collection";
															}
														},
														error : function(
																response) {
															console
																	.log("DB Failed")
														}
													});
										});

						$(".removebtn")
								.on(
										"click",
										function() {
											var collection_seq = $(this)
													.siblings(
															"input[name='collectionseq']")
													.val();
											$
													.ajax({
														url : "removeCollection.ajax",
														type : "post",
														data : {
															collection_seq : collection_seq
														},
														success : function(
																response) {
															if (response != null) {
																location.href = "userpage.go?view=collection";
															}
														},
														error : function(
																response) {
															console
																	.log("DB Failed")
														}
													});
										});
						$(".heart")
								.click(
										function() {
											var heartVal = $(this)
													.attr("class");
											if (heartVal == "fa fa-heart red-text heart") {
												$(this)
														.attr("class",
																"fa fa-heart-o red-text heart");
											} else {
												$(this)
														.attr("class",
																"fa fa-heart red-text heart");
											}
										});
						$(".heart").on(
								'click',
								function() {
									var seq = $(this).attr("value");
									var writer = $(".writerseq").val();
									var font = $(this).children('font');
									console.log("숫자: "
											+ $(this).children('font').html());
									console.log(seq);
									$.ajax({
										url : "mainHeart.ajax",
										type : "post",
										data : {
											social_seq : seq,
											social_writer : writer
										},
										success : function(data) {
											console.log("들어옴" + data), font
													.html(data)
										}
									});
								});

					})
</script>
</head>

<body>
	<%@include file="navi.jsp"%>

	<div id="wrapper" class="container-fluid mt-3 col-sm-12 col-md-8">
		<!-- 프로필 정보 영역 -->
		<div class="row z-depth-1 mb-3" id="profile">
			<div id="imgarea" class="mr-2">
				<img src="/upload/profile/${member.photo}" alt="" class="profileimg">
			</div>
			<div id="infoarea" class="col">
				<p class="h4-responsive mb-0 nanumB">${member.name}</p>
				<c:choose>
					<c:when test="${seq eq sessionScope.user.seq }">
						<p class="h6-responsive">${member.email}</p>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				
				<br>
				<p class="h4-responsive mb-0 nanumB">
				
				<c:choose>
					<c:when test="${empty member.state}">
					" "
					</c:when>
					<c:otherwise>
					"${member.state}"
					</c:otherwise>
				</c:choose>
				</p>
				<br>

				<c:choose>
					<c:when test="${seq eq sessionScope.user.seq }">
						<!-- 본인 -->
						<button id="myinfobtn" class="btn btn-itso btn-sm">프로필 수정</button>
					</c:when>
					<c:otherwise>
						<!-- 다른사람 -->
						<c:if test="${followcheck == 0 }">
							<!-- 팔로우x -->
							<button type="button" class="btn btn-indigo btn-sm followbtn ml-0">
								<span class="follow show" style="font-family: 'NanumbarunpenR';"><i
									class="fa fa-plus" /></i> 팔로우</span> <span class="unfollow hidden"
									style="font-family: 'NanumbarunpenR';"><i
									class="fa fa-check" /></i> 언팔로우</span>
							</button>
						</c:if>
						<c:if test="${followcheck > 0 }">
							<!-- 팔로우o -->
							<button type="button" class="btn btn-itso btn-sm followbtn">
								<span class="unfollow show"
									style="font-family: 'NanumbarunpenR';"><i
									class="fa fa-check" /></i> 언팔로우</span> <span class="follow hidden"
									style="font-family: 'NanumbarunpenR';"><i
									class="fa fa-plus" /></i> 팔로우</span>
							</button>
						</c:if>
						<input type="hidden" value="${ferlist.seq}" id="message-seq" />
						<button id="messagebtn" class="btn btn-itso btn-sm" data-toggle="modal" data-target="#centralModalSuccess">
							<i class="fa fa-envelope-o" aria-hidden="true" ></i> 메시지 보내기
						</button>
					</c:otherwise>
				</c:choose>

			</div>
			<div id="profilestat" class="">
				<ul class="nav md-pills nav-justified pills-secondary">
					<li class="nav-item"><p class="mb-0">스타일</p> <a
						data-toggle="tab" href="#socialPanel" role="tab">${fn:length(socialList) }</a></li>
					<c:if test="${seq eq sessionScope.user.seq }">
						<li class="nav-item"><p class="mb-0">좋아요</p> <a
							data-toggle="tab" href="#goodPanel" role="tab">${fn:length(goodList) }</a></li>
					</c:if>
					<li class="nav-item"><p class="mb-0">컬렉션</p> <a
						data-toggle="tab" href="#collectionPanel" role="tab">${fn:length(collectionList) }</a></li>
					<li class="nav-item"><p class="mb-0">팔로워</p> <a
						data-toggle="tab" href="#followerPanel" role="tab">${fn:length(followerList) }</a></li>
					<li class="nav-item"><p class="mb-0">팔로잉</p> <a
						data-toggle="tab" href="#followingPanel" role="tab">${fn:length(followingList) }</a></li>

				</ul>

				<%-- <div>
					<p class="mb-0">스타일</p>
					<p><a class="" data-toggle="tab"
						href="#socialPanel" role="tab">${fn:length(socialList) }</a></p>
				</div>
				<div class="">
					<p class="mb-0">좋아요</p>
					<p>${fn:length(socialList) }</p>
				</div>
				<div class="">
					<p class="mb-0">팔로워</p>
					<p><a class="" data-toggle="tab"
						href="#socialPanel" role="tab">${fn:length(followerList) }</a></p>
				</div>
				<div class="">
					<p class="mb-0">팔로잉</p>
					<p>${fn:length(followingList) }</p>
				</div>
				<div class="">
					<p class="mb-0">컬렉션</p>
					<p>${fn:length(collectionList) }</p>
				</div> --%>
			</div>
		</div>

		<div class="row">
			<!-- 탭영역 -->
			<div class="col-sm-12 z-depth-1 mr-2" id="leftarea">
				<ul class="nav md-pills nav-justified pills-secondary" id="tablist">
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#socialPanel" role="tab">스타일</a></li>
					<c:if test="${seq eq sessionScope.user.seq }">
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#goodPanel" role="tab">좋아요</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#collectionPanel" role="tab">컬렉션</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#followerPanel" role="tab">팔로워</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#followingPanel" role="tab">팔로잉</a></li>
					<!-- <li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#boardPanel" role="tab">팁 게시글</a></li> -->
				</ul>

				<!-- Tab panels -->
				<div class="tab-content">

					<!--Panel 1-->
					<div class="tab-pane fade" id="socialPanel" role="tabpanel">

						<div class="row gb" style="margin: 0xp auto;">
							<!-- Grid column -->
							<c:choose>
								<c:when test="${empty socialList }">
									<table class="table" style="width:100%;">
										<tr>
											<td>작성한 글이 없습니다.
										</tr>
									</table>
									
									
								</c:when>
								<c:otherwise>
									<c:forEach var="list" items="${socialList }">
										<div class="col-12">
											<div class="row">
												<div class="mainItem py-2">
													<!--Title-->
													<ul class="list-unstyled">
														<li class="media align-middle"><img
															class="d-flex mr-3 rounded-circle "
															src="/upload/profile/${list.user_photo}"
															style="width: 50px; height: 50px; margin-top: 10px">
															<div class="media-body" style="margin: 0px auto">
																<a class="writer-a"
																	href="userpage.go?seq=${list.social_writer }"><b
																	class="writerName" style="font-size: 20px;">${list.writerName}</b></a>&nbsp;&nbsp;
																<span class="state"><font color="gray">"${list.userState}"</font></span>
															</div></li>
														<li>
															<!--Text-->
															<p class="mb-0">
																<a href="readSocial.go?seq=${list.social_seq}">${list.social_title}</a>
															</p>
															<p class="mb-0">
																<font color="gray"><span>${list.social_date }
																</span><i class="fa fa-comment"></i> ${list.comment_count } </font>
															</p>
														</li>
													</ul>
													<!--image-->
													<div class="view">
														<img src="/upload/social/${list.photo}"
															class="card-img-top" alt="photo"> <a
															href="readSocial.go?seq=${list.social_seq}"> </a>
													</div>

													<div class="container m-0 p-0" id="social_contents">
														${list.social_contents}</div>

													<div class="btnarea my-1">
														<div class="goodarea"
															style="margin-top: 13px; float: left;">
															<c:set var="loop_flag" value="false" />
															<c:choose>
																<c:when test="${empty goodList }">
																	<i class="fa fa-heart-o red-text heart "
																		aria-hidden="true"
																		style="float: right; font-size: 25px;"
																		value="${list.social_seq}"> <font color="black">
																			0 </font></i>
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
																						color="black"> ${good.good_count } </font></i>

																					<c:set var="loop_flag" value="true" />
																				</c:when>
																				<c:otherwise>
																					<c:if test="${gstatus.last }">
																						<i class="fa fa-heart-o red-text heart"
																							aria-hidden="true"
																							style="float: left; font-size: 25px;"
																							value="${list.social_seq}"> <font
																							color="black"> ${good.good_count } </font></i>


																					</c:if>
																				</c:otherwise>
																			</c:choose>
																		</c:if>

																	</c:forEach>
																</c:otherwise>

															</c:choose>
														</div>



														<div class="sharebtnarea"
															style="margin-top: 8px; margin-bottom: 8px; float: right;">
															<input type="hidden" value="${list.social_writer }"
																class="writerseq" /> <input type="hidden"
																value="${list.social_seq }" class="socialseq" />
															<button type="button" class="btn-floating btn-sm savebtn"
																style="float: right; background-color: #fff; color: black; border: 0px; border-radius: 5px;"
																title="컬렉션에 저장" data-toggle="modal"
																data-target="#saveModal">
																컬렉션에 저장 <i class="fa fa-download"></i>
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>


									</c:forEach>

								</c:otherwise>
							</c:choose>

							<!-- Grid column -->
						</div>

					</div>
					<!--/.Panel 1-->
					<!--Panel 1-->
					<c:if test="${seq eq sessionScope.user.seq }">
						<div class="tab-pane fade" id="goodPanel" role="tabpanel">

							<div class="row gb" style="margin: 0xp auto;">
								<!-- Grid column -->
								<c:choose>
									<c:when test="${empty goodList }">
									좋아요한 글이 없습니다.
								</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${goodList }">
											<div class="col-12">
												<div class="row">
													<div class="mainItem py-2">
														<!--Title-->
														<ul class="list-unstyled">
															<li class="media align-middle"><img
																class="d-flex mr-3 rounded-circle "
																src="/upload/profile/${list.user_photo}"
																style="width: 50px; height: 50px; margin-top: 10px">
																<div class="media-body" style="margin: 0px auto">
																	<a class="writer-a"
																		href="userpage.go?seq=${list.social_writer }"><b
																		class="writerName" style="font-size: 20px;">${list.writerName}</b></a>&nbsp;&nbsp;
																	<span class="state"><font color="gray">"${list.userState}"</font></span>
																</div> <c:choose>
																	<c:when
																		test="${list.social_writer eq sessionScope.user.seq}">

																	</c:when>
																	<c:otherwise>
																		<c:choose>

																			<c:when test="${!empty followingList }">
																				<c:forEach var="flist" items="${followingList }">

																					<c:choose>
																						<c:when test="${flist.seq eq list.social_writer}">

																							<button type="button"
																								class="btn btn-itso followbtn ml-0">
																								<span class="unfollow show"
																									style="font-family: 'NanumbarunpenR';"><i
																									class="fa fa-check" /></i> 언팔로우</span> <span
																									class="follow hidden"
																									style="font-family: 'NanumbarunpenR';"><i
																									class="fa fa-plus" /></i> 팔로우</span>
																							</button>
																						</c:when>
																						<c:otherwise>

																							<button type="button"
																								class="btn btn-indigo followbtn ml-0">
																								<span class="follow show"
																									style="font-family: 'NanumbarunpenR';"><i
																									class="fa fa-plus" /></i> 팔로우</span> <span
																									class="unfollow hidden"
																									style="font-family: 'NanumbarunpenR';"><i
																									class="fa fa-check" /></i> 언팔로우</span>
																							</button>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</c:when>

																			<c:otherwise>
																				<button type="button"
																					class="btn btn-indigo followbtn ml-0">
																					<span class="unfollow hidden"
																						style="font-family: 'NanumbarunpenR';"><i
																						class="fa fa-check" /></i> 언팔로우</span> <span
																						class="follow show"
																						style="font-family: 'NanumbarunpenR';"><i
																						class="fa fa-plus" /></i> 팔로우</span>
																				</button>
																			</c:otherwise>
																		</c:choose>

																	</c:otherwise>
																</c:choose> <input type="hidden" value="${list.social_writer }"
																 /></li>
															<li>
																<!--Text-->
																<p class="mb-0">
																	<a href="readSocial.go?seq=${list.social_seq}">${list.social_title}</a>
																</p>
																<p class="mb-0">
																	<font color="gray"><span>${list.social_date }
																	</span><i class="fa fa-comment"></i> ${list.comment_count } </font>
																</p>
															</li>
														</ul>
														<!--image-->
														<div class="view">
															<img src="/upload/social/${list.photo}"
																class="card-img-top" alt="photo"> <a
																href="readSocial.go?seq=${list.social_seq}"> </a>
														</div>

														<div class="container m-0 p-0" id="social_contents">
															${list.social_contents}</div>

														<div class="btnarea my-1">
															<div class="goodarea"
																style="margin-top: 13px; float: left;">

																<i class="fa fa-heart red-text heart" aria-hidden="true"
																	style="float: left; font-size: 25px;"
																	value="${list.social_seq}"> <font color="black">
																		${list.good_count } </font></i>
															</div>



															<div class="sharebtnarea"
																style="margin-top: 8px; margin-bottom: 8px; float: right;">
																<input type="hidden" value="${list.social_writer }"
																	class="writerseq" /> <input type="hidden"
																	value="${list.social_seq }" class="socialseq" />
																<button type="button"
																	class="btn-floating btn-sm savebtn"
																	style="float: right; background-color: #fff; color: black; border: 0px; border-radius: 5px;"
																	title="컬렉션에 저장" data-toggle="modal"
																	data-target="#saveModal">
																	컬렉션에 저장 <i class="fa fa-download"></i>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>

									</c:otherwise>
								</c:choose>

								<!-- Grid column -->
							</div>

						</div>
					</c:if>
					<!--/.Panel 1-->
					<!--Panel 2-->
					<div class="tab-pane fade" id="collectionPanel" role="tabpanel">
						<table class="table">
							<tbody>
								<c:choose>
									<c:when test="${!empty collectionList }">
										<c:set var="num" value="0" />
										<c:forEach var="clist" items="${collectionList }">
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
														<button class="textbtn editbtn" data-toggle="modal"
															data-target="#editCollectionModal">수정</button>
														<button class="textbtn removebtn">삭제</button>
														<input type="hidden" value="${clist.collection_seq }"
															name="collectionseq" />
													</div></td>
												<td><c:set var="loop" value="true" /> <c:set var="num"
														value="0" /> <c:forEach var="slist" items="${photoList }">
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
					<!--/.Panel 2-->

					<!--Panel 3-->
					<div class="tab-pane fade" id="followerPanel" role="tabpanel">
						<table class="table mb-0">
							<c:choose>
								<c:when test="${empty followerList }">
									<tr>
										<td>나를 팔로우 하는 사람이 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach var="ferlist" items="${followerList }">
										<tr>
											<td width=100>
												<div class="profilearea">
													<img src="/upload/profile/${ferlist.photo }" alt=""
														class="profileimg">
												</div> <input type="hidden" value="${ferlist.seq }" />
											</td>
											<td style="height: 100px; vertical-align: middle"><h6
													class="mt-1">${ferlist.name }</h6> <c:choose>
													<c:when test="${ferlist.seq eq sessionScope.user.seq }">

													</c:when>
													<c:otherwise>
														<c:if test="${ferlist.followcheck eq 'n' }">
															<button type="button" class="btn btn-indigo followbtn">
																<span class="follow show"
																	style="font-family: 'NanumbarunpenR';"><i
																	class="fa fa-plus" /></i> 팔로우</span> <span
																	class="unfollow hidden"
																	style="font-family: 'NanumbarunpenR';"><i
																	class="fa fa-check" /></i> 언팔로우</span>
															</button>
														</c:if>
														<c:if test="${ferlist.followcheck eq 'y' }">
															<button type="button" class="btn btn-itso followbtn">
																<span class="unfollow show"
																	style="font-family: 'NanumbarunpenR';"><i
																	class="fa fa-check" /></i> 언팔로우</span> <span
																	class="follow hidden"
																	style="font-family: 'NanumbarunpenR';"><i
																	class="fa fa-plus" /></i> 팔로우</span>
															</button>
														</c:if>
														<input type="hidden" value="${ferlist.seq }" id="seq" />
													</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>

					</div>
					<!--/.Panel 3-->
					<!--Panel 4-->
					<div class="tab-pane fade" id="followingPanel" role="tabpanel">
						<table class="table mb-0">
							<c:choose>
								<c:when test="${empty followingList }">
									<tr>
										<td>팔로우 하는 사람이 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach var="finglist" items="${followingList }">
										<tr>
											<td width=100>
												<div class="profilearea">
													<img src="/upload/profile/${finglist.photo }" alt=""
														class="profileimg">
												</div>
											</td>

											<td style="height: 100px; vertical-align: middle">
												<h6 class="mt-1">${finglist.name }</h6> <c:choose>
													<c:when test="${ferlist.seq eq sessionScope.user.seq }">

													</c:when>
													<c:otherwise>
														<c:if test="${finglist.followcheck eq 'n' }">
															<button type="button" class="btn btn-indigo followbtn">
																<span class="follow show"
																	style="font-family: 'NanumbarunpenR';"><i
																	class="fa fa-plus" /></i> 팔로우</span> <span
																	class="unfollow hidden"
																	style="font-family: 'NanumbarunpenR';"><i
																	class="fa fa-check" /></i> 언팔로우</span>
															</button>
														</c:if>
														<c:if test="${finglist.followcheck eq 'y' }">
															<button type="button" class="btn btn-itso followbtn">
																<span class="unfollow show"
																	style="font-family: 'NanumbarunpenR';"><i
																	class="fa fa-check" /></i> 언팔로우</span> <span
																	class="follow hidden"
																	style="font-family: 'NanumbarunpenR';"><i
																	class="fa fa-plus" /></i> 팔로우</span>
															</button>
														</c:if>
														<input type="hidden" value="${ferlist.seq }" id="seq" />
													</c:otherwise>
												</c:choose>
											</td>

										</tr>

									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<!--/.Panel 4-->

					<!--Panel 5-->
					<div class="tab-pane fade" id="boardPanel" role="tabpanel">
						<c:choose>
							<c:when test="${!empty tipList}">
								<table style="width: 100%;" class="mt-2">

									<c:forEach items="${tipList}" var="list">
										<tr>
											<td>[${list.category}]</td>
											<td><a href="userpage.go?seq=${list.tip_writer}">${list.name}</a></td>
											<td class="tip-title"><a
												href="getSpecificTipView.tip?seq=${list.tip_seq}">${list.tip_title}</a></td>
											<td><i class=" fa fa-heart red-text" aria-hidden="true">${list.tip_like_count}</i>
												<i class="fa fa-comment amber-text" aria-hidden="true">${list.tip_comment_count}</i>
												<i class="fa  fa-eye" aria-hidden="true">${list.tip_viewcount}</i>
											</td>
											<td class=tip-date>${list.tip_date}</td>
										</tr>
									</c:forEach>
								</table>
							</c:when>
							<c:otherwise>
									작성한 글이 없습니다.
								</c:otherwise>
						</c:choose>
					</div>
					<!--/.Panel 5-->

					<!-- Modal -->
					<div class="modal fade" id="editCollectionModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-sm" role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading lead mb-0">컬렉션 수정</p>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">
									<input type="hidden" id="seqform" />
									<div class="md-form">
										<input type="text" id="titleform" class="form-control"
											name="collection_title" maxlength="30" autofocus> <label
											for="titleform">컬렉션 이름</label>
									</div>
									<div class="md-form mt-1">
										<textarea type="text" id="contentsform"
											class="md-textarea form-control" rows="3"
											name="collection_contents"></textarea>
										<label for="form7" class="mb-0">컬렉션 상세 설명</label>
									</div>
								</div>

								<!--Footer-->
								<div class="modal-footer justify-content-center">
									<button class="btn btn-itso" data-toggle="modal"
										data-target="#modal" id="savebtn">수정</button>
									<button class="btn btn-outline-itso waves-effect"
										data-dismiss="modal">취소</button>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>

				</div>
			</div>
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
										<h4 class="mt-1 mb-1 text-truncate">${clist.collection_title }</h4>
										<h6 class="text-truncate">${clist.collection_contents }</h6>
										<input type="hidden" class="collectionseq"
											value="${clist.collection_seq }" />
										<div class="collectionPhoto">

											<c:set var="num" value="0" />

											<c:forEach items="${photoList }" var="plist"
												varStatus="status">
												<c:choose>
													<c:when test="${num < 4 }">
														<c:if
															test="${plist.collection_seq == clist.collection_seq }">
															<c:set var="num" value="${num+1 }" />

															<div class="collectionPhotoItem">
																<img src="/upload/social/${plist.photo }" alt=""><input
																	type="hidden" class="socialseq"
																	value="${plist.social_seq }" />
															</div>
														</c:if>
													</c:when>
													<c:otherwise>
														<c:if
															test="${plist.collection_seq == clist.collection_seq }">
															<div class="collectionPhotoItem" style="display: none;">
																<img src="/upload/social/${plist.photo }" alt=""><input
																	type="hidden" class="socialseq"
																	value="${plist.social_seq }" />
															</div>
														</c:if>
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
						<textarea id="form7" class="md-textarea form-control" rows="3"
							name="collection_contents"></textarea>
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
		                cursor.find(".collectionPhoto").append(
		                    '<div class="collectionPhotoItem">' +
		                    '<img src="/upload/social/' + data.photo + '"> <input type="hidden" class="socialseq" value="' + data.social_seq + '">' +
		                    '</div>');
		                if (num > 4) {
		                    cursor.find(".collectionPhoto:last").attr("display", "none");
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
		                $("#createModal").hide();

		                $("#collectionarea").append(
		                    '<div class="collectionItem z-depth-1 mt-2">' +
		                    '<h4 class="mt-1 mb-1 text-truncate">' +
		                    dto.collection_title +
		                    '</h4><h6 class="text-truncate">' +
		                    dto.collection_contents +
		                    '</h6>' +
		                    '<input type="hidden" class="collectionseq" value="' + dto.collection_seq + '"/>' +
		                    '<div class="collectionPhoto"></div></div><h6 class="mb-0" style="height: 19px;"></h6>');

		                $("#saveModal").show();

		            }
		        });
		        }
		    });
		$("#createModal").on('show.bs.modal', function () {
		    $("#saveModal").hide();
		});

		$("#createModal").on('hidden.bs.modal', function () {
		    $("#saveModal").show();
		});

		$("#saveModal").on('hidden.bs.modal', function () {
		    console.log("닫힘");
		    $(".collectionItem").removeClass("active");
		});

		
		
		$("#messagebtn").click(function(){
			var seq	="${seq}";
			alert(seq);
			var message=""
				
			$.ajax({
			    url :"messageUser.ajax",
			    type: "post",
			    data: {
			    	seq :seq
			    },
			    success : function(data){
			   	  showMessageUser(data);
			   	  showMessageList(data)
			   	console.log(data.message[0].contents);
			   	console.log(data.message[1].contents);
			 

			    }
				
			});
	
		
			
		});
	
		document.title = "${member.name}" ;
		 
		
	</script>
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
</html>