<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<%@ page isELIgnored="false"%>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>관리자 페이지 | ITSO</title>

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

<!-- JQuery 원래 밑에 있었음-->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
.ta-center {
	text-align: center;
}

/* toggle button */

/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}
</style>

</head>


<!-- dataSets -->

<!-- gender rate -->
<input value="${femaleUsers}" type="hidden" id="femaleUserCounts">
<input value="${maleUsers}" type="hidden" id="maleUserCounts">

<!-- Age rates -->
<input value="${teenagers}" type="hidden" id="10s">
<input value="${twenties}" type="hidden" id="20s">
<input value="${thirties}" type="hidden" id="30s">
<input value="${forties}" type="hidden" id="40s">






<!--Main Navigation-->
<header>

	<!-- Navbar -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
		<div class="container-fluid">

			<!-- Brand -->
			<a class="navbar-brand waves-effect" href="goMain.go" target="_blank">
				<strong class="blue-text">ITSO</strong>
			</a>

			<!-- Collapse -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Links -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<!-- Left -->
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"></li>
				</ul>

				<!-- Right -->
				<ul class="navbar-nav nav-flex-icons">
					<li class="nav-item"><a
						href="https://www.facebook.com/mdbootstrap"
						class="nav-link waves-effect" target="_blank"> <i
							class="fa fa-facebook"></i>
					</a></li>
					<li class="nav-item"><a href="https://twitter.com/MDBootstrap"
						class="nav-link waves-effect" target="_blank"> <i
							class="fa fa-twitter"></i>
					</a></li>
					<li class="nav-item"><a href="https://github.com/hj0212/ITSO"
						class="nav-link border border-light rounded waves-effect"
						target="_blank"> <i class="fa fa-github mr-2"></i>ITSO GitHub
					</a></li>
				</ul>

			</div>

		</div>
	</nav>
	<!-- Navbar -->

</header>
<!--Main Navigation-->

<!--Main layout-->
<div class="container-fluid mt-5">

	<!-- Heading -->
	<div class="card mb-4 wow fadeIn">

		<!--Card content-->
		<div class="card-body d-sm-flex justify-content-between">

			<h4 class="mb-2 mb-sm-0 pt-1">
				<a href="https://mdbootstrap.com/material-design-for-bootstrap/"
					target="_blank">Home Page</a> <span>/</span> <span>Dashboard</span>
			</h4>


		</div>

	</div>
	<!-- Heading -->

	<!--Grid row-->
	<div class="row wow fadeIn">

		<!--Grid column-->
		<div class="col-md-9 mb-4">

			<!--Card-->
			<div class="card">

				<!--Card content-->
				<div class="card-body">

					<canvas id="gender-bar-chart"></canvas>

				</div>

			</div>
			<!--/.Card-->

		</div>
		<!--Grid column-->

		<!--Grid column-->
		<div class="col-md-3 mb-4">

			<!--Card-->
			<div class="card mb-4">

				<!-- Card header -->
				<div class="card-header text-center">유저 연령대</div>

				<!--Card content-->
				<div class="card-body">

					<canvas id="pieChart"></canvas>

				</div>

			</div>
			<!--/.Card-->

			<!--Card-->
			<div class="card mb-4">

				<!--Card content-->
				<div class="card-body">

					<!-- List group links -->
					<div class="list-group list-group-flush">
						<a class="list-group-item list-group-item-action waves-effect">유저수
							<span class="badge badge-success badge-pill pull-right">22%
								<i class="fa fa-arrow-up ml-1"></i>
						</span>
						</a> <a class="list-group-item list-group-item-action waves-effect">트래픽
							<span class="badge badge-danger badge-pill pull-right">5%
								<i class="fa fa-arrow-down ml-1"></i>
						</span>
						</a> <a class="list-group-item list-group-item-action waves-effect">팁
							게시물 <span class="badge badge-primary badge-pill pull-right">14</span>
						</a> <a class="list-group-item list-group-item-action waves-effect">룩
							쉐어 게시물 <span class="badge badge-primary badge-pill pull-right">123</span>
						</a> <a class="list-group-item list-group-item-action waves-effect">댓글
							활동 <span class="badge badge-primary badge-pill pull-right">8</span>
						</a>
					</div>
					<!-- List group links -->

				</div>

			</div>
			<!--/.Card-->

		</div>
		<!--Grid column-->

	</div>
	<!--Grid row-->

	<!--Grid row-->
	<div class="row wow fadeIn">

		<!--Grid column-->
		<div class="col-md-12 mb-4">

			<!--Card-->
			<div class="card">

				<!--Card content-->
				<div class="card-body">
					<!-- Table  -->
					<table class="table table-hover">
						<!-- Table head -->
						<thead class="indigo lighten-4 ta-center">
							<tr>
								<th>#</th>
								<th>유저번호</th>
								<th>이메일</th>
								<th>이름</th>
								<th>가입일</th>
								<th>신고 횟수</th>
								<th>신고 사유</th>
								<th>블럭 유무</th>
								<th>정지</th>
							</tr>
						</thead>
						<!-- Table head -->

						<!-- block Table body -->
						<tbody class=ta-center>
							<c:forEach items="${reportedUsers}" var="reportedUsers"
								varStatus="status">
								<tr>
									<th scope="row"></th>
									<td class="user_seq" name="${status.index}">${reportedUsers.user_seq}</td>
									<td>${reportedUsers.email}</td>
									<td>${reportedUsers.name}</td>
									<td>${reportedUsers.create_date}</td>
									<td>${reportedUsers.report_count}</td>
									<td>${reportedUsers.report_reason}</td>
									<td class="isBlocked" name="${status.index}">${reportedUsers.block}</td>
									<td>
										<!-- Rectangular switch --> <label class="switch"> <input
											type="checkbox" class="cb" name="${status.index}"> <span
											class="slider"></span>
									</label>
									</td>
								</tr>

								<script>
									// 유저 블럭 스크립트
									$("input[name|=${status.index}]")
											.click(
													function() {
														var userSeq = $(
																".user_seq[name|=${status.index}]")
																.html();

														console.log(userSeq);

														$
																.ajax({
																	url : "specificUserblock.adm",
																	data : {
																		"userSeq" : userSeq
																	},
																	type : "post",
																	success : function(
																			result) {
																		console
																				.log(result);
																		if (result > 0) {
																			alert("블럭 상태 수정")
																		} else {
																			alert("에러 발생!");
																		}
																	},
																	error : function() {
																		alert("에러가 발생하였습니다. 관리자에게 문의하세요!");
																	}
																})
													})
								</script>
								<script>
									// 블럭 버튼 UI

									function changingBlockBtn() {
										var isBlocked = $(
												".isBlocked[name=${status.index}]")
												.html();
										if (isBlocked.contain('y')) {
											$(".cb[name=${status.index}]")
													.next("span").html(
															"::before");
											$(
													".isBlocked[name=${status.index}]")
													.html('y');
										} else {
											$(".cb[name=${status.index}]")
													.next("span").html("");
											$(
													".isBlocked[name=${status.index}]")
													.html('n');
										}

									}
								</script>



							</c:forEach>
						</tbody>
						<!-- Table body -->
					</table>


					<!-- Table  -->
					<span>1회 이상 신고 받은 유저만 목록에 출력 됩니다.</span>

				</div>

			</div>
			<!--/.Card-->

		</div>
		<!--Grid column-->

	</div>
	<!--Grid row-->

	<!--Grid row-->
	<div class="row wow fadeIn">

		<!--Grid column-->
		<div class="col-lg-4 col-md-12 mb-4">

			<!--Card-->
			<div class="card">

				<!-- Card header -->
				<div class="card-header">Line chart</div>

				<!--Card content-->
				<div class="card-body">

					<canvas id="lineChart"></canvas>

				</div>

			</div>
			<!--/.Card-->

		</div>
		<!--Grid column-->

		<!--Grid column-->
		<div class="col-lg-4 col-md-6 mb-4">

			<!--Card-->
			<div class="card">

				<!-- Card header -->
				<div class="card-header">Radar Chart</div>

				<!--Card content-->
				<div class="card-body">

					<canvas id="radarChart"></canvas>

				</div>

			</div>
			<!--/.Card-->

		</div>
		<!--Grid column-->

		<!--Grid column-->
		<div class="col-lg-4 col-md-6 mb-4">

			<!--Card-->
			<div class="card">

				<!-- Card header -->
				<div class="card-header">Doughnut Chart</div>

				<!--Card content-->
				<div class="card-body">

					<canvas id="doughnutChart"></canvas>

				</div>

			</div>
			<!--/.Card-->

		</div>
		<!--Grid column-->

	</div>
	<!--Grid row-->

	<!--Grid row-->
	<div class="row wow fadeIn">

		<!--Grid column-->
		<div class="col-md-6 mb-4">

			<!--Card-->
			<div class="card">

				<!-- Card header -->
				<div class="card-header">Google map</div>

				<!--Card content-->
				<div class="card-body">

					<!--Google map-->
					<div id="map-container" class="z-depth-1" style="height: 500px"></div>

				</div>

			</div>
			<!--/.Card-->

		</div>
		<!--Grid column-->
	</div>

</div>
<!--Main layout-->



<!-- SCRIPTS -->
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
<!-- Initializations -->
<script type="text/javascript">
	// Animations initialization
	new WOW().init();
</script>

<!-- Charts -->
<script>
	//gender-bar-char

	var genderCtxl = document.getElementById("gender-bar-chart").getContext(
			'2d');
	const femaleUserCounts = document.getElementById("femaleUserCounts").value;
	console.log(femaleUserCounts);
	const maleUserCounts = document.getElementById("maleUserCounts").value;
	console.log(maleUserCounts);

	var genderBarChart = new Chart(genderCtxl,
			{

				type : 'bar',
				data : {
					labels : [ "여", "남" ],
					datasets : [ {
						label : '성별',
						borderSkipped : 'low',
						data : [ femaleUserCounts, maleUserCounts ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								display : true,
								beginAtZero : true,
							}
						} ]
					},
					labels : true

				}

			});

	//age rate pie

	const teenagers = document.getElementById("10s").value;
	const twenties = document.getElementById("20s").value;
	const thirties = document.getElementById("30s").value;
	const forties = document.getElementById("40s").value;

	console.log(teenagers + " : " + twenties + " : " + thirties + " : "
			+ forties);

	var ctxP = document.getElementById("pieChart").getContext('2d');
	var myPieChart = new Chart(ctxP,
			{
				type : 'doughnut',
				data : {
					labels : [ "10대", "20대", "30대", "40대" ],
					datasets : [ {
						data : [ teenagers, twenties, thirties, forties ],
						backgroundColor : [ "#F7464A", "#46BFBD", "#FDB45C",
								"#949FB1" ],
						hoverBackgroundColor : [ "#FF5A5E", "#5AD3D1",
								"#FFC870", "#A8B3C5" ]
					} ]
				},
				options : {
					responsive : true,
					labels : true

				}
			});


	//line-chart increased-rate of users compare with last month
	var ctx = document.getElementById("lineChart").getContext('2d');
	var myLineChart = new Chart(ctx, {
		type : 'line',
		data : {
			"labels" : [ "January", "February", "March", "April", "May",
				"June", "July" ],
		"datasets" : [ {
			"label" : "My First Dataset",
			"data" : [ 65, 59, 80, 81, 56, 55, 40 ],
			"fill" : false,
			"borderColor" : "rgb(75, 192, 192)",
			"lineTension" : 0.1
		} ]
	},
		options : {
		}
	});

	//radar
	var ctxR = document.getElementById("radarChart").getContext('2d');
	var myRadarChart = new Chart(ctxR, {
		type : 'radar',
		data : {
			labels : [ "Eating", "Drinking", "Sleeping", "Designing", "Coding",
					"Cycling", "Running" ],
			datasets : [ {
				label : "My First dataset",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [ 65, 59, 90, 81, 56, 55, 40 ]
			}, {
				label : "My Second dataset",
				fillColor : "rgba(151,187,205,0.2)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(151,187,205,1)",
				data : [ 28, 48, 40, 19, 96, 27, 100 ]
			} ]
		},
		options : {
			responsive : true
		}
	});
</script>

<!--Google Maps-->
<script src="https://maps.google.com/maps/api/js"></script>
<script>
	// Regular map
	function regular_map() {
		var var_location = new google.maps.LatLng(37.533883, 126.896994);

		var var_mapoptions = {
			center : var_location,
			zoom : 20
		};

		var var_map = new google.maps.Map(document
				.getElementById("map-container"), var_mapoptions);

		var var_marker = new google.maps.Marker({
			position : var_location,
			map : var_map,
			title : "KH정보교육원(당산점)"
		});
	}

	// Initialize maps
	google.maps.event.addDomListener(window, 'load', regular_map);
</script>

</body>

</html>