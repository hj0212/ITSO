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
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>

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

.btn-itso {
	background-color: #1B0946;
	color: white;
}
</style>

<script> 
	$(document).ready(function() {
		$("#imgbtn").click(function() {
			$("#img_file").trigger("click");
			$("#img_file").on('change', function() {
				console.log($("input[type=file]").val());
				$("#profileImageForm").submit();
			})
		});
		
		$("#backbtn").click(function() {
			location.href = "userpage.go";
		})
		
		$("#modibtn").click(function() {
			var pw = $("#pw").val();
			var name = $("#name").val();
			var state = $("#state").val();
			var age = $("#age").val();
			
			if(pw == "") {
				alert("비밀번호를 입력하세요.")
			} else if(name == "") {
				alert("이름을 입력하세요.")
			} else if(state == "") {
				alert("상태메시지를 입력하세요.")
			} else if(age == "") {
				alert("나이를 입력하세요.")
			}
		})
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
						<img id="profileImage" src="/upload/profile/${sessionScope.user.photo}"
							class="img-fluid z-depth-1 rounded-circle mb-1"
							alt="Responsive image"> <br>
						<button id="imgbtn" for="img_file" type="button"
							class="btn btn-mdb-color btn-sm">프로필 사진 변경</button>
						<input type="file" id="img_file" name="file"
							accept=".gif, .jpg, .png, .jpeg" value="이미지변경" hidden="true">
					</form>
				</div>
				<div class="md-form">
					<input type="text" id="email" class="form-control"
						value="${sessionScope.user.email }" readonly> <label for="email">email</label>
				</div>
				<form action="editProfile.do" method="post">
					<div class="md-form">
						<input type="text" id="pw" class="form-control" name="pw"> <label
							for="pw" placeholder="비밀번호를 입력하세요">비밀번호</label>
					</div>
					<div class="md-form">
						<input type="text" id="name" class="form-control" value="${sessionScope.user.name }" name="name"> <label
							for="name">이름</label>
					</div>
					<div class="md-form">
						<input type="text" id="state" class="form-control" value="${sessionScope.user.state }" name="state"> <label
							for="state">상태메시지</label>
					</div>
					<div class="md-form">
						<input type="text" id="age" class="form-control"  value="${sessionScope.user.age }" name="age"> <label
							for="age">나이</label>
					</div>
					<div id="btnarea text-center">
						<button type="button" id="modibtn" class="btn btn-itso">수정</button>
						<button type="button" id="backbtn" class="btn btn-mdb-color">취소</button>
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