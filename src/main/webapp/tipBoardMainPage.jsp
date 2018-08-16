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


<style>
ul {
	list-style-type: none;
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
</style>



</head>

<body>
	<!-- navi -->
	<%@include file="navi.jsp"%>



	<!-- tip board main page -->
	<div id=wrapper class=container-fluid>



		<div id="bestTipList" class="mt-4">

			<div class="container-fluid">
				<h1 class="text-center mb-3">
					<i class="fa fa-thumbs-o-up align-top"></i> 베스트 팁
				</h1>
			</div>
			<!-- Card deck -->
			<div class="card-deck">

				<div class="row carousel slide carousel-fade " data-ride="carousel"
					id="carousel-example">
					<!-- Card1 -->
					<c:forEach items="${upvotingArticles}" var="upvotingArticles">
						<div class="card mb-4 ca carousel-item active">

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
								<span>by ${upvotingArticles.name}</span>

								<!--Text-->
								<p class="card-text">${upvotingArticles.category}</p>
								<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->

								<div>
									<button id=best-tip-read-btn type="button"
										onclick="javascript:location.href='getSpecificTipView.tip?seq=${upvotingArticles.tip_seq}'"
										class=" btn btn-itso btn-md">읽기</button>
									<a><i class=" fa mr-2 fa-heart red-text" aria-hidden="true"></i>${upvotingArticles.tip_like_count}</a>
									<a><i class="fa mr-2 fa-share-alt green-text"
										aria-hidden="true"></i>82</a> <a><i
										class="fa mr-2 fa-comment amber-text" aria-hidden="true"></i>82</a>
									<a><i class="fa mr-2 fa-eye" aria-hidden="true"></i>${upvotingArticles.tip_viewcount}</a>
								</div>
							</div>

						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>

	<!-- isUpvoting list -->
	<div id="isUpvotingList" class="container">
		<h2>주목받고 있는 팁</h2>
		<div class="row mb-4">

			<div class="card col"></div>

		</div>
	</div>


	<!-- recent tip list -->
	<div id="unVotedListWrapper ">
		<h2>최근 팁</h2>
		<!-- unvotedListWrapper  -->
		<div class=" row  mb-4">

			<div class="card col mr-4">
				<div class="" id="beautyTipList">
					<h2>뷰티</h2>
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
										<td class="float-right"><i
											class="fa fa-comment amber-text" aria-hidden="true"></i>15</td>
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


				<div class="" id="dietTipList">
					<h2>다이어트</h2>
					<ul>
						<li>
							<table>
								<!-- for each jstl 적용될 부분 -->

								<c:forEach items="${dietTipData}" var="dietTipData">
									<tr class="clearfix">
										<td class="float-left"><a class="mr-2"
											href="getSpecificTipView.tip?seq=${dietTipData.tip_seq}">${dietTipData.tip_title}</a>by
											${dietTipData.name}</td>

										<td class="float-right"><i
											class="fa fa-comment amber-text" aria-hidden="true"></i>15</td>
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

			</div>


			<div class="col card ml-4">
				<div class=" " id="fashionTipList">
					<h2>패션</h2>
					<ul>
						<li>
							<table>
								<!-- for each jstl 적용될 부분 -->
								<c:forEach items="${fashionTipData}" var="fashionTipData">
									<tr class="clearfix">

										<td class="float-left"><a class="mr-2"
											href="getSpecificTipView.tip?seq=${fashionTipData.tip_seq}">${fashionTipData.tip_title}</a>by
											${fashionTipData.name}</td>


										<td class="float-right"><i
											class="fa fa-comment amber-text" aria-hidden="true"></i>15</td>
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


				<div class="" id="businessTipList">
					<h2>직장생활</h2>
					<ul>
						<li>
							<table>
								<!-- for each jstl 적용될 부분 -->
								<c:forEach items="${businessTipData}" var="businessTipData">
									<tr class="clearfix">
										<td class="float-left"><a class="mr-2"
											href="getSpecificTipView.tip?seq=${businessTipData.tip_seq}">${businessTipData.tip_title}</a>by
											${businessTipData.name}</td>


										<td class="float-right"><i
											class="fa fa-comment amber-text" aria-hidden="true"></i>15</td>
										<td class="float-right"><i class="fa fa-heart red-text"
											aria-hidden="true"></i>${businessTipData.tip_like_count}</td>
										<td class="float-right"><i class="fa fa-eye"
											aria-hidden="true"></i>${businessTipData.tip_viewcount}</td>

									</tr>
								</c:forEach>
								<!-- 적용 끝 -->
							</table>

						</li>
					</ul>
				</div>
			</div>
		</div>


		<div class=container>

			<button class="btn btn-itso"
				onclick="location.href='tipInsertPage.go'">팁 쓰기</button>
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