<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>It So</title>
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
.footer-brand{
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
	display:none;
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
	float:left;
	display: inline;
	padding: 1px;
}
.collectionPhotoItem img {
	width: 105px;
}
.active {
	border: 3px solid #21FCFF;
	margin-left: 1px;
}

.btn-group {
	margin-left: 3px;
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
				var scrolltop = $(window).scrollTop();
				if ($(this).scrollTop() > 500) {
					$('#MOVE_TOP_BTN').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();

				}

				if (scrolltop == $(document).height() - $(window).height()) {
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
		
		$(".followbtn").on('click', function () {
		    var seq = $(this).siblings('.writerseq').val();
		    var text = $(this).find('.show').text();
		    console.log("text: " + text);
		    var btn = $(".writerseq[value='"+seq+"']").siblings("button.followbtn");
		    var span = btn.find('span');
		    $.ajax({
		        url: "followUser.ajax",
		        type: "post",
		        data: {
		            seq: seq,
		            text: text
		        },
		        success: function (response) {
		            if (response != null) {
		                console.log("DB success : " + response);
		                btn.toggleClass("btn-itso");
		                btn.toggleClass("btn-indigo");
		                span.toggleClass("hidden");
		                span.toggleClass("show");
		            }
		        },
		        error: function (response) {
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
													style="font-size: 20px;">${list.writerName}</b></a>&nbsp;&nbsp;<font
													color="gray">"${list.userState}"</font>

											</div> <!-- <script type="text/javascript">
										console
												.log("${goodCount[status.count]}");
									</script> -->
											<div class="goodarea">
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
									<p class="card-text">${list.social_title}</p>
									<c:choose>
									<c:when test="${!empty followingList }">
									<c:forEach var="flist" items="${followingList }">
									<c:choose>
										<c:when test="${list.social_writer eq sessionScope.user.seq}">
									        
									    </c:when>
									    <c:otherwise>
									    	<c:choose>
									    		<c:when test="${flist.seq eq list.social_writer}">
									        <button type="button" class="btn btn-itso followbtn">
												<span class="unfollow show" style="font-family: 'NanumbarunpenR';"><i class="fa fa-check"/></i> 언팔로우</span>
												<span class="follow hidden" style="font-family: 'NanumbarunpenR';"><i class="fa fa-plus"/></i> 팔로우</span>
											</button>
									    </c:when>
									    <c:otherwise>
									        <button type="button" class="btn btn-indigo followbtn">
												<span class="follow show" style="font-family: 'NanumbarunpenR';"><i class="fa fa-plus"/></i> 팔로우</span>
												<span class="unfollow hidden" style="font-family: 'NanumbarunpenR';"><i class="fa fa-check"/></i> 언팔로우</span>
											</button>
									    </c:otherwise>
									    	</c:choose>									    
									    </c:otherwise>
									</c:choose>	
									</c:forEach>
									</c:when>
									<c:otherwise>
									<button type="button" class="btn btn-indigo followbtn">
										<span class="unfollow hidden" style="font-family: 'NanumbarunpenR';"><i class="fa fa-check"/></i> 언팔로우</span>
										<span class="follow show" style="font-family: 'NanumbarunpenR';"><i class="fa fa-plus"/></i> 팔로우</span>
									</button>
									</c:otherwise>
									</c:choose>
									
									
									<input type="hidden" value="${list.social_writer }" class="writerseq"/>
									<input type="hidden" value="${list.social_seq }" class="socialseq"/>
									<button type="button" class="btn btn-indigo savebtn" data-toggle="modal" data-target="#saveModal">
										<i class="fa fa-upload" > <span
											style="font-family: 'NanumbarunpenR';">컬렉션에저장</span></i>
									</button>
									<!--share-->
									<!--kakao--> 
									<button type="button" class="btn-floating btn-sm btn-is share " 
										style="float: right; background-color: #ffff00; color: black; border: 0px; margin-left: 10px; border-radius: 5x;" id="kakao-link-btn" onclick="kakaogo()"> 
										<i class="fa fa-comment"></i>
									</button>
									<!--twitter-->
									<button type="button" class="btn-floating btn-sm btn-tw share"
										style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 6px;" onclick="twittergo()"> 
										<i class="fa fa-twitter"></i> 
									</button>
									<!--facebook-->
									<button type="button" class="btn-floating btn-sm btn-fb share"
										style="float: right; background-color: #4267b2; color: white; border: 0px; border-radius: 5px;"  onclick="facebookgo()"> 
										<i class="fa fa-facebook"></i> 
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
							<button class="btn btn-indigo" id="managebtn"> 컬렉션 관리 </button>
						</div>

						<c:choose>
							<c:when test="${not empty collectionList }">
								<div id="collectionarea" class="mt-2">
									<c:set var="num" value="0"></c:set>
									<c:forEach items="${collectionList}" var="clist">
									
										<div class="collectionItem z-depth-1 mt-2">									
											<h4 class="mt-1 mb-1">${clist.collection_title }</h4>
											<h6>${clist.collection_contents }</h6>
											<input type="hidden" class="collectionseq" value="${clist.collection_seq }"/>
											<div class="collectionPhoto">

												<c:set var="num" value="0" />

												<c:forEach items="${photoList }" var="plist"
													varStatus="status">
													<c:choose>
														<c:when test="${num < 4 }">
															<c:if test="${plist.collection_seq == clist.collection_seq }">
																<c:set var="num" value="${num+1 }" />
																
																<div class="collectionPhotoItem"><img src="/upload/social/${plist.photo }"
																	alt=""><input type="hidden" class="socialseq" value="${plist.social_seq }"/></div>
															</c:if>
														</c:when>
														<c:otherwise>
															<c:if test="${plist.collection_seq == clist.collection_seq }">
															<div class="collectionPhotoItem" style="display:none;"><img src="/upload/social/${plist.photo }"
																	alt=""><input type="hidden" class="socialseq" value="${plist.social_seq }"/></div>
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
							<input type="text" id="inputMD" class="form-control" name="collection_title" maxlength="30"> <label
								for="inputMD">컬렉션 이름</label>
						</div>
						<div class="md-form mt-1">
							<textarea type="text" id="form7" class="md-textarea form-control"
								rows="3"  name="collection_contents"></textarea>
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

		</div>
	
	</div>
		<!--side footer -->
		<div id="sidefooter">
			
			<p><a class="footer-brand" href="#"><img id="logo" alt=""
			src="resources/images/logo_black.png"></a>©2018 ItSo. All rights reserved.</p>
			<p>
				<a href="#">language</a>· <a href="#">help</a>· <a href="#">widgets</a>·
				<a href="#">advertise</a>· <a href="#">legal</a>
			</p>
		</div>
	
	<script>
	$("#managebtn").on("click", function() {
		window.open('mypage.go?view=collection', '_blank');
	})
	
	social_seq = 0;
	$('.savebtn').on("click", function() {
		social_seq=$(this).siblings(".socialseq").val();
		console.log(social_seq);
		
		var clistsize = "${fn:length(collectionList)}";
		
		for(var i=1; i<=clistsize; i++) {
			var cursor = $(".collectionItem:nth-of-type("+i+")");
			var plistsize = cursor.find(".collectionPhotoItem").length;
			
			for(var j=1; j<=plistsize; j++) {
				var collection_socialseq = $(cursor).find(".collectionPhotoItem:nth-of-type("+j+")").find(".socialseq").val();
				console.log("검사 : "+ i + "," + j + ":" + social_seq + ":" + collection_socialseq ); 
				if(social_seq == collection_socialseq) {
					cursor.addClass("active");
					console.log("true");
					break;
				}
			}
		}
	})

	$("#collectionarea").on("click", ".collectionItem", function() {
		var cursor = $(this);
		cursor.toggleClass('active');
		var collection_seq =$(this).children(".collectionseq").val();
		console.log("collection_seq: " + collection_seq);
		console.log("social_seq: "+social_seq);
		
		var num = $(this).find(".collectionPhotoItem").length;
		$.ajax({
	        url:"saveCollection.ajax",
	        type:"post",
	        data:{
	          collection_seq:collection_seq,
	          social_seq:social_seq
	        },
	        success:function(data){
	        	console.log("ajax: " + data.photo +"," + data.social_seq)
		        if(data.photo != null) {
		        	console.log("여기");
			        cursor.find(".collectionPhoto").append('<div class="collectionPhotoItem">'
			          +'<img src="/upload/social/'+data.photo+'"> <input type="hidden" class="socialseq" value="'+data.social_seq+'">'
			          +'</div>');
		            if(num > 4) {
		        		cursor.find(".collectionPhoto:last").attr("display", "none");
		        	}
	        	} else {
	        		cursor.find(".collectionseq[value='"+collection_seq+"']").siblings(".collectionPhoto").find(".socialseq[value='"+social_seq+"']").parent().remove();
	        	}
	        },
	        error: function (response) {
	            console.log("DB Failed")
	        }
	        
	        
	     });
	 
	})
	
	$("#createcolbtn").on('click', function() {
		var collection_title = $("input[name='collection_title']").val();
		var collection_contents = $("textarea[name='collection_contents']").val();
		
		$.ajax({
	        url:"createCollection.ajax",
	        type:"post",
	        data:{
	          collection_title:collection_title,
	          collection_contents:collection_contents
	        },
	        success:function(data){
	          console.log("생성");
	          $("input[name='collection_title']").val("");
	          $("textarea[name='collection_contents']").val("");
	          $("#createModal").hide();
	          $("#saveModal").show();
	        }
	    });
	});

	$("#createModal").on('show.bs.modal', function() {
		$("#saveModal").hide();
	});
	
	$("#createModal").on('hidden.bs.modal', function() {
		$("#saveModal").show();
	});
	
	$("#saveModal").on('show.bs.modal', function() {
		
		
		
	});
	
	$("#saveModal").on('hidden.bs.modal', function() {
		console.log("닫힘");
		$(".collectionItem").removeClass("active");
	});
	
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