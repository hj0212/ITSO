<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>팁 게시판 | ITSO</title>


<!-- Font Awesome 4.7-->
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
<!-- JQuery 원래 밑에 있었음-->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- flickity carousel css / js -->
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>


<style>
ul {
	list-style-type: none;
	padding-left: 0px;
}

.card-img-top, .card {
	border-radius: 0px;
}

.btn-itso {
	background-color: #1B0946;
	color: white;
}

table {
	width: 100%;
}

#bestTipList {
	margin-bottom: 60px;
}

.tip-card-thumbnail img {
	width: 100%;
	height: 30vh;
	margin: 0 auto;
}

/* Carousel */
.carousel-cell {
	width: 100%;
	height: 500px;
	margin-right: 10px;
}

@media screen and ( min-width: 768px ) {
	/* half-width cells for larger devices */
	.carousel-cell {
		width: 40vh;
	}
}

.carousel-cell.is-selected {
	background: #ED2;
	z-index: 0;
}

/* position dots up a bit */
.flickity-page-dots {
	bottom: -22px;
}
/* dots are lines */
.flickity-page-dots .dot {
	height: 4px;
	width: 40px;
	margin: 0;
	border-radius: 0;
}

.text-center {
	text-align: center;
}
</style>



</head>

<body>


	<!-- navi -->
	<%@include file="navi.jsp"%>

	<!-- <button class="btn btn-itso" onclick="javascript:location.href='goAdminPageWithAllAnalysisData.adm'">관리자 페이지</button> -->

	<!-- tip board main page -->
	<div id="bestTipList" class="mt-4">
		<div class="container">
			<h1 class="mb-3">
				<i class="fa fa-thumbs-o-up align-top"></i> 베스트 팁
			</h1>
		</div>
		<!-- Card deck -->
		<div class="container main-carousel"
			data-flickity='{ "cellAlign": "left", "contain": true }'>
			<!-- Card1 -->
			<c:forEach items="${upvotingArticles}" var="upvotingArticles"
				varStatus="status">
				<div class="mb-4 carousel-cell">
					<!--Card image-->
					<div class="view overlay tip-card-thumbnail">

						<c:choose>
							<c:when test="${!empty upvotingArticles.thumbnail}">
								
								${upvotingArticles.thumbnail}
								
							</c:when>
							<c:otherwise>
								<img src="resources/images/default-thumbnail-tip.jpg" />
							</c:otherwise>
						</c:choose>
					</div>



					<!--Card content-->
					<div class="card-body">

						<!--Title-->
						<h4 class="card-title">${upvotingArticles.tip_title}</h4>
						<div>
							<a><i class=" fa fa-heart red-text" aria-hidden="true"></i>
								${upvotingArticles.tip_like_count} </a> <a><i
								class="fa fa-comment amber-text" aria-hidden="true"></i>${upvotingArticles.tip_comment_count}</a>
							<a><i class="fa fa-eye" aria-hidden="true"></i>${upvotingArticles.tip_viewcount}</a>
						</div>

						<form class="reportForm">
							<span> by <a href="" class="" data-toggle="modal"
								name="${status.index}" class="userName"
								data-target="#reportModal">${upvotingArticles.name}</a> <input
								type="hidden" name="${status.index}" class="userSeq"
								value="${upvotingArticles.tip_writer}"> <input
								type="hidden" class="sessionUser"
								value="${sessionScope.user.seq}">
							</span>
						</form>



						<!--Text-->
						<p class="card-text">${upvotingArticles.category}</p>
						<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->

						<div>
							<button id=best-tip-read-btn type="button"
								onclick="javascript:location.href='getSpecificTipView.tip?seq=${upvotingArticles.tip_seq}'"
								class=" btn btn-itso btn-md">읽기</button>
						</div>
					</div>
				</div>




			</c:forEach>

		</div>
	</div>

	<!-- status.index 때문에, 이 line위치가 c:forEach를 벗어날 시 작동 X -->

	<script>
		$(document).ready(function() {

			$("#reportSubmitBtn").click(function(e) {
				var index = $(this).index();

				console.log(index);
				var data = JSON.stringify({

					user_name : $(".userName[name|=${status.index}]").html(),
					user_seq : $(".userSeq[name|=${status.index}]").val(),
					reporting_user : $(".sessionUser").val(),

					report_reason : $(".reportReason:checked").val()

				});

				console.log(data);
				$.ajax({
					url : "reportProc.adm",
					data : data,
					type : "post",
					dataType : "json",
					contentType : "application/json;charset=UTF-8",
					success : function(result) {
						if (result > 0) {
							alert(userName + "을 신고하였습니다.");

						}
					},
					error : function() {
						console.log("error");
					}
				})
			})

		})
	</script>




	<!-- recent tip list -->

	<div class="container " id="beautyTipList">
		<h2 class="">뷰티</h2>
		<ul>
			<li>
				<table>
					<!-- for each jstl 적용될 부분 -->
					<c:forEach items="${beautyTipData}" var="beautyTipData">
						<tr class="clearfix">
							<!-- left title -->
							<td class="float-left"><a class="mr-2"
								href="getSpecificTipView.tip?seq=${beautyTipData.tip_seq}">${beautyTipData.tip_title}</a>by
								${beautyTipData.name}</td>
							<!-- right info -->
							<td class="float-right"><i class="fa fa-comment amber-text"
								aria-hidden="true"></i>${beautyTipData.tip_comment_count}</td>
							<td class="float-right"><i class=" fa fa-heart red-text"
								aria-hidden="true"></i>${beautyTipData.tip_like_count}</td>
							<td class="float-right"><i class="fa fa-eye"
								aria-hidden="true"></i>${beautyTipData.tip_viewcount}</td>
						</tr>
					</c:forEach>
					<!-- 적용 끝 -->
				</table>
			</li>
		</ul>

	</div>


	<div class=" container" id="dietTipList">
		<h2 class="">다이어트</h2>
		<ul>
			<li>
				<table>
					<!-- for each jstl 적용될 부분 -->

					<c:forEach items="${dietTipData}" var="dietTipData">
						<tr class="clearfix">
							<td class="float-left"><a class="mr-2"
								href="getSpecificTipView.tip?seq=${dietTipData.tip_seq}">${dietTipData.tip_title}</a>by
								${dietTipData.name}</td>

							<td class="float-right"><i class="fa fa-comment amber-text"
								aria-hidden="true"></i>${dietTipData.tip_comment_count}</td>
							<td class="float-right"><i class="fa fa-heart red-text"
								aria-hidden="true"></i>${dietTipData.tip_like_count}</td>
							<td class="float-right"><i class="fa fa-eye"
								aria-hidden="true"></i>${dietTipData.tip_viewcount}</td>
						</tr>
					</c:forEach>
					<!-- 적용 끝 -->
				</table>

			</li>
		</ul>

	</div>



	<div class="container" id="fashionTipList">
		<h2 class="">패션</h2>
		<ul>
			<li>
				<table>
					<!-- for each jstl 적용될 부분 -->
					<c:forEach items="${fashionTipData}" var="fashionTipData">
						<tr class="clearfix">

							<td class="float-left"><a class="mr-2"
								href="getSpecificTipView.tip?seq=${fashionTipData.tip_seq}">${fashionTipData.tip_title}</a>by
								${fashionTipData.name}</td>


							<td class="float-right"><i class="fa fa-comment amber-text"
								aria-hidden="true"></i>${fashionTipData.tip_comment_count}</td>
							<td class="float-right"><i class="fa fa-heart red-text"
								aria-hidden="true"></i>${fashionTipData.tip_like_count}</td>
							<td class="float-right"><i class="fa fa-eye"
								aria-hidden="true"></i>${fashionTipData.tip_viewcount}</td>
						</tr>
					</c:forEach>
					<!-- 적용 끝 -->
				</table>

			</li>
		</ul>
	</div>

	<div class=" container" id="etcTipList">
		<h2>기타</h2>
		<ul>
			<li>
				<table>
					<!-- for each jstl 적용될 부분 -->
					<c:forEach items="${etcTipData}" var="etcTipData">
						<tr class="clearfix">
							<td class="float-left"><a class="mr-2"
								href="getSpecificTipView.tip?seq=${etcTipData.tip_seq}">${etcTipData.tip_title}</a>by
								${etcTipData.name}</td>


							<td class="float-right"><i class="fa fa-comment amber-text"
								aria-hidden="true"></i>${etcTipData.tip_comment_count}</td>
							<td class="float-right"><i class="fa fa-heart red-text"
								aria-hidden="true"></i>${etcTipData.tip_like_count}</td>
							<td class="float-right"><i class="fa fa-eye"
								aria-hidden="true"></i>${etcTipData.tip_viewcount}</td>

						</tr>
					</c:forEach>
					<!-- 적용 끝 -->
				</table>

			</li>
		</ul>
	</div>


	<div id="btns" class="container">
		<c:choose>
			<c:when test="${!empty sessionScope.user.seq}">
				<button class="btn btn-itso"
					onclick="location.href='tipInsertPage.go'">팁 쓰기</button>
			</c:when>
		</c:choose>
	</div>




	<!-- Report Modal dummy -->

	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<!--Content-->
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header">
					<p class="heading lead mb-0">신고하기</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!--Body-->
				<div class="modal-body" style="text-align: center;">
					<input type="hidden" name="user_seq" value="1"> <input
						type="hidden" name="target_seq" value="2">
					<div id="modalbtnarea container">
						<button class="btn btn-itso" data-toggle="modal"
							data-target="#reportTheUser">신고</button>
						<button class="btn btn-itso" data-toggle="modal"
							data-target="#blockTheUser">차단</button>
						<button class="btn btn-outline-itso waves-effect"
							data-dismiss="modal" style="color: black;">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- report : reportTheUser modal -->
	<div class="modal fade" id="reportTheUser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<!--Content-->
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header">
					<p class="heading lead mb-0">신고</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!--report modal Body-->
				<div class="modal-body">

					<div class="text-center mb-4">
						<span class="instafilta-target"><i
							class="fa fa-user-times fa-5x red-text"></i></span>
					</div>
					<div class="mb-4">신고하는 이유를 알려주세요. 해당 정보는 웹서비스 운영에 참고가 됩니다.
						신고자 정보는 피신고자에게 공개하지 않습니다.</div>
					<div>
						<div class="form-check">
							<input class="form-check-input reportReason" type="radio"
								name="exampleRadios" id="exampleRadios1" value="그냥 마음에 들지 않습니다."
								checked> <label class="form-check-label"
								for="exampleRadios1"> 그냥 마음에 들지 않습니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input reportReason" type="radio"
								name="exampleRadios" id="exampleRadios2" value="스팸"> <label
								class="form-check-label" for="exampleRadios2"> 스팸입니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input reportReason" type="radio"
								name="exampleRadios" id="exampleRadios3"
								value="신체노출, 나체 게시물 및 음란물"> <label
								class="form-check-label" for="exampleRadios3"> 신체 노출, 나체
								게시물 및 음란물 </label>
						</div>

						<div class="form-check">
							<input class="form-check-input reportReason" type="radio"
								name="exampleRadios" id="exampleRadios4" value="편파적 발언 및 상징">
							<label class="form-check-label" for="exampleRadios4"> 편파적
								발언 및 상징 </label>
						</div>

						<div class="md-form">
							<textarea name="report_reason" type="text" id="form7"
								class="md-textarea form-control reportReason" rows="1"></textarea>
							<label for="form7">기타</label>
						</div>
					</div>
				</div>
				<!--Footer-->
				<div class="modal-footer justify-content-center">
					<button type=submit id="reportSubmitBtn" class="btn btn-itso"
						data-toggle="modal" data-target="#modal">제출</button>
					<button type=button class="btn btn-outline-itso"
						data-dismiss="modal" style="color: black;">취소</button>
				</div>
			</div>
		</div>
	</div>


	<!-- reportTheUser modal end -->



	<!--  차단 -->
	<div class="modal fade" id="blockTheUser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<!--Content-->
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header">
					<p class="heading lead mb-0">차단</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!--Body-->
				<div class="modal-body">
					<div class="text-center mb-4">
						<span class="instafilta-target"><i
							class="fa fa-hand-stop-o fa-5x red-text"></i></span>
					</div>
					<label for="rddisabled" class="disabled">상대방은 ITSO에서 회원님의
						프로필,게시물을 찾을 수 없습니다. ITSO는 회원님이 차단한 사실을 상대방에게 알리지 않습니다.</label>
				</div>

				<!--Footer-->
				<div class="modal-footer justify-content-center">
					<button class="btn btn-itso" data-toggle="modal"
						data-target="#modal">차단</button>
					<button class="btn btn-outline-itso waves-effect"
						data-dismiss="modal" style="color: black;">취소</button>
				</div>
			</div>

		</div>
	</div>






	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
</body>

</html>