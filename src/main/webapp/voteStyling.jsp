<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

#voteitemimg {
	width: 100px;
	height: 100px;
}

.imgsel {
	width: 70%;
}
</style>
</head>

<body>
	<div id="wrapper" class="container-fluid col-md-8">
		<div class="row">
			<p>여기는 네비 인클루드</p>
		</div>

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
							id="imgfile0"
							class="file-upload-input form-control z-depth-3 hoverable"
							onchange="readURL(this);" accept="image/*" />
					</div>
				</div>
			</div>
			<hr />

			<div class="row">
				<h4 class="mb-0">투표항목</h4>
				<a class="btn btn-outline-indigo btn-sm waves-effect px-1 py-1"
					id="addvotebtn"> <i class="fa fa-plus i-indigo fa-2x"
					aria-hidden="true"></i>
				</a>

				<div class="md-form form-lg col-md-12 mt-0">
					<ul class="list-unstyled" id="voteul">
						<li class="media"><img class="d-flex mr-3" src="" alt="후보사진">
							<div class="media-body image-upload-wrap form-group">
								<a class="btn btn-outline-indigo btn-sm px-1 py-0 waves-effect ordera">
									<i class="fa fa-sort-asc fa-3x" aria-hidden="true"></i>
								</a> <a
									class="btn btn-outline-indigo btn-sm px-1 py-0 waves-effect ordera">
									<i class="fa fa-sort-desc fa-3x" aria-hidden="true"></i>
								</a> <input type="file" name="imgfilename1" id="imgfile1"
									class="file-upload-inpud form-control z-depth-3 hoverable imgsel"
									onchange="readURL(this);" accept="image/*" />
							</div></li>

						<li class="media my-4"><img class="d-flex mr-3" src=""
							alt="후보사진2">
							<div class="media-body">
								<h5 class="mt-0 mb-1 font-weight-bold"></h5>
							</div></li>
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
						readOnly placeholder="카테고리 항목에 가장 적합한 한 가지를 선택해 주세요.">
				</div>
				<span class="col-md-12">1. 성별</span>
				<!-- Group of default radios - option 1 -->
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample1" name="groupOfDefaultRadios"> <label
						class="custom-control-label" for="defaultGroupExample1">남</label>
				</div>

			</div>
			<div class="row my-2"></div>

			<div class="row">
				<div class="md-form form-lg col-md-12 my-2"></div>
			</div>

			<div class="row">
				<button class="btn btn-deep-purple">itso?</button>
				<a href="#top" class="btn btn-deep-purple ml-auto"><i
					class="fas fa-arrow-up"></i></a>
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

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#voteitemimg').attr('src', e.target.result);
					$('.image-title').html(input.files[0].name);
				};

				reader.readAsDataURL(input.files[0]);

			} else {
				removeUpload();
			}
		}
		$("#addvotebtn").click(function() {
			$('#voteul').append('<li class="media"><img class="d-flex mr-3" src="" alt="후보사진"> <div class="media-body image-upload-wrap form-group">'
						+'<a class="btn btn-outline-indigo btn-sm px-1 py-0 waves-effect ordera">'
						+'<i class="fa fa-sort-asc fa-3x" aria-hidden="true"></i></a>'
						+'<a class="btn btn-outline-indigo btn-sm px-1 py-0 waves-effect ordera">'
						+'<i class="fa fa-sort-desc fa-3x" aria-hidden="true"></i></a>'
						+'<input type="file" name="imgfilename1" id="imgfile1"'
						+'class="file-upload-inpud form-control z-depth-3 hoverable imgsel"'
						+'onchange="readURL(this);" accept="image/*" </div></li>');						
		})
	</script>

</body>
</html>