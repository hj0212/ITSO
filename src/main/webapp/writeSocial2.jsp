<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--   ---------CDN 모음 ------------------------------------------  -->

<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

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
	
	<!-- <script type="text/javascript" src="js/jquery.taggd.js"> -->
<!--   ---------CDN 모음 끝------------------------------------------  -->
<!-- 우클릭 방지 -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	document.oncontextmenu = function(e) {
		return false;
	};
	
	imgPath = "upload/social/${sfileName}";
	
/* 	var data = [];
	var settings = [];

	$(window).load(function() {
	$('.taggd').each(function(i, e) {
	var $e = $(e);

	$e.taggd(settings[i]);
	$e.taggd('items', data[i])
	});
	

	});
 */
</script>



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
	/* border: 1px solid black; */
	box-sizing: border-box;
}

body {
	margin: 0px;
	font-family: 'NanumbarunpenR';
	font-size: 20px;
}

#wrapper {
	width: 100%;
	height: 100vh;
}

#content {
	height: 100vh;
}

.interactive-image {
	background: url("style1-2.jpg");
}	
#imgstyle{
	width:50%;
}

</style>
<title>Write Article</title>
</head>

<body>
	<div id="wrapper" class="container-fluid col-md-8">
		<div class="row">
			<p>여기는 네비 인클루드</p>
		</div>
		<form>
			<div class="row" name="top">
				<div class="md-form form-lg col-md-12">
					<input type="text" id="stylename"
						class="form-control form-control-lg"> <label
						for="stylename" class="ml-3">스타일 이름을 정해주세요.</label>
				</div>
			</div>
			<div class="row">
				<div class="md-form form-lg col-md-6">
					<input type="text" id="inputLGEx"
						class="form-control form-control-lg" readOnly> <label
						for="inputLGEx" class="ml-3">공유하고 싶은 아이템에 태그를 달아주세요.</label>
					<div class="interactive-image" id="planit"
						data-toggle="modal" data-target="#styletag">
						<img class="taggd z-depth-3" src="upload/social/${sfileName}" alt="photo" id="imgstyle"/>
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="md-form form-lg col-md-12">
					<i class="fas fa-pencil-alt"></i>
					<textarea type="text" id="textareaPrefix"
						class="form-control md-textarea" rows="3"></textarea>
					<label for="textareaPrefix" class="ml-3">스타일을 소개해 주세요.</label>
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
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample2" name="groupOfDefaultRadios" checked>
					<label class="custom-control-label" for="defaultGroupExample2">여</label>
				</div>
				<!-- Group of default radios - option 3 -->
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample3" name="groupOfDefaultRadios"> <label
						class="custom-control-label" for="defaultGroupExample3">남,여</label>
				</div>
			</div>
			<div class="row my-2"></div>

			<div class="row">
				<span class="col-md-12">2. 나이</span>

				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample4" name="DefaultRadios"> <label
						class="custom-control-label" for="defaultGroupExample4">10
						대</label>
				</div>
				<!-- Group of default radios - option 3 -->
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample5" name="DefaultRadios" checked> <label
						class="custom-control-label" for="defaultGroupExample5">20
						대</label>
				</div>
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample6" name="DefaultRadios"> <label
						class="custom-control-label" for="defaultGroupExample6">30
						대</label>
				</div>
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample7" name="DefaultRadios"> <label
						class="custom-control-label" for="defaultGroupExample7">40
						대</label>
				</div>
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample8" name="DefaultRadios"> <label
						class="custom-control-label" for="defaultGroupExample8">기타(10세
						이하/50세 이상)</label>
				</div>
			</div>
			<div class="row">
				<div class="md-form form-lg col-md-12 my-2"></div>
			</div>

			<div class="row">
				<button class="btn btn-deep-purple">itso?</button>
				<a href="#top" class="btn btn-deep-purple ml-auto"><i
					class="fas fa-arrow-up"></i></a>
			</div>
		</form>
		<!-- MODAL -->
<!-- 		<div class="modal fade" id="styletag" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<form>
					<div class="modal-content">
						<div class="modal-header text-center">
							<h4 class="modal-title w-100 font-weight-bold">아이템 태그 설명</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body mx-3">
							<div class="md-form mb-4">
								<i class="prefix grey-text"></i> <input type="text" id="form3"
									class="form-control validate"> <label
									data-error="wrong" data-success="right" for="form3">아이템
									이름</label>
							</div>

							<div class="md-form mb-4">
								<i class="prefix grey-text"></i> <input type="text" id="form4"
									class="form-control validate"> <label
									data-error="wrong" data-success="right" for="form4">브랜드
									이름/매장 이름</label>
							</div>

							<div class="md-form mb-4">
								<i class="prefix grey-text"></i> <input type="text" id="form5"
									class="form-control validate"> <label
									data-error="wrong" data-success="right" for="form5">URL</label>
							</div>

						</div>
						<div class="modal-footer d-flex justify-content-center">
							<button class="btn btn-indigo">추가하기</button>
						</div>
					</div>
				</form>
			</div>
		</div> -->

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

	<script>
 /* 	var image = $("#imgstyle");
	 document.getElementById('imgstyle'); 
	var options = {};
	var data = [
		  Taggd.Tag.createFromObject({
		    position: { x: 0.19, y: 0.4 },
		    text: 'This is a tree',
		  }),
		  Taggd.Tag.createFromObject({
		    position: { x: 0.5, y: 0.3 },
		    text: 'Pretty sure this is also a tree',
		  }),
		  Taggd.Tag.createFromObject({
		    position: { x: 0.775, y: 0.5 },
		    text: 'Can you guess this one?',
		  }),
		];

		var taggd = new Taggd(image, options, data);  */
</script>
</body>

</html>