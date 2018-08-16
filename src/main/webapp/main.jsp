<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>It So</title>
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

.dropdown-menu :hover {
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

.dropdown-toggle {
	border: 1px solid #e9e9e9;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function() {
		

		$(".heart").click(function() {
			var heartVal = $(this).attr("class");
				
			if (heartVal =="fa fa-heart red-text heart") {
				$(this).attr("class", "fa fa-heart-o red-text heart");		
			} else {
				$(this).attr("class", "fa fa-heart red-text heart");
				
			}
		});

		$(".heart").on('click',function(){
			var seq = $(this).attr("value");
			var font =$(this).children('font');
			console.log("숫자: " + $(this).children('font').html());
			console.log(seq);
			
			$.ajax({
				url:"mainHeart.ajax",
				type:"post",
				data:{
					social_seq:seq
				},
				success:function(data){
					console.log("들어옴"+data),
					font.html(data)
					
					
				}
				
				
			});
			
			
		});
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
						href="main.go?gender=g&age=${pAge }&main=${main}">무관 </a> <a
						class="dropdown-item flex-center droptxt2"
						href="main.go?gender=m&age=${pAge }&main=${main}">남성</a> <a
						class="dropdown-item flex-center droptxt2"
						href="main.go?gender=f&age=${pAge }&main=${main}">여성</a>
				</div>
				<div class="btn-group">
					<button class="btn btn-sm dropdown-toggle droptxt1" type="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						id="age">${age}</button>
					<div class="dropdown-menu">
						<a class="dropdown-item flex-center droptxt2"
							href="main.go?age=0&gender=${pGender }&main=${main}">모든연령 </a> <a
							class="dropdown-item flex-center droptxt2"
							href="main.go?age=10&gender=${pGender }&main=${main}">10대</a> <a
							class="dropdown-item flex-center droptxt2"
							href="main.go?age=20&gender=${pGender } &main=${main}">20대</a> <a
							class="dropdown-item flex-center droptxt2"
							href="main.go?age=30&gender=${pGender }&main=${main}">30대</a> <a
							class="dropdown-item flex-center droptxt2"
							href="main.go?age=40&gender=${pGender }&main=${main}">40대</a>
					</div>
					<div class="btn-group">
						<button class="btn btn-sm dropdown-toggle droptxt1" type="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Full
							view</button>
						<div class="dropdown-menu">
							<a class="dropdown-item flex-center droptxt2"
								href="main.go?main=full">Full view</a> <a
								class="dropdown-item flex-center droptxt2"
								href="main.go?main=tumbnail">Tumbnail view</a>
						</div>
					</div>
				</div>
		</section>


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
									<h4 class="card-title">
										<a>${list.social_writer}</a>
										<script type="text/javascript">
											console.log("${goodCount[status.count]}");
										</script>
										
										<c:set var="loop_flag" value="false"/>
										<c:forEach items="${goodList }" var="good" varStatus="gstatus">
										<c:if test="${loop_flag == false }">
											<c:choose>
												<c:when test="${good.social_seq == list.social_seq }">
													<i	class="fa fa-heart red-text heart" aria-hidden="true"
											style="float: right;" value="${list.social_seq}"><font color="black">${heart[status.index].toString()}</font></i>
												<c:set var="loop_flag" value="true"/>
												</c:when>
												<c:otherwise>
													<c:if test="${gstatus.last }">
														<i	class="fa fa-heart-o red-text heart" aria-hidden="true"
											style="float: right;" value="${list.social_seq}"><font color="black">${heart[status.index].toString()}</font></i>
													</c:if>
												</c:otherwise>
											</c:choose>
										</c:if>
										</c:forEach>
										
									</h4>
									<!--Text-->
									<p class="card-text">${list.social_title}</p>
									<a href="#" class="btn  btn-indigo"
										style="background-color: black;"><i class="fa fa-plus">follow</i></a>
									<!--share-->
									<!--instagram-->
									<button type="button" class="btn-floating btn-sm btn-is share "
										style="float: right; background-color: #ea4c89; color: white; border: 0px; margin-left: 10px; border-radius: 10px;">
										<i class="fa fa-instagram"></i>
									</button>
									<!--twitter-->
									<button type="button" class="btn-floating btn-sm btn-tw share"
										style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 6px;">
										<i class="fa fa-twitter"></i>
									</button>
									<!--facebook-->
									<button type="button" class="btn-floating btn-sm btn-fb share"
										style="float: right; background-color: #4267b2; color: white; border: 0px; border-radius: 5px;">
										<i class="fa fa-facebook-f"></i>
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


		<!-- 오른쪽 추천 fallow  -->
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
</body>
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

</html>