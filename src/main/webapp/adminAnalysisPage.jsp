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

</head>
<!-- dataSets -->
<input value="${femaleUsers}" type="number" id="femaleUserCounts">
<input value="${maleUsers}" type="number" id="maleUserCounts">

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
<main class="pt-5 mx-lg-5">
<div class="container-fluid mt-5">

	<!-- Heading -->
	<div class="card mb-4 wow fadeIn">

		<!--Card content-->
		<div class="card-body d-sm-flex justify-content-between">

			<h4 class="mb-2 mb-sm-0 pt-1">
				<a href="https://mdbootstrap.com/material-design-for-bootstrap/"
					target="_blank">Home Page</a> <span>/</span> <span>Dashboard</span>
			</h4>

			<form class="d-flex justify-content-center">
				<!-- Default input -->
				<input type="search" placeholder="Type your query"
					aria-label="Search" class="form-control">
				<button class="btn btn-primary btn-sm my-0 p" type="submit">
					<i class="fa fa-search"></i>
				</button>

			</form>

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
		<div class="col-md-6 mb-4">

			<!--Card-->
			<div class="card">

				<!--Card content-->
				<div class="card-body">

					<!-- Table  -->
					<table class="table table-hover">
						<!-- Table head -->
						<thead class="blue-grey lighten-4">
							<tr>
								<th>#</th>
								<th>Lorem</th>
								<th>Ipsum</th>
								<th>Dolor</th>
							</tr>
						</thead>
						<!-- Table head -->

						<!-- Table body -->
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Cell 1</td>
								<td>Cell 2</td>
								<td>Cell 3</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Cell 4</td>
								<td>Cell 5</td>
								<td>Cell 6</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Cell 7</td>
								<td>Cell 8</td>
								<td>Cell 9</td>
							</tr>
						</tbody>
						<!-- Table body -->
					</table>
					<!-- Table  -->

				</div>

			</div>
			<!--/.Card-->

		</div>
		<!--Grid column-->

		<!--Grid column-->
		<div class="col-md-6 mb-4">

			<!--Card-->
			<div class="card">

				<!--Card content-->
				<div class="card-body">

					<!-- Table  -->
					<table class="table table-hover">
						<!-- Table head -->
						<thead class="blue lighten-4">
							<tr>
								<th>#</th>
								<th>Lorem</th>
								<th>Ipsum</th>
								<th>Dolor</th>
							</tr>
						</thead>
						<!-- Table head -->

						<!-- Table body -->
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Cell 1</td>
								<td>Cell 2</td>
								<td>Cell 3</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Cell 4</td>
								<td>Cell 5</td>
								<td>Cell 6</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Cell 7</td>
								<td>Cell 8</td>
								<td>Cell 9</td>
							</tr>
						</tbody>
						<!-- Table body -->
					</table>
					<!-- Table  -->

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

		<!--Grid column-->
		<div class="col-md-6 mb-4">

			<!--Card-->
			<div class="card">

				<!--Section: Modals-->
				<section>

					<!-- Frame Modal Top Info-->
					<div class="modal fade top" id="frameModalTopInfoDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div
							class="modal-dialog modal-frame modal-top modal-notify modal-info"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Body-->
								<div class="modal-body">
									<div
										class="row d-flex justify-content-center align-items-center">

										<p class="pt-3 pr-2">Lorem ipsum dolor sit amet,
											consectetur adipisicing elit. Impedit nisi quo provident
											fugiat reprehenderit nostrum quos..</p>

										<a role="button" class="btn btn-info">Get it now <i
											class="fa fa-diamond ml-1"></i>
										</a> <a role="button" class="btn btn-outline-info waves-effect"
											data-dismiss="modal">No, thanks</a>
									</div>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Frame Modal Bottom Success-->

					<!-- Frame Modal Bottom Success-->
					<div class="modal fade bottom" id="frameModalBottomSuccessDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div
							class="modal-dialog modal-frame modal-bottom modal-notify modal-success"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Body-->
								<div class="modal-body">
									<div
										class="row d-flex justify-content-center align-items-center">

										<p class="pt-3 pr-2">Lorem ipsum dolor sit amet,
											consectetur adipisicing elit. Impedit nisi quo provident
											fugiat reprehenderit nostrum quos..</p>

										<a role="button" class="btn btn-success">Get it now <i
											class="fa fa-diamond ml-1"></i>
										</a> <a role="button" class="btn btn-outline-success waves-effect"
											data-dismiss="modal">No, thanks</a>
									</div>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Frame Modal Bottom Success-->

					<!-- Side Modal Top Right Success-->
					<div class="modal fade right" id="sideModalTRSuccessDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div
							class="modal-dialog modal-side modal-top-right modal-notify modal-success"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading lead">Modal Success</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">
									<div class="text-center">
										<i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Impedit iusto nulla aperiam blanditiis ad consequatur
											in dolores culpa, dignissimos, eius non possimus fugiat. Esse
											ratione fuga, enim, ab officiis totam.</p>
									</div>
								</div>

								<!--Footer-->
								<div class="modal-footer justify-content-center">
									<a role="button" class="btn btn-success">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-success waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Side Modal Top Right Success-->

					<!-- Side Modal Top Left Info-->
					<div class="modal fade left" id="sideModalTLInfoDemo" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
						data-backdrop="false">
						<div
							class="modal-dialog modal-side modal-top-left modal-notify modal-info"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading lead">Modal Info</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">

									<img
										src="https://mdbootstrap.com/wp-content/uploads/2016/11/admin-dashboard-bootstrap.jpg"
										alt="Material Design for Bootstrap - dashboard"
										class="img-fluid">

									<div class="text-center">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Nesciunt vero illo error eveniet cum.</p>
									</div>
								</div>

								<!--Footer-->
								<div class="modal-footer justify-content-center">
									<a role="button" class="btn btn-info">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-info waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Side Modal Top Left Info-->

					<!-- Side Modal Bottom Right Danger-->
					<div class="modal fade right" id="sideModalBRDangerDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div
							class="modal-dialog modal-side modal-bottom-right modal-notify modal-danger"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading">Modal Danger</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">

									<div class="row">
										<div class="col-3">
											<p></p>
											<p class="text-center">
												<i class="fa fa-shopping-cart fa-4x"></i>
											</p>
										</div>

										<div class="col-9">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Fuga, molestiae provident temporibus sunt earum.</p>
											<h2>
												<span class="badge">v52gs1</span>
											</h2>
										</div>
									</div>
								</div>

								<!--Footer-->
								<div class="modal-footer justify-content-center">
									<a role="button" class="btn btn-danger">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-danger waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Side Modal Bottom Right Danger-->

					<!-- Side Modal Bottom Left Warning-->
					<div class="modal fade left" id="sideModalBLWarningDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div
							class="modal-dialog modal-side modal-bottom-left modal-notify modal-warning"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading">Modal Warning</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">

									<div class="row">
										<div class="col-3 text-center">
											<img
												src="https://mdbootstrap.com/img/Photos/Avatars/img%20(1).jpg"
												alt="Michal Szymanski - founder of Material Design for Bootstrap"
												class="img-fluid z-depth-1-half rounded-circle">
											<div style="height: 10px"></div>
											<p class="title mb-0">Jane</p>
											<p class="text-muted " style="font-size: 13px">Consultant</p>
										</div>

										<div class="col-9">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Fuga, molestiae provident temporibus sunt earum.</p>
											<p class="card-text">
												<strong>Lorem ipsum dolor sit amet, consectetur
													adipisicing elit.</strong>
											</p>
										</div>
									</div>


								</div>

								<!--Footer-->
								<div class="modal-footer justify-content-center">
									<a role="button" class="btn btn-warning">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-warning waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Side Modal Bottom Left Warning-->

					<!--Modal Form Login with Avatar Demo-->
					<div class="modal fade" id="modalLoginAvatarDemo" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog cascading-modal modal-avatar modal-sm"
							role="document">
							<!--Content-->
							<div class="modal-content">

								<!--Header-->
								<div class="modal-header">
									<img
										src="https://mdbootstrap.com/img/Photos/Avatars/img%20%281%29.jpg"
										class="rounded-circle img-responsive" alt="Avatar photo">
								</div>
								<!--Body-->
								<div class="modal-body text-center mb-1">

									<h5 class="mt-1 mb-2">Maria Doe</h5>

									<div class="md-form ml-0 mr-0">
										<input type="password" type="text" id="form1"
											class="form-control ml-0"> <label for="form1"
											class="ml-0">Enter password</label>
									</div>

									<div class="text-center mt-4">
										<button class="btn btn-cyan">
											Login <i class="fa fa-sign-in ml-1"></i>
										</button>
									</div>
								</div>

							</div>
							<!--/.Content-->
						</div>
					</div>
					<!--Modal Form Login with Avatar Demo-->

					<!--Modal: Login / Register Form Demo-->
					<div class="modal fade" id="modalLRFormDemo" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">...</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save
										changes</button>
								</div>
							</div>
						</div>
					</div>
					<!--Modal: Login / Register Form Demo-->

					<!-- Central Modal Large Info-->
					<div class="modal fade" id="centralModalLGInfoDemo" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-notify modal-info"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading lead">Modal Info</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">
									<div class="text-center">
										<i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Impedit iusto nulla aperiam blanditiis ad consequatur
											in dolores culpa, dignissimos, eius non possimus fugiat. Esse
											ratione fuga, enim, ab officiis totam.</p>
									</div>
									<img
										src="https://mdbootstrap.com/wp-content/uploads/2016/11/admin-dashboard-bootstrap.jpg"
										alt="Material Design for Bootstrap - dashboard"
										class="img-fluid">

								</div>

								<!--Footer-->
								<div class="modal-footer">
									<a role="button" class="btn btn-info">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-info waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Central Modal Large Info-->

					<!-- Central Modal Fluid Success-->
					<div class="modal fade" id="centralModalFluidSuccessDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-fluid modal-notify modal-success"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading lead">Modal Success</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">
									<div class="text-center">
										<i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Impedit iusto nulla aperiam blanditiis ad consequatur
											in dolores culpa, dignissimos, eius non possimus fugiat. Esse
											ratione fuga, enim, ab officiis totam.</p>
									</div>
									<ul class="list-group z-depth-0">
										<li class="list-group-item justify-content-between">Cras
											justo odio <span class="badge badge-primary badge-pill">14</span>
										</li>
										<li class="list-group-item justify-content-between">
											Dapibus ac facilisis in <span
											class="badge badge-primary badge-pill">2</span>
										</li>
										<li class="list-group-item justify-content-between">
											Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
										</li>
										<li class="list-group-item justify-content-between">Cras
											justo odio <span class="badge badge-primary badge-pill">14</span>
										</li>
										<li class="list-group-item justify-content-between">
											Dapibus ac facilisis in <span
											class="badge badge-primary badge-pill">2</span>
										</li>
										<li class="list-group-item justify-content-between">
											Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
										</li>
									</ul>
								</div>

								<!--Footer-->
								<div class="modal-footer">
									<a role="button" class="btn btn-success">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-success waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Central Modal Fluid Success-->

					<!-- Full Height Modal Right Success Demo-->
					<div class="modal fade right" id="fluidModalRightSuccessDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div
							class="modal-dialog modal-full-height modal-right modal-notify modal-success"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading lead">Modal Success</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">
									<div class="text-center">
										<i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Impedit iusto nulla aperiam blanditiis ad consequatur
											in dolores culpa, dignissimos, eius non possimus fugiat. Esse
											ratione fuga, enim, ab officiis totam.</p>
									</div>
									<ul class="list-group z-depth-0">
										<li class="list-group-item justify-content-between">Cras
											justo odio <span class="badge badge-primary badge-pill">14</span>
										</li>
										<li class="list-group-item justify-content-between">
											Dapibus ac facilisis in <span
											class="badge badge-primary badge-pill">2</span>
										</li>
										<li class="list-group-item justify-content-between">
											Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
										</li>
										<li class="list-group-item justify-content-between">Cras
											justo odio <span class="badge badge-primary badge-pill">14</span>
										</li>
										<li class="list-group-item justify-content-between">
											Dapibus ac facilisis in <span
											class="badge badge-primary badge-pill">2</span>
										</li>
										<li class="list-group-item justify-content-between">
											Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
										</li>
									</ul>
								</div>

								<!--Footer-->
								<div class="modal-footer justify-content-center">
									<a role="button" class="btn btn-success">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-success waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Full Height Modal Right Success Demo-->

					<!-- Full Height Modal Left Info Demo-->
					<div class="modal fade left" id="fluidModalLeftInfoDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div
							class="modal-dialog modal-full-height modal-left modal-notify modal-info"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading lead">Modal Success</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">
									<div class="text-center">
										<i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Impedit iusto nulla aperiam blanditiis ad consequatur
											in dolores culpa, dignissimos, eius non possimus fugiat. Esse
											ratione fuga, enim, ab officiis totam.</p>
									</div>
									<ul class="list-group z-depth-0">
										<li class="list-group-item justify-content-between">Cras
											justo odio <span class="badge badge-primary badge-pill">14</span>
										</li>
										<li class="list-group-item justify-content-between">
											Dapibus ac facilisis in <span
											class="badge badge-primary badge-pill">2</span>
										</li>
										<li class="list-group-item justify-content-between">
											Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
										</li>
										<li class="list-group-item justify-content-between">Cras
											justo odio <span class="badge badge-primary badge-pill">14</span>
										</li>
										<li class="list-group-item justify-content-between">
											Dapibus ac facilisis in <span
											class="badge badge-primary badge-pill">2</span>
										</li>
										<li class="list-group-item justify-content-between">
											Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
										</li>
									</ul>
								</div>

								<!--Footer-->
								<div class="modal-footer justify-content-center">
									<a role="button" class="btn btn-info">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-info waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Full Height Modal Right Info Demo-->

					<!-- Full Height Modal Top Warning Demo-->
					<div class="modal fade top" id="fluidModalTopWarningDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div
							class="modal-dialog modal-full-height modal-top modal-notify modal-warning"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading lead">Modal Warning</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">
									<div class="text-center">
										<i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
									</div>
									<ul class="list-group z-depth-0">
										<li class="list-group-item justify-content-between">Cras
											justo odio <span class="badge badge-primary badge-pill">14</span>
										</li>
										<li class="list-group-item justify-content-between">
											Dapibus ac facilisis in <span
											class="badge badge-primary badge-pill">2</span>
										</li>
										<li class="list-group-item justify-content-between">
											Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
										</li>
									</ul>
								</div>

								<!--Footer-->
								<div class="modal-footer">
									<a role="button" class="btn btn-warning">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-warning waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Full Height Modal Top Warning Demo-->

					<!-- Full Height Modal Bottom Danger Demo-->
					<div class="modal fade bottom" id="fluidModalBottomDangerDemo"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div
							class="modal-dialog modal-full-height modal-bottom modal-notify modal-danger"
							role="document">
							<!--Content-->
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header">
									<p class="heading lead">Modal Danger</p>

									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" class="white-text">&times;</span>
									</button>
								</div>

								<!--Body-->
								<div class="modal-body">
									<div class="text-center">
										<i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
									</div>
									<ul class="list-group z-depth-0">
										<li class="list-group-item justify-content-between">Cras
											justo odio <span class="badge badge-primary badge-pill">14</span>
										</li>
										<li class="list-group-item justify-content-between">
											Dapibus ac facilisis in <span
											class="badge badge-primary badge-pill">2</span>
										</li>
										<li class="list-group-item justify-content-between">
											Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
										</li>
									</ul>
								</div>

								<!--Footer-->
								<div class="modal-footer">
									<a role="button" class="btn btn-danger">Get it now <i
										class="fa fa-diamond ml-1"></i>
									</a> <a role="button" class="btn btn-outline-danger waves-effect"
										data-dismiss="modal">No, thanks</a>
								</div>
							</div>
							<!--/.Content-->
						</div>
					</div>
					<!-- Full Height Modal Bottom Danger Demo-->

				</section>
				<!--Section: Modals-->

				<!-- Card header -->
				<div class="card-header">Modals</div>

				<!--Card content-->
				<div class="card-body">

					<div class="text-center mb-5">
						<p class="lead">Click buttons below to launch modals demo</p>
					</div>

					<!-- First row-->
					<div class="row">

						<!--First column-->
						<div class="col-md-3">
							<h5 class="text-center mb-3">Frame Modal</h5>

							<img src="https://mdbootstrap.com/img/brandflow/modal4.jpg"
								alt="MDB graphics" class="img-fluid z-depth-1">
							<div class="text-center">
								<h5 class="my-3">Position</h5>

								<a class="btn btn-primary btn-sm" data-toggle="modal"
									data-target="#frameModalTopInfoDemo" data-backdrop="false">Top</a>
								<br> <a class="btn btn-primary btn-sm" data-toggle="modal"
									data-target="#frameModalBottomSuccessDemo"
									data-backdrop="false">Bottom</a>
							</div>
						</div>
						<!--First column-->

						<!--Second column-->
						<div class="col-md-3">
							<h5 class="text-center mb-3">Side Modal</h5>

							<img src="https://mdbootstrap.com/img/brandflow/modal3.jpg"
								alt="MDB graphics" class="img-fluid z-depth-1">
							<div class="text-center">
								<h5 class="my-3">Position</h5>

								<a class="btn btn-primary btn-sm" data-toggle="modal"
									data-target="#sideModalTRSuccessDemo" data-backdrop="false">Top
									Right</a> <br> <a class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#sideModalTLInfoDemo">Top
									Left</a> <br> <a class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#sideModalBRDangerDemo">Bottom
									Right</a> <br> <a class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#sideModalBLWarningDemo">Bottom
									Left</a>
							</div>
						</div>
						<!--Second column-->

						<!--Third column-->
						<div class="col-md-3">
							<h5 class="text-center mb-3">Central Modal</h5>

							<img src="https://mdbootstrap.com/img/brandflow/modal2.jpg"
								alt="MDB graphics" class="img-fluid z-depth-1">
							<div class="text-center">
								<h5 class="my-3">Size</h5>

								<button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#modalLoginAvatarDemo">Small
								</button>
								<br>
								<button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#modalLRFormDemo">Medium
								</button>
								<br>
								<button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#centralModalLGInfoDemo">Large
								</button>
								<br>
								<button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#centralModalFluidSuccessDemo">Fluid</button>
							</div>
						</div>
						<!--Third column-->

						<!--Fourth column-->
						<div class="col-md-3">
							<h5 class="text-center mb-3">Fluid Modal</h5>

							<img src="https://mdbootstrap.com/img/brandflow/modal1.jpg"
								alt="MDB graphics" class="img-fluid z-depth-1">
							<div class="text-center">
								<h5 class="my-3">Position</h5>

								<button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#fluidModalRightSuccessDemo">Right</button>
								<br>
								<button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#fluidModalLeftInfoDemo">Left</button>
								<br>
								<button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#fluidModalTopWarningDemo">Top</button>
								<br>
								<button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#fluidModalBottomDangerDemo">Bottom</button>
							</div>
						</div>
						<!--Fourth column-->

					</div>
					<!-- /.First row-->

				</div>

			</div>
			<!--/.Card-->

		</div>
		<!--Grid column-->

	</div>
	<!--Grid row-->

</div>
</main>
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
						labelString : '성별',
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
								callback : function(data) {
									return data;
								}
							}
						} ]
					},
					labels : true

				}

			});

	//pie
	var ctxP = document.getElementById("pieChart").getContext('2d');
	var myPieChart = new Chart(ctxP,
			{
				type : 'doughnut',
				data : {
					labels : [ "10대", "20대", "30대", "40대" ],
					datasets : [ {
						data : [ 53, 233, 140, 100 ],
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