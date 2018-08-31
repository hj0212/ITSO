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

/* Carousel */
.carousel-cell {
	width: 100%;
	height: 500px;
	margin-right: 10px;
}

@media screen and ( min-width: 768px ) {
	/* half-width cells for larger devices */
	.carousel-cell {
		width: 30%;
	}
}

.carousel-cell.is-selected {
	background: #ED2;
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

table tr {
	text-align: left;
}

.tip-title {
	text-align: center;
}
</style>



</head>

<body>
	<!-- navi -->
	<%@include file="navi.jsp"%>
	<div id="wrapper" class="container-fluid col-md-8">
		<!-- tip board main page -->
		<div id="bestTipList" class="mt-4">
			<div class="container-fluid">
				<h1 class="mb-3">
					<i class="fa fa-thumbs-o-up align-top"></i> 베스트 팁
				</h1>
			</div>
			<!-- Card deck -->
			<div class="container-fluid main-carousel" data-flickity='{ "cellAlign": "left", "contain": true }'>
				<!-- Card1 -->
				<c:forEach items="${upvotingArticles}" var="upvotingArticles">
					<div class="mb-4 carousel-cell">
						<!--Card image-->
						<div class="view overlay">
							<img class="card-img-top"
								src="https://mdbootstrap.com/img/Photos/Others/images/16.jpg"
								alt="Card image cap"> <a href="#!"> </a>
						</div>

						<!--Card content-->
						<div class="card-body">

							<!--Title-->
							<h4 class="card-title">${upvotingArticles.tip_title}</h4>
							<div>
								<a><i class=" fa fa-heart red-text" aria-hidden="true"></i>
									${upvotingArticles.tip_like_count} </a> 
<!-- 									<a><i class="fa fa-share-alt green-text" aria-hidden="true"></i>82</a>  -->
									<a><i class="fa fa-comment amber-text" aria-hidden="true"></i>${upvotingArticles.tip_comment_count}</a>
								<a><i class="fa  fa-eye" aria-hidden="true"></i>${upvotingArticles.tip_viewcount}</a>
							</div>
				
				
							<span>by ${upvotingArticles.name}</span>

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
			
			<div class="col-md-12 mt-5 text-center">
				<div class="text-left">
					정렬이용
				</div>
				<table style="width : 100%;" class="mt-2">
					<c:forEach items="${tipBoardList}" var="list">
						<tr>
							<td>[${list.category}]</td>
							<td>${list.name}</td>
							<td class="tip-title">${list.tip_title}</td>
							<td>
								<i class=" fa fa-heart red-text" aria-hidden="true">${list.tip_like_count}</i>
								<i class="fa fa-comment amber-text" aria-hidden="true">${list.tip_comment_count}</i>
								<i class="fa  fa-eye" aria-hidden="true">${list.tip_viewcount}</i>
							</td>
							<td>${list.tip_date}</td>
						</tr>
					</c:forEach>
				</table>
			</div>			
		</div>
		<div class=container>
			<button class="btn btn-itso" onclick="location.href='tipInsertPage.go'">팁 쓰기</button>
		</div>
	</div>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
</body>
</html>