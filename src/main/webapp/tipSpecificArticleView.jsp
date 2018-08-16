<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팁 보기 | ITSO</title>


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
.btn-itso {
	background-color: #1B0946;
	color: white;
}

#reaction {
	text-align: center;
}

#btns {
	text-align: center;
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

.brand-icon, .avatar {
	width: 64px;
}

img {
	width: 100%;
}
</style>

</head>
<body>

	<script>
		window.onload = function() {

			var tipSeq = document.getElementById("tip_seq").innerHTML;

			console.log(tipSeq);

			var i = 0;

			document.getElementById("like-btn").onclick = function() {

				console.log("like btn clicked! " + ++i);

				$.ajax({

					url : "tipArticleLikeProc.tip",
					method : "GET",
					data : {
						"tipSeq" : tipSeq
					},
					success : function(data, textStatus, jqXHR) {
						console.log(this.data + "," + this.url + ","
								+ this.textStatus + "," + this.jqXHR);
						console.log("좋아요  + 1");
						
						alert("좋아요 표시를 하였습니다!")
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(this.textStatus + "," + this.jqXHR + ","
								+ this.errorThrown);
						console.log("좋아요 실패 관리자에게 문의 요망");
					}

				});

			}
		};
	</script>


	<!-- navi -->
	<%@include file="navi.jsp"%>


	<!-- body -->
	<table class="container-fluid">
		<c:forEach items="${tipContent}" var="tipContent">
			<tr class="container">
				<td><div id="tip_seq" class="container">${tipContent.tip_seq}</div></td>
				<td><div class="container">
						<h1>${tipContent.tip_title}</h1>
					</div></td>
				<td><div class="container">${tipContent.category}</div></td>
				<td><div class="container">${tipContent.tip_viewcount}</div></td>
				<td><div class="container">${tipContent.tip_writer}</div></td>
			</tr>
			<tr>
				<td colspan=5><div class="container">${tipContent.tip_contents}</div></td>
			</tr>
		</c:forEach>
	</table>




	<div id=reaction>
		<button id="like-btn" class="btn white btn-sm">
<%-- 			<c:forEach items="${tipLikeCounts}" var="tipLikeCounts"> --%>
				<i class=" fa fa-heart red-text" aria-hidden="true"></i>
<%-- 				${tipLikeCounts.tip_good_seq} --%>
<%-- 			</c:forEach> --%>
		</button>
		<button class="btn white btn-sm">
			<i class="fa fa-bomb black-text" aria-hidden="true"></i>
		</button>
	</div>


	<!-- comments -->
	<div class="container mt-4">
		<table id="comment">
			<tbody>
				<tr>
					<td><img class="avatar rounded-circle z-depth-1-half mr-3"
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
									<img class="ml-4 avatar rounded-circle z-depth-1-half mr-3"
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
									2 <a href="#">▲</a>· reply>· flag · 6 months ago
								</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="comment-child">
									<img class="ml-4 avatar rounded-circle z-depth-1-half mr-3"
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



	<div id=btns>
		<button class="btn btn-itso"
			onclick="javascript:location.replace('tipBoardMainPage.tip')">돌아가기</button>
		<!-- location.replace = history.back() + refresh() -->
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