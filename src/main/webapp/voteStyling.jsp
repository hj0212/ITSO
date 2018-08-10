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
	border: 1px solid black;
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

#imgfile {
	visibility: hidden;
}
</style>
</head>

<body>
	<div id="wrapper" class="container-fluid col-md-8">
		<div class="row">
			<p>여기는 네비 인클루드</p>
		</div>

		<form method="post">
			<div class="row" name="top">
				<div class="md-form form-lg col-md-12">
					<input type="text" id="votetitleid"
						class="form-control form-control-lg col-md-9 float-right">
					<label for="votetitleid" class="offset-md-3">투표 주제를 입력해주세요.</label>
					<div class="file-upload-content col-md-12 my-3">
						<img class="file-upload-image z-depth-1" src="" alt="your image"
							id="imgselected"/>
					</div>
					<div>
						<input type="file" name="file" id="imgfile" class="file-upload-input form-control z-depth-3 hoverable out"
							onchange="readURL(this);" accept="image/*" />
						<button type="button" id="addimgbtn"
							class="btn btn-outline-indigo btn-sm wave-effect">이미지
							첨부하기</button>
					</div>
				</div>

			</div>
			<div class="row"></div>

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

			<div class="row"></div>
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
		$("#addimgbtn").click(function() {
			$("#imgfile").trigger("click");
		})
	</script>
</body>
</html>