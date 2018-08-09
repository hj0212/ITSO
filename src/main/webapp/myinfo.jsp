<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style>
@font-face {
	font-family: 'NanumbarunpenR';
	src: url('nanumbarunpenr.ttf') format('truetype');
}

@font-face {
	font-family: 'NanumbarunpenB';
	src: url('nanumbarunpenb.ttf') format('truetype');
}

body {
	font-family: 'NanumbarunpenB';
	margin: 0px;
}

#wrapper {
	width: 350px;
	margin: 0 auto;
}

#imagearea img {
	width: 200px;
	height: 200px;
}
</style>

<script>
	$(document).ready(function() {

		/* $("#profileImage").attr('src',"/WEB_06_18/file/${file_name}"); */
		$("#imgbtn").click(function() {
			$("#img_file").trigger("click");
			$("#img_file").on('change', function() {
				console.log($("input[type=file]").val());
				$("#profileImageForm").submit();
			})
		});
	});
</script>
</head>

<body>
	<%@include file="navi.jsp"%>
	<div id="wrapper" class="mt-5">
		<div class="card">
			<!-- Card content -->
			<div class="card-body">

				<!-- Title -->
				<h4 class="card-title" style="text-align: center;">
					<a>회원 정보 변경</a>
				</h4>
				<div class="mb-3 text-center" id="imagearea">
					<form action="editProfileImg.do" method="post"
						enctype="multipart/form-data" id="profileImageForm">
						<img id="profileImage" src="/upload/${sessionScope.user.photo}"
							class="img-fluid z-depth-1 rounded-circle mb-1"
							alt="Responsive image"> <br>
						<button id="imgbtn" for="img_file" type="button"
							class="btn btn-mdb-color btn-sm">프로필 사진 변경</button>
						<input type="file" id="img_file" name="file"
							accept=".gif, .jpg, .png, .jpeg" value="이미지변경" hidden="true">
					</form>
				</div>
				<div class="md-form">
					<input type="text" id="inputMDEx" class="form-control"
						value="${sessionScope.user.email }" readonly> <label for="inputMDEx">email</label>
				</div>
				<form action="editProfile.do" method="post">
					<div class="md-form">
						<input type="text" id="inputMDEx" class="form-control"> <label
							for="inputMDEx" placeholder="비밀번호를 입력하세요">비밀번호</label>
					</div>
					<div class="md-form">
						<input type="text" id="inputMDEx" class="form-control"> <label
							for="inputMDEx" value="${sessionScope.user.name }">이름</label>
					</div>
					<div class="md-form">
						<textarea type="text" id="form7" class="md-textarea form-control"
							rows="3">${sessionScope.user.state }</textarea>
						<label for="form7">상태메시지</label>
					</div>
					<div class="md-form">
						<input type="text" id="inputMDEx" class="form-control"> <label
							for="inputMDEx" value="${sessionScope.user.age }">나이</label>
					</div>
					<div id="btnarea text-center">
						<button class="btn btn-indigo">수정</button>
						<button type="button" class="btn btn-blue-grey">취소</button>
					</div>
				</form>
				<!-- Button -->

			</div>

		</div>
	</div>
</body>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>

</html>