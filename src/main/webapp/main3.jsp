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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
/* hover */
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

.dropdown-toggle {
	border: 1px solid #e9e9e9;
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
						href="main.go?gender=m&age=${pAge}&main=${main}&feed=${feed}">남성</a> <a
						class="dropdown-item flex-center droptxt2"
						href="main.go?gender=f&age=${pAge }&main=${main}&feed=${feed}">여성</a>
				</div>
				<div class="btn-group">
					<button class="btn btn-sm dropdown-toggle droptxt1" type="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						id="age">${age}</button>
					<div class="dropdown-menu">
						<a class="dropdown-item flex-center droptxt2"
							href="main.go?age=0&gender=${pGender }&main=${main}&feed=${feed}">모든연령 </a> <a
							class="dropdown-item flex-center droptxt2"
							href="main.go?age=10&gender=${pGender }&main=${main}&feed=${feed}">10대</a> <a
							class="dropdown-item flex-center droptxt2"
							href="main.go?age=20&gender=${pGender }&main=${main}&feed=${feed}">20대</a> <a
							class="dropdown-item flex-center droptxt2"
							href="main.go?age=30&gender=${pGender }&main=${main}&feed=${feed}">30대</a> <a
							class="dropdown-item flex-center droptxt2"
							href="main.go?age=40&gender=${pGender }&main=${main}&feed=${feed}">40대</a>
					</div>
					<div class="btn-group">
						<button class="btn btn-sm dropdown-toggle droptxt1" type="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Full
							view</button>
						<div class="dropdown-menu">
							<a class="dropdown-item flex-center droptxt2"
								href="main.go?main=full&age=${age}&gender=${pGender }&main=${main}&feed=${feed}">Full view</a> <a
								class="dropdown-item flex-center droptxt2"
								href="main.go?main=thumbnail&age=${age}&gender=${pGender }&main=${main}&feed=${feed}">Thumbnail view</a>
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
					<c:forEach items="${socialList}" var="list">

						<div class="gridPhoto col-lg-3 col-md-12 mb-3">
							
							<a href="#"> <img src="resources/images/background.jpg"
								class="img-fluid z-depth-2" alt="Responsive image">
							</a>
							<div class="photoContainer">
								<input type="hidden" class="inputSocialSeq" value="${list.social_seq }"/>
								<div class="photoContainerHover z-depth-2">
									<h1 class="photoContainerHoverTitle">${list.social_title}</h1>
									<p class="photoContainerHoverWriter">by
										${list.writerName}</p>
									<img src="upload/social/${list.photo}"
										class="img-fluid z-depth-2" alt="Responsive image"
										onclick="location='main.jsp'">
									<c:if test="${!empty sessionScope.user }">
										<button class="photoContainerButton1 btn btn-elegant"
											id="hypeBtn1" onmouseover="hypeOn()" onmouseout="hypeOut()"
											data-hover="+1">HYPE</button>
										<a href="" class="savebtn btn btn-elegant"
											data-toggle="modal" data-target="#saveModal">save</a>
									</c:if>
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

												<c:set var="check" value="true" />
												<c:set var="num" value="0" />

												<c:forEach items="${photoList }" var="plist"
													varStatus="status">
													<c:choose>
														<c:when test="${check eq true }">
															<c:if
																test="${plist.collection_seq == clist.collection_seq }">
																<c:set var="num" value="${num+1 }" />
																
																<div class="collectionPhotoItem"><img src="/upload/social/${plist.photo }"
																	alt=""><input type="hidden" class="socialseq" value="${plist.social_seq }"/></div>
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

		<!-- Button trigger modal -->
		<div class="text-center"></div>
	</div>


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
	
	$("#managebtn").on("click", function() {
		window.open('mypage.go?view=collection', '_blank');
	})
	
	social_seq = 0;
	$('.savebtn').on("click", function() {
		social_seq=$(this).parent().siblings(".inputSocialSeq").val();
		console.log(social_seq);
	})

	$("#collectionarea").on("click", ".collectionItem", function() {
		$(this).toggleClass('active');
		var collection_seq =$(this).children(".collectionseq").val();
		console.log("collection_seq: " + collection_seq);
		
		console.log("social_seq: "+social_seq);
		$.ajax({
	        url:"saveCollection.ajax",
	        type:"post",
	        data:{
	          collection_seq:collection_seq,
	          social_seq:social_seq
	        },
	        success:function(data){
	          console.log("들어옴:"+data);
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
</script>



</html>