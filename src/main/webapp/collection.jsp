<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
@charset "UTF-8";

/* 기본 색상 */
:root { -
	-gray-color: #ddd; -
	-main-color: #1B0946; -
	-large-width: 980px; -
	-text-bright-color: #fff;
}

/* 폰트 크기 */
@media ( max-width : 799px) {
	:root {
		font-size: 13px;
	}
}

@media ( min-width : 800px) {
	:root {
		font-size: 15px;
	}
}

.container {
	max-width: var(- -large-width);
	max-width: 980px;
	margin-left: auto;
	margin-right: auto;
}

/* 기본 설정 : 페이지 전체 */
body {
	margin: 0;
	font: 'Montserrat';
}

.wrapper .collection-meta {
	color: var(- -gray-color);
}

.collection-meta a {
	color: var(- -gray-color);
	text-decoration: none;
}

.collection-meta a:hover {
	color: var(- -main-color);
}

.follow button {
	padding: 5px 10px;
	border: none;
	color: var(- -text-bright-color);
	color: #fff;
	background-color: var(- -main-color);
	background-color: #1B0946;
}

/* collection-top flex 설정 */
@media ( min-width : 768px) {
	.collection-top {
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
}

.collection-top {
	border-bottom: solid 1px var(- -gray-color);
	border-bottom: solid 1px #ddd;
	margin-bottom: 50px;
}

.collection-description {
	margin-top: 0;
	text-align: center;
}

.collection-description a {
	display: inline-block;
	color: var(- -main-color);
	color: #1B0946;
	font-size: 6.75vw;
}

.collection-description p {
	margin-top: 0;
	margin-bottom: 30px;
}

/* .collection-name 폰트 크기 설정 */
@media ( min-width : 768px) {
	.collection-description a {
		font-size: 40px;
	}
	.collection-description p {
		font-size: 18px;
	}
}

.mask {
	color: #fff;
	color: var(- -text-bright-color);
}

.mask h2 {
	padding: 20px;
	font-size: 18px;
	margin-bottom: 10px;
}

.mask p {
	margin-left: 20px;
	line-height: 0.2em;
	margin-top: 10px;
	font-size: 10px;
}

.avatar .card-image {
	width: 33px;
	height: 33px;
}

.user-activity .avatar, .user-activity .user-action {
	float: left;
	font-size: 13px;
	margin-left: 5px;
}

.user-action .user-name {
	display: block !important;
	max-width: 180px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

section .card-body .btn-elegant {
	padding: 5px 10px;
	border: none;
	color: var(- -text-bright-color);
	color: #fff;
	background-color: var(- -main-color);
	background-color: #1B0946;
	margin-left: 5px;
}

section .card-body .good-count {
	padding: 8.5px 10px;
	border: none;
	color: var(- -text-bright-color);
	color: #fff;
	background-color: var(- -main-color);
	background-color: #1B0946;
}

section .follow-action .follow-button {
	float: right;
	color: #fff;
	color: var(- -text-bright-color);
}

/* 사용자 이름 표시 길이 */
@media ( max-width : 1200px) {
	.user-action .user-name {
		max-width: 100px;
	}
}

/* +Follow 버튼 크기 조정 */
@media ( min-width : 576px) and (max-width : 991px) {
	section .follow-action .follow-button {
		width: 100%;
	}
}

@media ( max-width : 300px) {
	section .follow-action .follow-button {
		width: 100%;
	}
}

/* 각 card별 follow 버튼 */
.follow-action .follow-button {
	padding: 5px 10px;
	border: none;
	color: var(- -text-bright-color);
	color: #fff;
	background-color: var(- -main-color);
	background-color: #1B0946;
}

@media ( min-width : 768px) {
	#colnav {
		max-width: var(- -large-width);
		max-width: 980px;
		margin-left: auto;
		margin-right: auto;
	}
}

.overlay img {
	height: 350px;
	object-fit: cover;
}

#colnav {
	background-color: #fff;
}
</style>
</head>
<body>
	<%@include file="navi.jsp"%>

	<div class="wrapper">

		<div class="container">
			<div class="collection-top">
				<div class="collection-meta py-2">
					by <a href="userpage.go?${content.collection_writer}">${content.writerName }</a><span
						class="sep"> •</span> ${content.count} looks
				</div>
			</div>
			<div class="collection-description">
				<h2>${content.collection_title }</h2>
				<h4 class="mb-5">${content.collection_contents }</h4>
			</div>
		</div>
	</div>

	<section>
		<div class="container">
			<div class="row">
				<c:choose>
					<c:when test="${empty socialList }">
                  		컬렉션에 추가된 글이 없습니다.
                </c:when>
					<c:otherwise>
						<c:forEach var="slist" items="${socialList }">
							<div class="col-sm-4 mb-3">
								<div class="card">
									<div class="view overlay">
										<img src="/upload/social/${slist.photo }" alt="Card image cap">
										<a href="readSocial.go?seq=${slist.social_seq}">
											<div class="mask rgba-stylish-light text-left card-text">
												<h2>${slist.social_title }</h2>
												<p>${slist.social_contents }</p>
												<p>${slist.social_date }</p>
											</div>
										</a>
									</div>

									<div class="card-body">
										<div class="user-activity">
											<div class="avatar ml-0 mr-2">
												<img src="/upload/profile/${slist.photo }" alt=""
													class="card-image rounded-circle">
											</div>
											<div class="user-action">
												<div class="user-name">
													<a href="userpage.go?seq=${slist.social_writer }">${slist.writerName }
													</a>
												</div>
												<div>${slist.userState }</div>
											</div>
											<div class="goodarea" style="float: right; margin-top: 5px;">
											<input type="hidden" class="writerseq" value="${slist.social_writer }" />
											<c:choose>
												<c:when test="${empty goodList }">
													<i class="fa fa-heart-o red-text heart " aria-hidden="true"
														style="float: right; font-size: 25px;"
														value="${slist.social_seq}"> <font color="black">
															0 </font></i>
												</c:when>
												<c:otherwise>
													<c:set var="loop_flag" value="false" />
													<c:forEach items="${goodList }" var="good" varStatus="gstatus">
														<c:if test="${loop_flag == false }">
															<c:choose>
																<c:when test="${good.social_seq == slist.social_seq }">
																	<i class="fa fa-heart red-text heart"
																		aria-hidden="true"
																		style="float: left; font-size: 25px;"
																		value="${slist.social_seq}"> <font color="black">
																			${good.good_count } </font></i>
																	<c:set var="loop_flag" value="true" />
																</c:when>
																<c:otherwise>
																	<c:if test="${gstatus.last }">
																		<i class="fa fa-heart-o red-text heart"
																			aria-hidden="true"
																			style="float: left; font-size: 25px;"
																			value="${slist.social_seq}"> <font color="black">
																				${good.good_count } </font></i>
																	</c:if>
																</c:otherwise>
															</c:choose>
														</c:if>

													</c:forEach>
												</c:otherwise>

											</c:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>



			</div>
		</div>
	</section>

	<!-- 페이지네이션
	 <nav class="pagination justify-content-center" id="colnav"
		aria-label="pagination example">
	<ul class="pagination pagination-lg">
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
				class="sr-only">Previous</span>
		</a></li>

		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>

		Arrow right
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
				class="sr-only">Next</span>
		</a></li>
	</ul>
	</nav> -->
	<script>
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
			var writer = $(".writerseq").val();
			var font = $(this).children('font');
			console.log("숫자: " + $(this).children('font').html());
			console.log(seq);
			$.ajax({
				url : "mainHeart.ajax",
				type : "post",
				data : {
					social_seq : seq,
					social_writer : writer
				},
				success : function(data) {
					console.log("들어옴" + data), font.html(data)
				}
			});
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
</html>