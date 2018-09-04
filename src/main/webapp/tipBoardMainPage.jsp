<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

a, a:hover {
	text-decoration: none;
}

#wrapper {
	min-height: 100%;
	position: relative;
	margin-bottom: 100px; /* footer height */
}

ul {
	list-style-type: none;
	padding-left: 0px;
}

.list-category {
	text-align: center;
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

table th {
	text-align: center;
}

.tip-title {
	text-align: center;
}

.text-center {
	text-align: center;
}

.tip-date {
	text-align: right;
}

#tipcategory {
	background-color: #1B0946;
}
</style>

</head>

<body>
	<!-- navi -->
	<%@include file="navi.jsp"%>


	<!-- best tips -->
	<c:if test="${!empty upvotingArticles}">
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
								<span> by <a href="#" data-toggle="modal"
									class="userName" data-target="#reportModal">${upvotingArticles.name}</a>
									<input type="hidden" name="${status.index}" class="userSeq"
									value="${upvotingArticles.tip_writer}"> <input
									type="hidden" class="sessionUser"
									value="${sessionScope.user.seq}">
								</span>
							</form>

							<!--Text-->
							<p class="card-text">${upvotingArticles.category}</p>

							<!-- 							button -->
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
	</c:if>


	<!-- recent tip list -->
	<div class="mt-4 container">
		<table class="">
			<tr>
				<td><button class="btn dropdown-toggle" type="button"
						id="tipcategory" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">카테고리</button>

					<div class="dropdown-menu" aria-labelledby="tipcategory">
						<a class="dropdown-item" href="tipBoardMainPage.tip">전체보기</a> <a
							class="dropdown-item" href="tipBoardMainPage.tip?category=뷰티">뷰티</a>
						<a class="dropdown-item" href="tipBoardMainPage.tip?category=다이어트">다이어트</a>
						<a class="dropdown-item" href="tipBoardMainPage.tip?category=패션">패션</a>
						<a class="dropdown-item" href="tipBoardMainPage.tip?category=기타">기타</a>
					</div>
			</tr>
			<c:forEach items="${tipBoardList}" var="list">
				<tr class="text-center">
					<td class="list-category">${list.category}</td>
					<td class="tip-title"><a
						href="getSpecificTipView.tip?seq=${list.tip_seq}">${list.tip_title}</a></td>
					<td><a href="userpage.go?seq=${list.tip_writer}">${list.name}</a></td>
					<td>　　</td>
					<td class="text-left"><fmt:formatDate type="both"
							value="${list.tip_date}"></fmt:formatDate></td>
					<td>　　</td>
					<td class="text-left"><i class=" fa fa-heart mr-1 red-text" aria-hidden="true">
							${list.tip_like_count}</i>
					<td class="text-left"><i class="fa fa-comment mr-1 amber-text"
						aria-hidden="true"> ${list.tip_comment_count}</i>
					<td class="text-left"><i class="fa fa-eye mr-1" aria-hidden="true">
							${list.tip_viewcount}</i></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!--Pagination-->
	<div aria-label="pagination example" class="mt-3">
		<ul class="pagination pg-blue justify-content-center">
			<c:if test="${page > 1}">
				<li class="page-item"><a
					style="background-color: #1B0946; color: white;" class="page-link"
					href="tipBoardMainPage.tip?page=${page-1}&category=${category}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
				</a></li>
			</c:if>

			<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
				<c:choose>
					<c:when test="${pageNum eq page}">
						<li class="page-item active"><a class="page-link"
							style="background-color: #1B0946; color: white;"
							href="tipBoardMainPage.tip?page=${pageNum}&category=${category}">${pageNum}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							style="background-color: #1B0946; color: white;"
							href="tipBoardMainPage.tip?page=${pageNum}&category=${category}">${pageNum}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${page < totalPage }">
				<li class="page-item"><a class="page-link btn-itso"
					style="background-color: #1B0946; color: white;"
					href="tipBoardMainPage.tip?page=${page+1}&category=${category}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</c:if>
		</ul>
	</div>
	<div class=container>
		<button class="btn btn-itso"
			onclick="location.href='tipInsertPage.go'">팁 쓰기</button>
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
			<div class=container>
				<button class="btn btn-itso"
					onclick="location.href='tipInsertPage.go'">팁 쓰기</button>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
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