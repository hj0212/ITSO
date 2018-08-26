<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Styling 게시판 투표 글쓰기</title>
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

#voteitemimg, .selimg {
	width: 100px;
	height: 100px;
}

.imgsel {
	width: 70%;
}

.btnsdiv a {
	box-shadow: 0px;
	width: 10%;
}
</style>

</head>


<body>
	<%@include file="navi.jsp"%>
	<div class="row my-5"></div>
	<div id="wrapper" class="container-fluid col-md-8">

		<script>
			var count = 1;
		</script>
		<div class="row my-2"></div>
		<form method="post" action="modifyStylingVote.style?styling_vote_seq=${votedto.styling_vote_seq}" id="modiform" enctype="multipart/form-data">
			<div class="row z-depth-3 hoverable" id="toprow">
				<h4>투표주제</h4>
			<input type="hidden" name="styling_vote_seq" value="${votedto.styling_vote_seq}">
				<div class="md-form form-lg col-md-12 file-upload mt-0">
					<div class="md-form form-md form-group">
						<input type="text" id="votetitleid" name="styling_title"
							class="form-control col-md-9 float-right" value="${votedto.styling_title}"> <label
							for="votetitleid" class="offset-md-3 my-0 font-weight-bold"
							id="votelabel">투표 주제를 입력해주세요.</label>
					</div>
					<div class="md-form form-md form-group">
						<input type="text" id="votecontentsid"
							name="styling_contents" value="${votedto.styling_contents}"
							class="form-control col-md-9 float-right"
							placeholder="내용을 입력해주세요.">
					</div>
					<div class="media-body image-upload-wrap form-group"
						id="voteitemdiv">
						<img class="d-flex file-upload-image" src="upload/stylingvote/${votedto.photo}" alt="사진 없음"
							id="voteitemimg"> <input type="file" name="titlefile"
							id="imgfile0" onchange="readURL(this);"
							class="file-upload-input form-control" accept="image/*" />
							<input type="hidden" name="photo" value="${votedto.photo}"/>
					</div>
				</div>
			</div>
			<hr />

			<div class="row">
				<h4 class="mb-0">투표항목</h4>
				
				<a class="btn btn-outline-indigo btn-sm waves-effect px-0 py-0"
					id="addvotebtn"> <i class="fa fa-plus i-indigo fa-1x"
					aria-hidden="true"></i>
				</a>
				<div class="md-form form-lg col-md-12 mt-0">
					<table class="table table-borderless">
						<thead>
							<tr>
								<th scope="col">seq</th>
								<th scope="col">img</th>
							</tr>
						</thead>
						<tbody id="itemlist">
						<c:forEach var="item" items="${voteitems}">
							<tr class="z-depth-3 hoverable">
								<th scope="row">
								<input type="text" name="styling_vote_item_seq" value="${item.styling_vote_item_seq}"></th>
								<td>
									<div class="media">
										<div class="media-img">
										<c:set var="itemphoto" value="${item.styling_vote_item_photo}"/>
										<c:set var="leng" value="${fn:length(itemphoto)}"/>
										
											<img class="d-flex mr-3 selimg" src="upload/stylingvote/${item.styling_vote_item_photo}" alt="후보사진"> <input
												type="file" name="voteimgfile[]" id="imgfile1"
												class="file-upload-input form-control filesel"
												onchange="readURL(this);" accept="image/*">
										</div>

										<div class="media-body image-upload-wrap form-group"
											id="btnsdiv">
											<a class="upvotebtn"> <i
												class="fa fa-arrow-circle-o-up indigo-text fa-1x"
												aria-hidden="true"></i>
											</a> <a class="downvotebtn"> <i
												class="fa fa-arrow-circle-o-down fa-1x indigo-text"
												aria-hidden="true"></i>
											</a> <a class="delvotebtn"> <i
												class="fa fa-minus fa-1x indigo-text" aria-hidden="true"></i>
											</a><br>
											<div class="md-form form-sm">
												<input type="text" id="vitemtext" class="form-control" name="styling_vote_item_contents[]" value="${item.styling_vote_item_contents}">
												<label for="vitemtext">아이템의 특징을 간단히 적어주세요.</label>
											</div>
										</div>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


			<div class="row">

				<!-- <input type="text" id="cate" class="form-control form-control-lg"
						readOnly placeholder="종료방법"> -->
				<h4>종료방법</h4>

				<span class="col-md-12"></span>
				<!-- Group of default radios - option 1 -->
				<!-- 	<div class="col-md-12 ml-5"> -->
				<div class="col custom-control custom-radio col-md-3  ml-2">
					<input type="radio" class="custom-control-input"
						name="styling_endsel" id="defaultGroupExample1" value="1">
					<label class="custom-control-label" for="defaultGroupExample1">기간</label><i
						class="fa fa-calendar" aria-hidden="true">:</i>
				</div>
				<div class="col">
					<input type="text" id="datepicker" name="styling_endterm" disabled
						class="form-control form-control-sm col-md-4" value="${votedto.styling_endterm}">
				</div>
			</div>
			<!-- </div> -->
			<div class="row" id="voterrow">
				<div class="col custom-control custom-radio col-md-3  ml-2">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample2" name="styling_endsel" value="2">
					<label class="custom-control-label" for="defaultGroupExample2">참여자수:</label>

				</div>
				<div class="col">
					<input type="text" class="form-control form-control-sm col-md-4"
						readOnly id="votenum" placeholder="명" name="styling_voternum" value="${votedto.styling_voternum}">
				</div>

			</div>
			<div class="row">
				<div class="custom-control custom-radio col-md-12 ml-2">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample3" name="styling_endsel" value="3">
					<label class="custom-control-label" for="defaultGroupExample3">종료
						없음</label>
				</div>
			</div>
			<input type="hidden" name="styling_end" id="radioresult">
			<div class="row my-2"></div>

			<div class="row">
				<div class="md-form form-lg col-md-12 my-2"></div>
			</div>

			<div class="row">
				<button class="btn btn-indigo" type="button" id="itsobtn">itso?</button>
				<a href="#top" class="btn btn-indigo ml-auto"><i
					class="fa fa-arrow-up" aria-hidden="true"></i></a>
			</div>
		</form>
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
		
		
		/* $('.file-upload-input').attr('onchange',onChange()); */
		/* function onChange()
		onchange="readURL(this);" */

		function readURL(input) {
			console.log(input.id);
			console.log(input.files[0].name);
			var inputId = input.id;
			console.log(document.getElementById(inputId));
			var imageId = document.getElementById(inputId).parentElement.children[0];

			console.log(imageId);
			var imagesrc = imageId.src;
			console.log(imagesrc);
			/*  console.log(imageId.src); */
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					imageId.src = e.target.result;
					/* imagesrc = e.target.result; */
					$('.image-title').html(input.files[0].name);
				};
				reader.readAsDataURL(input.files[0]);
			}else {
				removeUpload();
			}
		}
		count = 1;
		$("#addvotebtn")
				.on(
						"click",
						function() {
							if (count < 6) {
								count++;
								console.log(count);
								$('#itemlist')
										.append(
												'<tr class="z-depth-3 hoverable"><th scope="row">'
														+ count
														+ '</th>'
														+ '<td><div class="media"><div class="media-img"><img class="d-flex mr-3 selimg" src="" alt="후보사진">'
														+ '<input type="file" name="voteimgfile[]" id="imgfile'
														+ count
														+ '" class="file-upload-input form-control filesel"'
														+ 'onchange="readURL(this);" accept="image/*"></div>'
														+ '<div class="media-body image-upload-wrap form-group" id="btnsdiv">'
														+ '<a class="upvotebtn"> <i class="fa fa-arrow-circle-o-up indigo-text fa-1x" aria-hidden="true"></i></a>'
														+ '<a class="downvotebtn"> <i class="fa fa-arrow-circle-o-down fa-1x indigo-text" aria-hidden="true"></i></a>'
														+ '<a class="delvotebtn"> <i class="fa fa-minus fa-1x indigo-text" aria-hidden="true"></i></a><br>'
														+ '<div class="md-form form-sm"><input type="text" id="vitemtext'+count+'" class="form-control" name="styling_vote_item_contents[]"><label for="itemtext'+count+'">아이템의 특징을 간단히 적어주세요.</label>'
														+ '</div></div></div></td></tr>');
							} else if (count == 6) {
								alert("투표 항목은 6개까지 추가할 수 있습니다.")
							}
						})

		$(document).on('click', '.delvotebtn', function() {
			var wraptr = $(this).closest("tr");
			$(this).closest("tr").remove();
			count--;
			/* var arr = wraptr.nextAll('tr').children('th');
			for(i=0 i<arr.size i++){
				arr 이거... 해야됨 ㅋㅋㅋㅋ 지우면 숫자 안바뀜
			} */
		})

		$(document).on('click', '.upvotebtn', function() {
			var wraptr = $(this).closest('tr');
			var wrapprev = $(this).closest('tr').prev('tr');
			var number = parseInt($(this).closest('td').siblings('th').text());
			wraptr.insertBefore(wraptr.prev());
		/* 	if (number > 1) {
				wrapprev.children('th').text(number);
				$(this).closest('td').siblings('th').text(number - 1);
			} */
		})

		$(document).on('click', '.downvotebtn', function() {
			var wraptr = $(this).closest('tr');
			var wrapnext = $(this).closest('tr').next('tr');
			var number = parseInt($(this).closest('td').siblings('th').text());
			wraptr.insertAfter(wraptr.next());
			/* wrapnext.children('th').text(number);
			if (number < count) {
				$(this).closest('td').siblings('th').text(number + 1);
			} */
		})

		$(document).on('click', '.custom-control-input', function() {
			if ($(this).val() == 2) {
				$('#votenum').attr('readOnly', false);
				$("#datepicker").attr('disabled',true);
			} else if ($(this).val() == 1) {
				$('#votenum').attr('readOnly', true);
				$("#datepicker").attr('disabled',false);
				$(function() {
					$("#datepicker").datepicker();
				});
			}else{
				$('#votenum').attr('readOnly', true);
				$("#datepicker").attr('disabled',true);
			}
		})
		
		$('#itsobtn').click(function(){
			var radioval = $('input[name = "styling_endsel"]:checked').val();
			console.log(radioval);
			$('#radioresult').val(radioval);
			console.log($('input[name = "styling_end"]').val());
			$('#modiform').submit();
		})
		
	</script>

</body>
</html>