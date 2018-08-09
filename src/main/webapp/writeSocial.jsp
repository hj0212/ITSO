<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
@font-face {
	font-family: 'NanumbarunpenR';
	src: url('resources/fonts/nanumbarunpenr.ttf') format('truetype');
}

@font-face {
	font-family: 'NanumbarunpenB';
	src: url('resources/fonts/nanumbarunpenb.ttf') format('truetype');
}

div {
	/* border: 1px solid black;  */
	box-sizing: border-box;
}

body {
	margin: 0px;
	font-family: 'NanumbarunpenR';
	font-size: 20px;
}

#wrapper {
	width: 100%;
}

#content {
	height: 100vh;
}

#imgfile {
	outline: 2px dashed #92b0b3;
	outline-offset: -10px;
	-webkit-transition: outline-offset .15s ease-in-out, background-color
		.15s linear;
	transition: outline-offset .15s ease-in-out, background-color .15s
		linear;
	padding: 120px 0px 85px 35%;
	text-align: center !important;
	margin: 0;
	width: 100% !important;
}

#imgfile:focus {
	outline: 2px dashed #92b0b3;
	outline-offset: -10px;
	-webkit-transition: outline-offset .15s ease-in-out, background-color
		.15s linear;
	transition: outline-offset .15s ease-in-out, background-color .15s
		linear;
	border: 1px solid #92b0b3;
}

#imgselected {
	visibility: hidden;
	width:50%;
}
</style>
</head>

<body>
	<div id="wrapper" class="container-fluid col-md-8">
		<div class="row">
			<p>인클루드 네비</p>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h2>오늘 뭐 입었어요?</h2>
			</div>
		</div>
		<div class="col-md-12 my-3"></div>

		<div class="col-md-6">
			<form method="post" action="uploadSocialImg.sns" id="uploadform" enctype="multipart/form-data">
				<div class="file-upload">
					<!--   <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add Image</button> -->
					<div class="row">
						<div class="image-upload-wrap form-group my-3 col-md-12">
							<label>-님의 스타일을 보여주세요.</label> 
							<input type="file" name="file" id="imgfile"
								class="file-upload-input form-control z-depth-3 hoverable" onchange="readURL(this);"
								accept="image/*" />
							<!--     <div class="drag-text">
      <h3>Drag and drop a file or select add Image</h3>
    </div> -->
						</div>
					</div>
					<div class="row">
						<div class="file-upload-content col-md-12 my-3">
							<img class="file-upload-image z-depth-1" src="" alt="your image"
								id="imgselected"/>
						</div>
					</div>
					<div class="image-title-wrap col-md-12">
						<div class="row">
							<button type="button" onclick="removeUpload()"
								class="remove-image btn btn-deep-purple">사진 바꾸기</button>
							<button class="btn btn-deep-purple" id="nextbtn" type="button">다음
								단계로</button>
							<button class="btn btn-deep-purple" id="backbtn">취소</button>
						</div>
					</div>
				</div>

			</form>

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

	<script>
	document.oncontextmenu = function(e) {
		return false;
	};
	
		function readURL(input) {
			if (input.files && input.files[0]) {

				var reader = new FileReader();

				reader.onload = function(e) {
					$('.image-upload-wrap').hide();

					$('.file-upload-image').attr('src', e.target.result);
					$('#imgselected').css("visibility", "visible");
					$('.file-upload-content').show();

					$('.image-title').html(input.files[0].name);
				};

				reader.readAsDataURL(input.files[0]);

			} else {
				removeUpload();
			}
		}

		function removeUpload() {
			$('.file-upload-input')
					.replaceWith($('.file-upload-input').clone());
			$('.file-upload-content').hide();
			$('.image-upload-wrap').show();
		}
		$('.image-upload-wrap').bind('dragover', function() {
			$('.image-upload-wrap').addClass('image-dropping');
		});
		$('.image-upload-wrap').bind('dragleave', function() {
			$('.image-upload-wrap').removeClass('image-dropping');
		});
		$("#nextbtn").click(function() {
			 $("#uploadform").submit(); 
			/* $(location).attr('href', 'writeArticle2.jsp'); */
		})
	</script>
</body>
</html>