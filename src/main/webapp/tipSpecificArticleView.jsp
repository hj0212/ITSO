<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팁 보기 | ITSO</title>
<!-- Font Awesome 4.7-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css" rel="stylesheet">
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

#comment a {
	color: black;
}
</style>

</head>
<body>
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
				<td><span id="tip_seq">${tipContent.tip_seq}</span>
					<span>${tipContent.category}</span>
					<span>
						<i id="category-mark"></i>
					</span>
					<span>
						<i class="fa fa-comment-o"></i>${tipContent.tip_viewcount}</span>
					<input id="tip_writer" type="hidden" value="${tipContent.tip_writer}">
					<span>${tipContent.name}</span>
					<span>${tipContent.tip_date}</span>
			</tr>
			<tr>
				<td><div class="container">${tipContent.tip_contents}</div></td>
			</tr>
		</c:forEach>
	</table>

	<div id=reaction>
		<button id="like-btn" class="btn white btn-sm">
			<i class=" fa fa-heart red-text" aria-hidden="true"></i>
		</button>
	</div>

	<!-- comments -->
	<div class="container mt-4" id="comment-container">
		<table id="comment">
			<tbody>
				<c:forEach items="${tipComments}" var="tipComments">
					<tr>
						<td><img class="avatar rounded-circle z-depth-1-half mr-3"
							src="resources/images/${tipComments.photo}"></td>
						<td>
							<div>
								<a href="#">${tipComments.name}</a>
							</div>+
							<div>${tipComments.tip_comment_contents}</div>
							<div>${tipComments.tip_comment_time}
								<c:if test="${sessionScope.user.seq == tipComments.user_seq}">
									<span><a href="javascript:void(0)"
										data-seq="${tipComments.tip_comment_seq}"
										data-tip="${tipComments.tip_seq}" class="delete"><i
											class="fa fa-times" aria-hidden="true"></i></a></span>
								</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- To write reply -->
	<div class="mt-4 container">
		<textarea class="form-control" name="tip_comment_contents" id="tip_comment_contents" placeholder="로그인이 필요합니다."></textarea>
		<input type="hidden" class="form-control" value="${sessionScope.user.seq}" name="user_seq" id="user_seq">
		<button id="insertTipCommentBtn" type="button" class="btn btn-sm btn-itso" disabled="disabled">댓글 쓰기</button>
	</div>

	<!-- like btn -->
	<div id=btns>
		<button class="btn btn-itso"
			onclick="javascript:location.replace('tipBoardMainPage.tip')">돌아가기</button>
		<input type="hidden" id="sessionUser" value="${sessionScope.user.seq}">
		<input id="tipDeleteBtn" class="btn btn-itso" value="지우기">
		<input id="tipModifyBtn" class="btn btn-itso"  value="바꾸기">



	</div>

		<script>
//팁 삭제하기 버튼 나타나게하기
		var tipWriter = $("#tip_writer").val();
			var sessionUser = $("#sessionUser").val();

			console.log(tipWriter + " : " + sessionUser);

			console.log(sessionUser==tipWriter);
			
			if (sessionUser == tipWriter) {
				$("#tipDeleteBtn").attr("type", "button");
				$("#tipModifyBtn").attr("type", "button");
					
			} else {
				$("#tipDeleteBtn").hide();
				$("#tipModifyBtn").hide();
			}
		</script>
<script>

var tipSeq = $("#tip_seq").html();
console.log(tipSeq);

$("#tipModifyBtn").click(function(){
	location.href="tipModification.go?tipSeq=" + tipSeq;
	
})

</script>
	<script>
		window.onload = function() {
			// tip delete btn proc
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

			// tip comment proc
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
											success : function(data) {
												showTipComment(data);
											},

											error : function() {
												alert("failure");
											}
										})
							});

			function showTipComment(data) {
				let html = '<table id="comment">';
				html += '<tbody>'
				$
						.each(
								data,
								function(index, item) {
									html += '<tr>';
									html += '<td>';
									html += '<img class="avatar rounded-circle z-depth-1-half mr-3" src="resources/images/'+item.photo+'"/>';
									html += '</td>';
									html += '<td>';
									html += '<div>';
									html += '<a href="#">' + item.name + '</a>';
									html += '</div>';
									html += '<div>' + item.tip_comment_contents
											+ '</div>';
									html += '<div>' + item.tip_comment_time;
									if (item.user_seq == item.writer) {
										html += '<span><a href="javascript:void(0)" class="delete" data-seq="'
												+ item.tip_comment_seq
												+ '" data-tip="'
												+ item.tip_seq
												+ '"><i class="fa fa-times" aria-hidden="true"></i></a></span>';
									}
									html += '</div>';
									html += '</td>';
									html += '</tr>';
								});
				html += '</tbody>';
				html += '</table>';

				$("#tip_comment_contents").val("");
				$("#comment-container").html(html);
			}

			$(document).on('click', '.delete', function() {
				let comment_seq = $(this).data("seq");
				let tip_seq = $(this).data("tip");

				console.log(comment_seq + " : " + tip_seq);

				let deleteCheck = confirm("댓글을 삭제 하시겠습니까?");

				if (deleteCheck) {
					$.ajax({
						url : "deleteTipComment.tip",
						dataType : "JSON",
						method : "post",
						data : {
							comment_seq : comment_seq,
							tip_seq : tip_seq
						},

						success : function(data) {
							showTipComment(data);
						}
					});
				}
			});
		}

			</script>

	<script>
			
			$(document).ready(function(){

				// 			좋아요 기능
				var tipSeqForLike = document.getElementById("tip_seq").innerHTML;
				var tipLikingUser = document.getElementById("user_seq").value;

				var i = 0;

				$("#like-btn").click(function() {
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
							}
							;

						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log(this.textStatus + "," + this.jqXHR + ","
									+ this.errorThrown);
							console.log("좋아요 실패 관리자에게 문의 요망");
						}
					});
			})
			});
			</script>

<c:if test="${!empty sessionScope.user.seq}">
		<script>
			$("#tip_comment_contents").attr("placeholder","댓글 쓰기");
			$("#insertTipCommentBtn").attr("disabled",false);
		</script>
	</c:if>
	
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
	<!-- JQuery 원래 밑에 있었음-->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>