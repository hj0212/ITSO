<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	width: 20%;
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
	<div id="wrapper" class="container-fluid col-md-8">
		<div class="row">
			<p>여기는 네비 인클루드</p>
		</div>
		<script>
		var count =1;
		</script>

		<form method="post" action="voteStyle.style" id="voteform"
			enctype="multipart/form-data">
			<div class="row" name="top">
				<h4>투표주제</h4>
				<div class="md-form form-lg col-md-12 px-0 file-upload mt-0">
					<input type="text" id="votetitleid" name="styling_vote_title"
						class="form-control form-control-lg col-md-9 float-right">
					<label for="votetitleid" class="offset-md-3 my-0 font-weight-bold"
						id="votelabel">투표 주제를 입력해주세요.</label>
					<div class="media-body image-upload-wrap form-group"
						id="voteitemdiv">
						<img class="d-flex file-upload-image" src="" alt="사진 없음"
							id="voteitemimg"> <input type="file" name="imgfilename0"
							id="imgfile0" onchange="readURL(this);"
							class="file-upload-input form-control z-depth-3 hoverable"
							accept="image/*" />
					</div>
				</div>
			</div>
			<hr />

			<div class="row">
				<h4 class="mb-0">투표항목</h4>
				<a class="btn btn-outline-indigo btn-sm waves-effect px-0 py-0"
					id="addvotebtn"> <i class="fa fa-plus i-indigo fa-2x"
					aria-hidden="true"></i>
				</a>

				<div class="md-form form-lg col-md-12 mt-0">
					<ul class="list-unstyled" id="voteul">
						<li class="media">
							<div class="media-img">
								<img class="d-flex mr-3 selimg" src="" alt="후보사진"> <input
									type="file" name="imgfilename"
									class="file-upload-input form-control z-depth-3 hoverable filesel"
									onchange="readURL(this);" accept="image/*">
							</div>

							<div class="media-body image-upload-wrap form-group" id="btnsdiv">
								<a class="upvotebtn"> <i
									class="fa fa-arrow-circle-o-up indigo-text fa-1x"
									aria-hidden="true"></i>
								</a> <a class="downvotebtn"> <i
									class="fa fa-arrow-circle-o-down fa-1x indigo-text"
									aria-hidden="true"></i>
								</a> <a class="delvotebtn"> <i
									class="fa fa-minus fa-1x indigo-text" aria-hidden="true"></i>
								</a>
							</div>
						</li>
					</ul>
					<!-- <div>
						<input type="file" name="file" id="imgfile1"
							class="file-upload-input form-control z-depth-3 hoverable imgsel"
							onchange="readURL(this);" accept="image/*" />
						<button type="button" id="addimgbtn"
							class="btn btn-outline-indigo btn-sm wave-effect">이미지
							첨부하기</button>
					</div> -->
				</div>
			</div>

			<div class="row">
				<div class="md-form form-lg col-md-12">
					<input type="text" id="cate" class="form-control form-control-lg"
						readOnly placeholder="종료방법">
				</div>
				<span class="col-md-12"></span>
				<!-- Group of default radios - option 1 -->
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample1" name="groupOfDefaultRadios"> <label
						class="custom-control-label" for="defaultGroupExample1">기간</label>
				</div>
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample2" name="groupOfDefaultRadios"> <label
						class="custom-control-label" for="defaultGroupExample2">참여자수</label>
				</div>
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample3" name="groupOfDefaultRadios"> <label
						class="custom-control-label" for="defaultGroupExample3">종료
						없음</label>
				</div>

			</div>
			<div class="row my-2"></div>

			<div class="row">
				<div class="md-form form-lg col-md-12 my-2"></div>
			</div>

			<div class="row">
				<button class="btn btn-deep-purple">itso?</button>
				<a href="#top" class="btn btn-deep-purple ml-auto"><i
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
			 var inputId =input.id;
			 console.log(document.getElementById(inputId));
			 var imageId = document.getElementById(inputId).parentNode.firstChild;
		/* 	 console.log(document.getElementById(imageId)); ->null나옴 */
		
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

			} else {
				removeUpload();
			}
		}

		$("#addvotebtn")
				.on(
						"click",
						function() {	
							count++;
							console.log(count);
							$('#voteul')
									.append(
											'<li class="media"> <div class="media-head"><p>'+count+'.</p>'
													+ '<img class="d-flex mr-3 selimg" src="" alt="후보사진">'
													+ '<input type="file" name="imgfilename" id="imgfile'+count
													+ '" class="file-upload-input form-control z-depth-3 hoverable imgsel"'
													+ '	onchange="readURL(this);" accept="image/*" /> </div>'
													+ '<div class="media-body image-upload-wrap form-group" id="btnsdiv">'
													+ '<a class="upvotebtn"> <i class="fa fa-arrow-circle-o-up indigo-text fa-1x" aria-hidden="true"></i></a>'
													+ '<a class="downvotebtn"> <i class="fa fa-arrow-circle-o-down fa-1x indigo-text" aria-hidden="true"></i></a>'
													+ '<a class="delvotebtn"> <i class="fa fa-minus fa-1x indigo-text" aria-hidden="true"></i></a></div><li>');
													+ '<input type="text" "name="styling_item_image"'
													+'class="form-control form-control-lg col-md-9 float-right">'
													+'<label for="votetitleid" class="offset-md-3 my-0 font-weight-bold"'
													+'	id="votelabel">아이템에 대해 간단히 입력해주세요.</label>'
						})

		$(document).on('click', '.delvotebtn', function() {
			$(this).closest("li").remove();
		})

		$(document).on('click', '.upvotebtn', function() {
			var wrapper = $(this).closest('li');
			wrapper.insertBefore(wrapper.prev());
		})
		
		$(document).on('click', '.downvotebtn', function() {

			var wrapper = $(this).closest('li');
			wrapper.insertAfter(wrapper.next());
		})
	</script>

</body>
</html>