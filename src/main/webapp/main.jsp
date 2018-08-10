<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>It So</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
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
	#sidefooter{
		display: none;
	}
}

.avatar {
	margin-bottom: 5px;
}

#rightfix {	
	width: 300px;
	top: 20%;
	right: 50px;
	position: fixed;
}
#sidefooter{
	width: 300px;
	bottom:0px;
	right: 50px;
	position: fixed;
	border-top: 2px solid black;
}
#sidefooter p{
	font-style: oblique;
}
#sidefooter p a{
	font-style: oblique;
	color: black;

}
.media-body {
	height: 70px;
	line-height: 70px;
	 margin-top: 10px;
}
.media-body button{
	color: white;
	cursor: pointer;

}




</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function() {
		var heartVal = 0;

		$(".heart").click(function() {
			if (heartVal == 0) {
				$(this).attr("class", "fa fa-heart red-text heart");

				heartVal = 1;
			} else {
				$(this).attr("class", "fa fa-heart-o red-text heart");
				heartVal = 0;
			}
		});

		alert("${email}");
	});
</script>
</head>

<body>
	<%@include file="navi.jsp"%>

	<!-- Grid row -->

	<div id="card-group">


		<div class="row gb" style="margin: 0xp auto;">
			<!-- Grid column -->
			<div class="col-lg-4 col-md-12">
				<!--Card-->
				<div class="card">
					<!--Card image-->
					<div class="view">
						<img src="https://mdbootstrap.com/img/Photos/Others/men.jpg"
							class="card-img-top" alt="photo"> <a href="#">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>

					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">
							<a>김형섭</a><i class="fa fa-heart-o red-text heart"
								aria-hidden="true" style="float: right;"><font color="black">0</font></i>
						</h4>
						<!--Text-->
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn  btn-indigo"
							style="background-color: black;"><i class="fa fa-plus">follow</i></a>
						<!--share-->
						<!--instagram-->
						<button type="button" class="btn-floating btn-sm btn-is share "
							style="float: right; background-color: #ea4c89; color: white; border: 0px; margin-left: 10px; border-radius: 10px;">
							<i class="fab fa-instagram"></i>
						</button>
						<!--twitter-->
						<button type="button" class="btn-floating btn-sm btn-tw share"
							style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 6px;">
							<i class="fab fa-twitter"></i>
						</button>
						<!--facebook-->
						<button type="button" class="btn-floating btn-sm btn-fb share"
							style="float: right; background-color: #4267b2; color: white; border: 0px; border-radius: 5px;">
							<i class="fab fa-facebook-f"></i>
						</button>
					</div>
				</div>
				<!--/.Card-->
			</div>
			<!-- Grid column -->
		</div>
		<div class="row gb" style="margin: 0xp auto;">
			<!-- Grid column -->
			<div class="col-lg-4 col-md-12">
				<!--Card-->
				<div class="card">
					<!--Card image-->
					<div class="view">
						<img src="https://mdbootstrap.com/img/Photos/Others/men.jpg"
							class="card-img-top" alt="photo"> <a href="#">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>

					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">
							<a>김형섭</a><i class="fa fa-heart-o red-text heart"
								aria-hidden="true" style="float: right;"><font color="black">0</font></i>
						</h4>
						<!--Text-->
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn  btn-indigo"
							style="background-color: black;"><i class="fa fa-plus">follow</i></a>
						<!--share-->
						<!--instagram-->
						<button type="button" class="btn-floating btn-sm btn-is share "
							style="float: right; background-color: #ea4c89; color: white; border: 0px; margin-left: 10px; border-radius: 10px;">
							<i class="fab fa-instagram"></i>
						</button>
						<!--twitter-->
						<button type="button" class="btn-floating btn-sm btn-tw share"
							style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 6px;">
							<i class="fab fa-twitter"></i>
						</button>
						<!--facebook-->
						<button type="button" class="btn-floating btn-sm btn-fb share"
							style="float: right; background-color: #4267b2; color: white; border: 0px; border-radius: 5px;">
							<i class="fab fa-facebook-f"></i>
						</button>
					</div>
				</div>
				<!--/.Card-->
			</div>
			<!-- Grid column -->
		</div>
		<div class="row gb" style="margin: 0xp auto;">
			<!-- Grid column -->
			<div class="col-lg-4 col-md-12">
				<!--Card-->
				<div class="card">
					<!--Card image-->
					<div class="view">
						<img src="https://mdbootstrap.com/img/Photos/Others/men.jpg"
							class="card-img-top" alt="photo"> <a href="#">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>

					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">
							<a>김형섭</a><i class="fa fa-heart-o red-text heart"
								aria-hidden="true" style="float: right;"><font color="black">0</font></i>
						</h4>
						<!--Text-->
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-indigo"
							style="background-color: black;"><i class="fa fa-plus">follow</i></a>
						<!--share-->
						<!--instagram-->
						<button type="button" class="btn-floating btn-sm btn-is share "
							style="float: right; background-color: #ea4c89; color: white; border: 0px; margin-left: 10px; border-radius: 10px;">
							<i class="fab fa-instagram"></i>
						</button>
						<!--twitter-->
						<button type="button" class="btn-floating btn-sm btn-tw share"
							style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 6px;">
							<i class="fab fa-twitter"></i>
						</button>
						<!--facebook-->
						<button type="button" class="btn-floating btn-sm btn-fb share"
							style="float: right; background-color: #4267b2; color: white; border: 0px; border-radius: 5px;">
							<i class="fab fa-facebook-f"></i>
						</button>
					</div>
				</div>
				<!--/.Card-->
			</div>
			<!-- Grid column -->
		</div>
		<div class="row gb" style="margin: 0xp auto;">
			<!-- Grid column -->
			<div class="col-lg-4 col-md-12">
				<!--Card-->
				<div class="card">
					<!--Card image-->
					<div class="view">
						<img src="https://mdbootstrap.com/img/Photos/Others/men.jpg"
							class="card-img-top" alt="photo"> <a href="#">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>

					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">
							<a>김형섭</a><i class="fa fa-heart-o red-text heart"
								aria-hidden="true" style="float: right;"><font color="black">0</font></i>
						</h4>
						<!--Text-->
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn  btn-indigo"
							style="background-color: black;"><i class="fa fa-plus">follow</i></a>
						<!--share-->
						<!--instagram-->
						<button type="button" class="btn-floating btn-sm btn-is share "
							style="float: right; background-color: #ea4c89; color: white; border: 0px; margin-left: 10px; border-radius: 10px;">
							<i class="fab fa-instagram"></i>
						</button>
						<!--twitter-->
						<button type="button" class="btn-floating btn-sm btn-tw share"
							style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 6px;">
							<i class="fab fa-twitter"></i>
						</button>
						<!--facebook-->
						<button type="button" class="btn-floating btn-sm btn-fb share"
							style="float: right; background-color: #4267b2; color: white; border: 0px; border-radius: 5px;">
							<i class="fab fa-facebook-f"></i>
						</button>
					</div>
				</div>
				<!--/.Card-->
			</div>
			<!-- Grid column -->
		</div>


		<!-- 오른쪽 추천 fallow  -->
		<div id="rightfix" class="right-fixed">
			<ul class="list-unstyled">
				<li class="media"><img class="d-flex mr-3 rounded-circle"
					src="https://mdbootstrap.com/img/Photos/Others/placeholder7.jpg"
					alt="Generic placeholder image">
					<div class="media-body">
						<h5 class="mt-0 mb-1 font-weight-bold">List-based media
							object</h5><button type="button" class="btn btn-indigo btn-sm"><i class="fa fa-plus">follow</i></button>

					</div></li>
				<li class="media my-4"><img class="d-flex mr-3 rounded-circle"
					src="https://mdbootstrap.com/img/Photos/Others/placeholder6.jpg"
					alt="An image">
					<div class="media-body">
						<h5 class="mt-0 mb-1 font-weight-bold">List-based media
							object</h5><button type="button" class="btn btn-indigo btn-sm"><i class="fa fa-plus">follow</i></button>

					</div></li>
				<li class="media"><img class="d-flex mr-3 rounded-circle"
					src="https://mdbootstrap.com/img/Photos/Others/placeholder5.jpg"
					alt="Generic placeholder image">
					<div class="media-body">
						<h5 class="mt-0 mb-1 font-weight-bold">List-based</h5><button type="button" class="btn btn-indigo btn-sm"><i class="fa fa-plus">follow</i></button>
						
					</div></li>
			</ul>
		</div>
		<!--side footer -->
		<div id="sidefooter">
			<p>©2018 ItSo. All rights reserved.</p>
			<p>
			<a href="#">language</a>·
			<a href="#">help</a>·
			<a href="#">widgets</a>·
			<a href="#">advertise</a>·
			<a href="#">legal</a>	
			</p>		
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