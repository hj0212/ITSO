<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Style-Share | ITSO</title>

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
#wrapper {
	min-height: 100%;
	width: 980px;
	margin: 0 auto;
}

.vertical-align-none {
	vertical-align: -50%;
}

#snsLists {
	display: inline;
}

.chevrons {
	display: inline;
}

.inline-block {
	display: inline-block;
}

.block {
	display: block;
}

.list-style-none {
	list-style-type: none;
}

.info {
	list-style-type: none;
	display: inline-block;
	padding: 10px;
}

.avatar {
	width: 64px;
	height: 64px;
	display: inline;
}

#lookAction {
	border-bottom: 1px #9AA9B2 solid;
}

.comment-child-border {
	border-left: 1px #e6e6e6 solid;
}

.border-bottom-line {
	border-bottom: 1px #9AA9B2 solid;
}

.comment-child {
	margin-top: 15px;
	margin-left: 32px;
}

.brand-icon {
	width: 64px;
}

#wrapper a, a:hover {
	color: black;
}

#right-side {
	width: 30%;
	display: inline-block;
}

#left-side {
	width: 70%;
	display: inline-block;
}

/* #comment {
                border: 1px solid #e6e6e6;
            } */
</style>
</head>

<body>


	<c:choose>
		<c:when test="${fn:length(result) >0 }">
			<c:forEach items="${result}" var="list">


				<div id="wrapper" class="row">

					<div id="left-side" class="col">
						<div>
							<div>
								<header>
									<div id="lookAction" class=container>
										<button type=button class="btn btn-elegant">HYPE</button>
										853
										<button type=button class="btn btn-grey-ligten-5 btn-sm">SAVE</button>
										<!-- social button list -->
										<div id="snsLists" class="btn-toolbar" role="toolbar"
											aria-label="Toolbar with button groups">
											<div class="btn-group mr-2" role="group"
												aria-label="First group">
												<button type="button" class="btn btn-grey-ligten-5 btn-sm">
													<i class="fa fa-facebook"></i>
												</button>
												<button type="button" class="btn btn-grey-ligten-5 btn-sm">
													<i class="fa fa-twitter" aria-hidden="true"></i>
												</button>
												<button type="button" class="btn btn-grey-ligten-5 btn-sm">
													<i class="fa fa-instagram"></i>
												</button>
											</div>
										</div>
										<div class="chevrons">
											<span class="instafilta-target"> <a href=#> <i
													class="fa fa-chevron-left"></i>
											</a>
											</span> <span class="instafilta-target"> <a href="#"> <i
													class="fa fa-chevron-right"></i>
											</a>
											</span>
										</div>
									</div>
								</header>
								<div class=container>
									<br>
									<!-- header -->
									<header class="container">
										<h3>${list.styling_title}</h3>
										<time>${list.styling_date }</time>
										<div class="instafilta-target mt-1">
											2 <i class="fa fa-comment-o"></i>
										</div>
									</header>

									<div>
										<!-- image -->
										<br>
										<figure>
											<img
												src="https://78.media.tumblr.com/851d55a1f3d275a127b63961500b3e91/tumblr_mgztb7LSrv1rlmfrlo1_500.jpg">
										</figure>
										</figure>


										<!-- user-context -->

										<div class=container>

											<a href="">#bike</a> <a href="">#black</a> <a href="">#short</a>
											<a href="">#brown-hair</a> <a href="">#white-shirt</a>


											${list.styling_contents }
										</div>



									</div>

									<div class="container mt-4">
										<table id="comment">
											<tbody>
												<tr>
													<td><img
														class="avatar rounded-circle z-depth-1-half mr-3"
														src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg">
													</td>
													<td>
														<div>
															<a href="#">Risovic N.</a> <a href="#">@risovic</a>
														</div>
														<div>Nice dress, color, and the vibe</div>
														<div id=comment>
															0 <a href="#">▲</a>· reply · flag · 6 months ago
														</div>

													</td>
												</tr>


												<tr>
													<table>
														<tr>
															<td>
																<div class="comment-child">
																	<img
																		class="ml-4 avatar rounded-circle z-depth-1-half mr-3"
																		src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg">
																</div>
															</td>
															<td></td>
															<td>
																<div>
																	<a href="#">Alex X.</a> <a href="">@Alex</a>
																</div>
																<div>How sweet of her.</div>

																<div id=comment>
																	2 <a href="#">▲</a· reply>· flag · 6 months ago 
																</div>
															</td>
														</tr>

														<tr>
															<td>
																<div class="comment-child">
																	<img
																		class="ml-4 avatar rounded-circle z-depth-1-half mr-3"
																		src="https://mdbootstrap.com/img/Photos/Avatars/avatar-10.jpg">
																</div>
															</td>
															<td></td>
															<td>
																<div>
																	<a href="#">Lauren A.</a> <a href="">@Lauren</a>
																</div>
																<div>I envy her body ratio</div>

																<div id=comment>
																	5 <a href="#">▲</a>· reply· flag · 6 months ago
																</div>
															</td>
														</tr>
													</table>

												</tr>

											</tbody>


										</table>
									</div>


								</div>
							</div>

							<!-- reply -->
							<form action="" method="post">
								<div class="container mt-4">
									<div class="form-group">
										<textarea class="form-control rounded-0"
											id="exampleFormControlTextarea2" rows="3" placeholder="댓글 달기"></textarea>

										<!-- Default inline 1-->

										<div
											class="custom-control custom-checkbox custom-control-inline">

											<input type="checkbox" class="custom-control-input"
												id="defaultInline1"> <label
												class="custom-control-label" for="defaultInline1">페이스북</label>
										</div>

										<!-- Default inline 2-->
										<div
											class="custom-control custom-checkbox custom-control-inline">
											<input type="checkbox" class="custom-control-input"
												id="defaultInline2"> <label
												class="custom-control-label" for="defaultInline2">카카오톡</label>
										</div>

										<!-- Default inline 3-->
										<div
											class="custom-control custom-checkbox custom-control-inline">
											<input type="checkbox" class="custom-control-input"
												id="defaultInline3"> <label
												class="custom-control-label" for="defaultInline3">인스타그램</label>
										</div>

										<!-- Default inline 3-->
										<div
											class="ml-4 custom-control custom-checkbox custom-control-inline">
											<input type="checkbox" class="custom-control-input"
												id="defaultInline3">
										</div>

										<button class="btn btn-grey btn-sm">쓰기</button>
									</div>
								</div>
							</form>



						</div>

					</div>

					<!-- user info -->


					<div id="right-side" class="col">
						<aside id="aside">
							<section class="container border-bottom-line mt-4">
								<img style="vertical-align: super;"
									src="https://images.pexels.com/photos/607894/pexels-photo-607894.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
									class="vertical-align-none avatar rounded-circle z-depth-1-half">
								<ul class="info">
									<li>${list.styling_writer}</li>
									<li>24 디자인학과</li>
									<li><i class="fa fa-map-marker"></i> 연남동, 서울</li>
									<li>
										<button class="btn btn-elegant btn-sm">+ Fan</button>
									</li>
								</ul>
							</section>

							<section class=border-bottom-line>

								<div class="mt-4 mb-3 ">
									<strong>사진 속 의류 정보</strong>
								</div>
								<ol>
									<li class="mb-2">
										<div>Black Shirt</div>
										<div>
											<a href="http://www.zara.com/">Primark</a> in <a href="">Primark
												Fedoras</a>
										</div>
									</li>
									<li class="mb-2">
										<div>Dark Grey Short</div>
										<div>
											<a href="#">Zaful</a> in <a href="#">Zaful Short</a>
										</div>
									</li>
									<li class="mb-2">
										<div>White Snickers</div>
										<div>
											<a href="#">OASAP</a> in <a href="#">OASAP Snickers</a>
										</div>
									</li>
								</ol>

							</section>



							<!-- brand info -->
							<section class=border-bottom-line>
								<div class="mt-4 mb-3">
									<strong>사진 속 브랜드 정보</strong>
								</div>


								<ul class="mt-3 list-style-none">
									<li class="mt-3"><img
										class=" z-depth-1-half rounded-circle" alt="Primark"
										height="75"
										src="data:image/png;base64,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"
										width="75">


										<ol class="info">
											<li class="ml-2"><a href=#>Primark</a></li>
											<li>
												<button class="btn btn-elegant btn-sm">+ Fan</button>
											</li>
										</ol></li>
									<li class="mt-3"><img
										class=" z-depth-1-half rounded-circle" alt="Zaful" height="75"
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAclBMVEX///8AAAD8/PzV1dXm5uZ/f39lZWWWlpZFRUXs7Oy+vr4jIyPZ2dnQ0NCZmZnT09OOjo54eHj19fVycnKEhIRZWVksLCyRkZGgoKDj4+Onp6c7OzsaGhrIyMjExMSurq5MTEwwMDBfX1+3t7cLCwtAQEB1dFB4AAADRklEQVR4nO3Y63aiMBSG4SR4QgkIYsVjj97/Lc7eCQgzbZczP8bqWu8za2wIsc1nAiEaAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgDvm0iSTf0lR+CTLsq1xbb0pNq4tm5FP9GQiCi2kZuuLTGuKzDmXykHifZW2zXzhvv17P+DdWjtb5tNps5fSuk+4sqOuo37aPMnJZZ7nyxcpTM182nxIIc930jLbNC+TfJP6TXOOzX4szVee7X4UCql0ziaXhJW1u66N1E3kZBoOqpkkFDNrF3oujHQ+jy3r2OyuxnBnK+ml9GltP+y4r5ex3Q+a9QlNZZf6o00YTduEY2k2+t9d/kfLUtJJxLn07VD19Ws5zvrDQUJT1/r6MAnfvE4053SOzvvq9Olg41hFw4SnUl8fJmHgpGsf9u1yETqze9dM/RUVEkr9WD6QdHgdRnef0CQ2jFGf8FzptPW/J5Sjc2HaReTBEupKkXd9lyCjF2Okqvwjocn0bhubPVBC6XCui+KgJvR4JZXVMOHJLwd3n4dKGJbCwY3TmSf5f5TK965KE27q84MmDN2vh8t0NtF6uZtOupp2lr4/ZEJzkm59uLDst9fY8hheBytEt1ociu5d1xK6+3mwqRayUpx0CGW+hn65hT6C5nohdk9uXcLSdx2/mrB6vlGAq2oJOAnLvtnuw1z1K91H+OK1f3LrEo4ujz3XEx5u0/8rZGcQlsI4Ms9vYY1ftVNxE/obTg2faSLZZCyq7pfUp9hseB0eX2/Q/78xC3MxTE6zLsOVuGivoW3YKQWfE5Z9jbxx+zlhOTN3YWd1KsZImTyJSuk4joGdkbvpq/tmDI/hmSdKu/k6SDiSzeY9CEvhNpazhW3CXjCuCFJqwpZxsD/s74+6RdYMOubVXu+9+lHUlw8iO9jVrcN8ST/0p0bvnLU+uT3Lhn1qm1znZrrJ9ew6b47dHr/p3yh5ZDV5madpkoeA4auAdo+fj7X95Os/eWPb8MVKEkixMqn3mS90+lU+fHWTFMmoaL+ASfo36ohVp2lZrjYnF8e2a9b9su0PZQIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMBf+QUYmR782IWZjQAAAABJRU5ErkJggg=="
										width="75">

										<ol class="info">
											<li class="ml-2"><a href=#>Zaful</a></li>
											<li>
												<button class="inline-block btn btn-elegant btn-sm">+
													Fan</button>
											</li>
										</ol></li>
									<li class="mt-3"><img
										class=" z-depth-1-half rounded-circle" alt="OASAP" height="75"
										src="data:image/jpeg;base64,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"
										width="75">
										<ol class="info">
											<li class="ml-2"><a href=#>OASAP</a></li>
											<li>
												<button class="inline-block btn btn-elegant btn-sm">+
													Fan</button>
											</li>
										</ol></li>
								</ul>


							</section>


							<div>


								<!-- you may like these users -->
								<div class="mt-4 mb-3">
									<strong> 당신이 좋아할만한 유저 </strong>
								</div>

								<ol class="list-style-none">



									<li class="mt-3"><img
										class="vertical-align-none z-depth-1-half rounded-circle"
										alt="Primark" height="75"
										src="http://s3cdn-test-lookbooknu.netdna-ssl.com/files/users/small/6484472_image.jpg?1531857217">


										<ol class="info">
											<li class="ml-2"><a href=#>김연아</a></li>

											<li class="ml-2">18 항공승무원 부산</li>
											<li>
												<button class="btn btn-elegant btn-sm">+ Fan</button>
											</li>
										</ol></li>
									<li class="mt-3"><img
										class="vertical-align-none z-depth-1-half rounded-circle"
										alt="Zaful" height="75"
										src="http://s3cdn-test-lookbooknu.netdna-ssl.com/files/users/small/3348731_velvet_playsuit_seite_gesicht.jpg?1407499836"
										width="75">

										<ol class="info">
											<li class="ml-2"><a href=#>안졸리나</a></li>

											<li class="ml-2">23 수학과 서울</li>

											<li>
												<button class="inline-block btn btn-elegant btn-sm">+
													Fan</button>
											</li>
										</ol></li>

								</ol>
								</li>
								</ul>


								</ol>
								</section>

							</div>
					</div>

				</div>

			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="3">게시글이 없습니다,,,,</td>
			</tr>
		</c:otherwise>
	</c:choose>




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
	<script src="https://code.jquery.com/jquery-3.3.1.js"
		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		crossorigin="anonymous"></script>



</body>

</html>