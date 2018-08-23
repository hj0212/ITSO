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

			// 			tip delete btn proc

			$("#tipDeleteBtn").click(function() {

				var tipSeq = document.getElementById("tip_seq").innerHTML;

				console.log(tipSeq);

				$.ajax({
					url : "deleteSpecificTip.tip",
					data : {
						"tipSeq" : tipSeq
					},
					type : "get",
					success : function() {
						alert("success");
						location.replace("tipBoardMainPage.tip");
					},
					error : function() {
						alert("error");
					}
				})

			})

			// 		tip comment proc
			$("#insertTipCommentBtn")
					.click(
							function() {

								var data = JSON
										.stringify({
											tip_seq : document
													.getElementById("tip_seq").innerHTML,
											user_seq : document
													.getElementById("user_seq").value,
											tip_comment_contents : document
													.getElementById("tip_comment_contents").value,
										});

								console.log(data);

								$
										.ajax({
											url : "insertTipCommentProc.tip",
											type : "post",
											data : data,
											dataType : "json",
											contentType : "application/json;charset=UTF-8",
											async : true,
											success : function() {
												alert("success");
												location.reload();
											},
											error : function() {
												alert("failure");
											}

										})

							});

			var tipSeqForLike = document.getElementById("tip_seq").innerHTML;
			var tipLikingUser = document.getElementById("user_seq").value;

			var i = 0;

			document.getElementById("like-btn").onclick = function() {

				console.log("like btn clicked! " + ++i);
				if (tipLikingUser == "") {
					tipLikingUser = 0;
				}
				console.log(tipSeqForLike + ":" + tipLikingUser);

				$.ajax({

					url : "tipArticleLikeProc.tip",
					method : "post",
					data : {
						"tipSeq" : tipSeqForLike,
						"tipLikingUser" : tipLikingUser
					},
					success : function(data, textStatus, jqXHR) {
						console.log("[" + data + "]");

						if (data == 9) {
							alert("좋아요는 한번만 할 수 있습니다.");

						} else if (data == 1) {
							console.log("좋아요  + 1");
							alert("좋아요!")
						} else {
							alert("좋아요 에러 발생!");
						};

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
	<table class="container">
		<c:forEach items="${tipContent}" var="tipContent">
			<tr>
				<td>
					<h1>${tipContent.tip_title}</h1>
			</tr>
			<tr>
				<td><p id="tip_seq">${tipContent.tip_seq}</p></td>
				<td>${tipContent.category}${tipContent.tip_viewcount}
					${tipContent.tip_writer}</td>
			</tr>
			<tr>
				<td><div class="container">${tipContent.tip_contents}</div></td>
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
				<c:forEach items="${tipComments}" var="tipComments">

					<tr>
						<td><img class="avatar rounded-circle z-depth-1-half mr-3"
							src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg">
						</td>

						<td>
							<div>
								<a href="#">${tipComments.name}</a>
							</div>

							<div>${tipComments.tip_comment_contents}</div>
						</td>
						<td>${tipComments.tip_comment_time}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- To write reply -->
	<div class="mt-4 container">
		<textarea class="form-control" name="tip_comment_contents"
			id="tip_comment_contents"></textarea>
		<input type="hidden" class="form-control"
			value="${sessionScope.user.seq}" name="user_seq" id="user_seq">
		<button id="insertTipCommentBtn" type="button"
			class="btn btn-sm btn-itso">댓글 쓰기</button>
	</div>



	<!-- like btn -->
	<div id=btns>
		<button class="btn btn-itso"
			onclick="javascript:location.replace('tipBoardMainPage.tip')">돌아가기</button>

		<!-- location.replace = history.back() + refresh() -->
		<button id="tipDeleteBtn" class="btn btn-itso">지우기</button>

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