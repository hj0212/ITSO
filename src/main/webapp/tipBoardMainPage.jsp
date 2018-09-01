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

table th {
	text-align : center;
}

.tip-title {
	text-align: center;
}

.tip-date {
	text-align : right;
}

#tipcategory {
	background-color: #1B0946;
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
				<table style="width : 100%;" class="mt-2">
					<th colspan="1">
						<div class="dropdown">
					        <button class="btn btn-sm dropdown-toggle" type="button" id="tipcategory" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					            	카테고리별 분류
					        </button>
					        <div class="dropdown-menu" aria-labelledby="tipcategory">
					            <a class="dropdown-item" href="tipBoardMainPage.tip">전체보기</a>
					            <a class="dropdown-item" href="tipBoardMainPage.tip?category=뷰티">뷰티</a>
					            <a class="dropdown-item" href="tipBoardMainPage.tip?category=다이어트">다이어트</a>
					            <a class="dropdown-item" href="tipBoardMainPage.tip?category=패션">패션</a>
					            <a class="dropdown-item" href="tipBoardMainPage.tip?category=기타">기타</a>
					        </div>
					    </div>
					</th>
					<c:forEach items="${tipBoardList}" var="list">
						<tr>
							<td>[${list.category}]</td>
							<td><a href="userpage.go?seq=${list.tip_writer}">${list.name}</a></td>
							<td class="tip-title"><a href="getSpecificTipView.tip?seq=${list.tip_seq}">${list.tip_title}</a></td>
							<td>
								<i class=" fa fa-heart red-text" aria-hidden="true">${list.tip_like_count}</i>
								<i class="fa fa-comment amber-text" aria-hidden="true">${list.tip_comment_count}</i>
								<i class="fa  fa-eye" aria-hidden="true">${list.tip_viewcount}</i>
							</td>
							<td class=tip-date>${list.tip_date}</td>
						</tr>
					</c:forEach>
				</table>
				<!--Pagination-->
				<div aria-label="pagination example" class="mt-3">
				    <ul class="pagination pg-blue justify-content-center">
						<c:if test="${page > 1}">
					        <li class="page-item">
					            <a class="page-link" href="tipBoardMainPage.tip?page=${page-1}&category=${category}" aria-label="Previous">
					                <span aria-hidden="true">&laquo;</span>
					                <span class="sr-only">Previous</span>
					            </a>
					        </li>
						</c:if>
						
						<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
							<c:choose>
								<c:when test="${pageNum eq page}">
									<li class="page-item active"><a class="page-link" href="tipBoardMainPage.tip?page=${pageNum}&category=${category}">${pageNum}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="tipBoardMainPage.tip?page=${pageNum}&category=${category}">${pageNum}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>				
						
						<c:if test="${page < totalPage }">
							<li class="page-item">
								<a class="page-link" href="tipBoardMainPage.tip?page=${page+1}&category=${category}" aria-label="Next">
									<span aria-hidden="true">&raquo;</span> 
									<span class="sr-only">Next</span>
								</a>
							</li>
						</c:if>
				    </ul>
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