<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--   ---------CDN 모음 ------------------------------------------  -->
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   ---------CDN 모음 끝------------------------------------------  -->
<style>
div {
	/* border: 1px solid black; */
	box-sizing: border-box;
}

body {
	margin: 0px;
	font-family: 'NanumbarunpenR';
	font-size: 20px;
}

@font-face {
	font-family: 'NanumbarunpenR';
	src: url('resources/fonts/nanumbarunpenr.ttf') format('truetype');
}

@font-face {
	font-family: 'NanumbarunpenB';
	src: url('resources/fonts/nanumbarunpenb.ttf') format('truetype');
}

#wrapper {
	width: 100%;
}

#voteitemimg {
	width: 10%;
}

#voteitemdiv {
	width: 100%;
}

img {
	border: 0.3px solid lightgray;
	text-align: center;
	vertical-align: middle;
}

input[type="file"] {
	border: 0px;
}

.imgsel {
	width: 70%;
}

.btnsdiv a {
	box-shadow: 0px;
	width: 10%;
}

#MOVE_TOP_BTN {
	position: fixed;
	right: 5%;
	width: 50px;
	bottom: 100px;
	display: none;
	z-index: 999;
	background-color: black;
	color: white;
	text-align: center;
}

.media-img {
	
}
</style>

</head>


<body>
	<%@include file="navi.jsp"%>
	<div class="row my-5"></div>
	<div id="wrapper" class="container-fluid col-md-8">
		<h4>
			투표
			<script>
				console.log("${sessionScope.user.seq}");
			</script>
			<script>
				console.log("${votedto.styling_writer}");
			</script>
			<script>
				console.log("투표여부:${didVote}");
			</script>

			<c:if test="${sessionScope.user.seq eq votedto.styling_writer}">
				<button class="btn btn-indigo btn-md float-right" type="button"
					id="modibtn">글 수정</button>
				<button class="btn btn-indigo btn-md float-right" type="button"
					id="delbtn">글 삭제</button>
			</c:if>

			<c:choose>
				<c:when test="${didVote eq 0}">
					<button class="btn btn-indigo btn-md float-right" type="button"
						id="votebtn">투표하기</button>
				</c:when>
				<c:when test="${didVote >= 1}">
					<button class="btn btn-indigo btn-md float-right" type="button"
						id="votebtn" disabled>투표완료</button>
				</c:when>
			</c:choose>
		</h4>
		<input type="hidden" id="sequenceId"
			value="${votedto.styling_vote_seq}">

		<hr />
		<div class="row my-2">
			<div class="md-form form-lg col-4 mx-0">
				<img class="d-flex" src="upload/stylingvote/${votedto.photo}"
					alt="사진 없음" id="votetitleimg" style="width: 100%">
			</div>
			<div class="md-form form-lg col-7 offset-md-5 mx-0">
				<h4>투표주제: ${votedto.styling_title}</h4>
				<h6>작성자: ${votedto.styling_writername}</h6>
				<p>" ${votedto.styling_contents} "</p>
			</div>
		</div>


		<div class="row my-2">
			<hr />
		</div>
		<div class="row">
			<div class="md-form form-lg col-md-12 my-2">
				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col" style="width: 10%">번호</th>
							<th scope="col" style="width: 70%">아이템 소개</th>
							<th scope="col" style="width: 20%">결과</th>
						</tr>
					</thead>
					<tbody id="itemlist">
						<c:forEach var="svitemdto" items="${voteitems}" varStatus="status">
							
							
							<tr>
								<th scope="col">
									<div class="custom-control custom-radio"
										id="test${status.index}">
										<input type="radio" class="custom-control-input"
											id="defaultGroupExample${status.index}"
											name="styling_votesel"
											value="${svitemdto.styling_vote_item_seq}"> <span
											class="custom-control" for="test${status.index}"> </span> <label
											class="custom-control-label"
											for="defaultGroupExample${status.index}"> </label>
									</div>
								</th>
								<td>
									<div class="media">
										<div class="media-img col-5">
											<img
												class="d-flex align-self-center mr-3 selimg z-depth-3 hoverable"
												style="width: 90%"
												src="upload/stylingvote/${svitemdto.styling_vote_item_photo}"
												alt="후보사진">
										</div>

										<div class="media-body image-upload-wrap form-group col-5"
											id="btnsdiv">

											<div class="md-form form-sm">
												<p>${svitemdto.styling_vote_item_contents}</p>
											</div>
										</div>
									</div>
								</td>
								<td>
								
									<div class="progress">
										<div class="progress-bar" style="width:${voteresults[status.index].eachrate}%" role="progressbar" aria-valuenow="0"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div><a>${voteresults[status.index].eachrate} %</a> <br>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
		<div class="row">--</div>

		<div class="col-md-2 offset-md-10">
			<a id="MOVE_TOP_BTN" href="#"><i class="fa fa-arrow-up my-1"
				aria-hidden="true"></i></a>
		</div>
	</div>
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
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		document.oncontextmenu = function(e) {
			return false;
		};

		/* $('.gobtn').click(function() {
			var seq = $(this).next('input').val();
			location.href = "readStylingVote.jsp?voteseq=" + seq;
		}) */

		$('#votebtn').click(function() {
			
			if(${sessionScope.user.seq == null}){
				location.href="login.go";
			}
			var voteval = $('input[name ="styling_votesel"]:checked').val();
			console.log("후보선택 : "+voteval);
			if(voteval !=null){
				$.ajax({
					method : "POST",
					url : "doStylingVote.ajax",			
					data : {
						value : voteval,
						styling_vote_seq : $('#sequenceId').val()
					},
					error : function() {
						alert("다시 시도해 주세요");
					},
					success : function(data) {
						console.log("AJAX 투표 성공");
						$('#votebtn').attr("disabled", true);
						$('#votebtn').text("투표 완료");
						$('input[type="radio"]').attr("disabled",true);
						location.href="readStylingVote.style?styling_vote_seq="+styling_vote_seq;
					}
				});
			}else if(voteval == null){
				alert("투표할 항목을 선택해 주세요.");
			}		
		});
		
		$('#delbtn').click(function(){
			var delvote =confirm("글을 삭제하시겠습니까?");
			if(delvote){
				location.href="deleteStylingVote.style?styling_vote_seq=${votedto.styling_vote_seq}";
			}
		})
		
		$('#modibtn').click(function(){
			location.href="modifyStylingVote.go?styling_vote_seq=${votedto.styling_vote_seq}";
			console.log("${votedto.styling_vote_seq}번글 수정으로 go");
		})

		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 500) {
					$('#MOVE_TOP_BTN').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();
				}
			});

			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>
</body>
</html>