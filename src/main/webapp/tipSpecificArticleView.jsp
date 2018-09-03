<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta property="fb:app_id" content="175142883151176" />
<meta property="og:site_name" content="ITSO" />
<meta property="og:title" content="${tipContent[0].tip_title}" />
<meta property="og:description" content="ITSO TIPBOARD" />
<meta property="article:author" content="${tipContent[0].tip_writer}" />
<meta property="og:url" content="document.location.href" />
<meta property="og:image" content="https://image.ibb.co/cvb5k9/itso_12.png" />

<meta name="twitter:card" content="summary" />
<meta name="twitter:url" content="document.location.href" />
<meta name="twitter:title" content="${tipContent[0].tip_title}" />
<meta name="twitter:description" content="ITSO TIPBOARD" />
<meta name="twitter:image" content="https://image.ibb.co/cvb5k9/itso_12.png" />
<meta name="twitter:site" content="${tipContent[0].tip_writer}" />
<meta name="twitter:creator" content="@트위터아이디" />

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
				<td><span id="tip_seq">${tipContent.tip_seq}</span> <span>${tipContent.category}</span>
					<span> <i id="category-mark"></i>
				</span> <span> <i class="fa fa-comment-o"></i>${tipContent.tip_viewcount}</span>
					<input id="tip_writer" type="hidden"
					value="${tipContent.tip_writer}"> <span>${tipContent.name}</span>
					<span>${tipContent.tip_date}</span> 
					<!--facebook-->
					<button type="button" class="btn-floating btn-sm btn-fb share"
						style="float: right; background-color: #4267b2; color: white; border: 0px; margin-left: 10px; border-radius: 5px;"
						onclick="facebookgo()">
						<i class="fa fa-facebook-f" title="페이스북으로 공유하기"></i>
					</button> <!--twitter-->
					<button type="button" class="btn-floating btn-sm btn-tw share"
						style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 5px;"
						onclick="twittergo()">
						<i class="fa fa-twitter" title="트위터로 공유하기"></i>
					</button> <!--kakao-->
					<button type="button" class="btn-floating btn-sm share "
						style="float: right; background-color: #fae101; color: white; border: 0px; margin-left: 10px; border-radius: 5px;"
						title="카카오로 공유하기" onclick="kakaogo()" id="kakao-link-btn">
						<i class="fa fa-comment"></i>
					</button>
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
		<textarea class="form-control" name="tip_comment_contents"
			id="tip_comment_contents" placeholder="로그인이 필요합니다."></textarea>
		<input type="hidden" class="form-control"
			value="${sessionScope.user.seq}" name="user_seq" id="user_seq">
		<button id="insertTipCommentBtn" type="button"
			class="btn btn-sm btn-itso" disabled="disabled">댓글 쓰기</button>
	</div>

	<!-- like btn -->
	<div id=btns>
		<button class="btn btn-itso"
			onclick="javascript:location.replace('tipBoardMainPage.tip')">돌아가기</button>
		<input type="hidden" id="sessionUser" value="${sessionScope.user.seq}">
		<input id="tipDeleteBtn" class="btn btn-itso" value="지우기"> <input
			id="tipModifyBtn" class="btn btn-itso" value="바꾸기">



	</div>

	<script>
		//팁 삭제하기 버튼 나타나게하기
		var tipWriter = $("#tip_writer").val();
		var sessionUser = $("#sessionUser").val();

		console.log(tipWriter + " : " + sessionUser);

		console.log(sessionUser == tipWriter);

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

		$("#tipModifyBtn").click(function() {
			location.href = "tipModification.go?tipSeq=" + tipSeq;

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
		$(document)
				.ready(
						function() {

							// 			좋아요 기능
							var tipSeqForLike = document
									.getElementById("tip_seq").innerHTML;
							var tipLikingUser = document
									.getElementById("user_seq").value;

							var i = 0;

							$("#like-btn")
									.click(
											function() {
												console
														.log("like btn clicked! "
																+ ++i);
												if (tipLikingUser == "") {
													tipLikingUser = 0;
												}
												console.log(tipSeqForLike + ":"
														+ tipLikingUser);

												$
														.ajax({
															url : "tipArticleLikeProc.tip",
															method : "post",
															data : {
																"tipSeq" : tipSeqForLike,
																"tipLikingUser" : tipLikingUser
															},
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																console.log("["
																		+ data
																		+ "]");

																if (data == 9) {
																	alert("좋아요는 한번만 할 수 있습니다.");

																} else if (data == 1) {
																	console
																			.log("좋아요  + 1");
																	alert("좋아요!")
																} else {
																	alert("좋아요 에러 발생!");
																}
																;

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																console
																		.log(this.textStatus
																				+ ","
																				+ this.jqXHR
																				+ ","
																				+ this.errorThrown);
																console
																		.log("좋아요 실패 관리자에게 문의 요망");
															}
														});
											})
						});
	</script>

	<c:if test="${!empty sessionScope.user.seq}">
		<script>
			$("#tip_comment_contents").attr("placeholder", "댓글 쓰기");
			$("#insertTipCommentBtn").attr("disabled", false);
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
<!-- 카카오api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 페이스북api -->
<div id="fb-root"></div>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.1";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>

<script>

	//도큐멘트 title 값 제목값으로 변경
	 
	
	var newURL = window.location.protocol + window.location.host
			+ window.location.pathname;
	var titletext = '${tipContent[0].tip_title}';	
	
	
	//트위터 공유 
	function twittergo(url, text) {
		//var url = window.location.protocol + window.location.host				+ window.location.pathname;
		var url=document.location.href;
		var text = encodeURI('${tipContent[0].tip_title}');				
		
		window.open("https://twitter.com/intent/tweet?text=" + text + "&url="+ url, "", "width=700, height=400");
	}
	
	var kakaoURL = 'http://192.168.20.35:8080/controller/readSocial.go?seq=186';	
	

	//카카오톡공유 
	Kakao.init('6f7ebead2317edc298ae9592c2996720');	
	function kakaogo(){
		 Kakao.Link.createDefaultButton({
			 container: '#kakao-link-btn',
		      objectType: 'feed',
		      content: {
		        title: '${tipContent[0].tip_title}',
		        description: 'TIP BOARD',
		        imageUrl: 'https://image.ibb.co/cvb5k9/itso_12.png',
		        link: {
		          webUrl: document.location.href,
		          mobileWebUrl: document.location.href
		        }
		      },
		      
		      buttons: [
		        {
		          title: '웹에서보기',
		          link: {
		            mobileWebUrl: document.location.href,
		            webUrl: document.location.href
		          }
		        }  
		      ]
		    });
	}

	//페이스북
	function facebookgo() {
		//var url =  window.location.host + window.location.pathname;
		//var url = document.location.href;
		//var url = 'http://192.168.20.35/controller/main.go'//test용이라 주소 직접 입력해놓음
		var url ='http://192.168.20.35:8080/controller/readSocial.go?seq=186';
		//로컬 호스트로는 페이스북 공유하기 에러가 나서 팀장님 서버로 서비스할때는 두번째 url로 해주세요.
		var encodeUrl = encodeURIComponent(url);
		var facebook = 'https://www.facebook.com/sharer/sharer.php?u=';
		var link = facebook + encodeUrl;
		window.open(link, "", "width=700, height=400");
	}	
	
</script>
</html>