<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@font-face {
	font-family: 'NanumbarunpenR';
	src: url('resources/fonts/nanumbarunpenr.ttf') format('truetype');
}

@font-face {
	font-family: 'NanumbarunpenB';
	src: url('resources/fonts/nanumbarunpenb.ttf') format('truetype');
}

body {
	font-family: 'NanumbarunpenR';
	margin: 0px;
}

nav {
	background-color: #1B0946;
	font-size: large;
}

#logo {
	width: 50px;
}

.btn-itso {
	background: #1B0946;
	color: white;
}

.btn-outline-itso {
	border: 2px solid #1B0946;
	background: white;
	color: #1B0946;
}

/* 알림 */
.notification-heading {
	height: 30px;
	line-height: 30px;
}

.notification-heading .heading-left {
	text-align: left;
	padding-left: 20px;
	float: left;
}

.notification-heading .heading-right {
	text-align: right;
	padding-right: 20px;
	float: right;
}

.notification-list .notification-item {
	display: grid;
	grid-template-columns: 1fr 2fr;
	padding-top: 5px;
}

.user-name {
	color: #1B0946;
}

.user-image {
	border-radius: 50%;
	width: 50px;
}

.user-content {
	font-size: 15px;
}

@media ( max-width : 575px) {
	.notification-info {
		border-radius: 5px;
		box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1);
		color: #27303d;
		min-width: 300px;
		top: 200px;
		right: auto;
		left: 150px;
		transform: translate(-50%, 0);
		position: absolute;
		box-sizing: border-box;
		display: none;
		background-color: #fff;
		z-index: 1000;
	}
}

@media ( min-width : 576px) {
	.notification-info {
		border-radius: 5px;
		box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1);
		color: #27303d;
		min-width: 300px;
		top: 61px;
		right: 0;
		left: auto;
		transform: translate(-50%, 0);
		position: absolute;
		box-sizing: border-box;
		display: none;
		background-color: #fff;
		z-index: 1000;
	}
}

.notification-item:hover {
	background: #e9e9e9;
}

.img-left {
	text-align: center;
}

@media ( min-width : 400px) {
	.navbar-expand-ssm {
		-ms-flex-flow: row nowrap;
		flex-flow: row nowrap;
		-ms-flex-pack: start;
		justify-content: flex-start;
	}
	.navbar-expand-ssm .navbar-nav {
		-ms-flex-direction: row;
		flex-direction: row;
	}
	.navbar-expand-ssm .navbar-nav .dropdown-menu {
		position: absolute;
	}
	.navbar-expand-ssm .navbar-nav .nav-link {
		padding-right: 0.5rem;
		padding-left: 0.5rem;
	}
	.navbar-expand-ssm>.container, .navbar-expand-ssm>.container-fluid {
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap;
	}
	.navbar-expand-ssm .navbar-collapse {
		display: -ms-flexbox !important;
		display: flex !important;
		-ms-flex-preferred-size: auto;
		flex-basis: auto;
	}
	.navbar-expand-ssm .navbar-toggler {
		display: none;
	}
	@media ( min-width : 768px) {
		#searchinput {
			margin: 0px auto;
			display: inline;
		}
	}
	#searchIcon {
		size: 30px;
		cursor: pointer;
		position: inherit;
	}
}
</style>

<nav class="navbar navbar-expand-sm navbar-dark" id="nav1">
	<a class="navbar-brand" href="main.go"><img id="logo" alt=""
		src="resources/images/logo_white_no.png"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar1" aria-controls="navbar1" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbar1">
		<ul class="navbar-nav mr-auto" id="menu">
			<li class="nav-item"><a class="nav-link" href="#">스타일 피드 <!-- <span class="sr-only">(current)</span> -->
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
		</ul>
		<!-- <form class="form-inline my-1">
            <div class="md-form form-sm my-0">
                <input class="form-control form-control-sm mr-sm-2 mb-0" type="text" placeholder="Search" aria-label="Search">
            </div>
            <button class="btn btn-outline-white" type="submit"><i class="fas fa-search"></i></button>
        </form> -->
        <form class="form-inline lg-form form-lg" style="width: 600px;">
			<input class="form-control form-control-sm mr-3 w-75" type="text"
				placeholder="Search" aria-label="Search" id="searchinput">
			<i id="searchIcon" class="fa fa-search" aria-hidden="true" style="color: white;"></i>
		</form>
        
		<ul class="navbar-nav ml-auto nav-flex-icons">
			<li class="nav-item" id="searchli"><a
				class="nav-link waves-effect waves-light" id="searchshow"> <i
					class="fa fa-search"></i>검색
			</a></li>
			<li class="nav-item" id="tooltip"><a
				class="nav-link waves-effect waves-light"> <i class="fa fa-bell"></i>
					알림
			</a></li>
			<li class="nav-item"><a
				class="nav-link waves-effect waves-light"> <i
					class="fa fa-envelope"></i> 메시지
			</a></li>
			<li class="nav-item"><a
				class="nav-link waves-effect waves-light"> <i
					class="fa fa-pencil"></i> 글쓰기
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-user"> </i>
			</a>
				<div class="dropdown-menu dropdown-menu-right dropdown-default"
					aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="mypage.go">마이페이지</a> <a
						class="dropdown-item" href="#">Another action</a> <a
						class="dropdown-item" href="logout.do">로그아웃</a>
				</div></li>
		</ul>
	</div>
</nav>
<nav class="mb-1 navbar navbar-expand-ssm navbar-dark" id="nav2">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar2" aria-controls="navbar2" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbar2">
		<ul class="navbar-nav mr-auto hide">
			<li class="nav-item"><a class="nav-link" href="main.go?feed=new">최신</a></li>
			<li class="nav-item"><a class="nav-link" href="main.go?feed=hot">인기</a></li>
			<li class="nav-item"><a class="nav-link"
				href="main.go?feed=following">팔로잉</a></li>
		</ul>

		<ul class="navbar-nav mr-auto hide">
			<li class="nav-item"><a class="nav-link"
				href="tipBoardMainPage.tip">팁 </a></li>
			<li class="nav-item"><a class="nav-link" href="#">스타일링</a></li>
			<li class="nav-item"><a class="nav-link" href="#">컨테스트</a></li>
		</ul>
	</div>
</nav>

<!-- 알람 정보 -->
<div class="notification-info" id="notification-info">
	<div class="notification-heading">
		<div class="heading-left">
			<span>알림</span>
		</div>
		<div class="heading-right">
			<a href="#" class="notification-link">모두 읽음 상태로 표시</a>
		</div>
	</div>
	<div class="notification-list">
		<div class="notification-item">
			<div class="img-left">
				<img src="/upload/profile/profile.png" alt="" class="user-image">
			</div>
			<div class="user-content">
				<span class="user-info"> <span class="user-name"><b>Alexander</b></span>
					left a comment.
				</span>
				<p class="comment-time">1 hours ago</p>
			</div>
		</div>
		<div class="notification-item">
			<div class="img-left">
				<img src="/upload/profile/profile.png" alt="" class="user-image">
			</div>
			<div class="user-content">
				<span class="user-info"> <span class="user-name"><b>Alexander</b></span>
					left a comment.
				</span>
				<p class="comment-time">1 hours ago</p>
			</div>
		</div>
		<div class="notification-item">
			<div class="img-left">
				<img src="/upload/profile/profile.png" alt="" class="user-image">
			</div>
			<div class="user-content">
				<span class="user-info"> <span class="user-name"><b>Alexander</b></span>
					left a comment.
				</span>
				<p class="comment-time">1 hours ago</p>
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$("#nav2").hide();

	$("#menu").on('click', 'a', function(event) {
		var val = ($(this).html()).split("<")[0];
		var item = $("#navbar2>ul>li:first-of-type>a").html();
		console.log(val + ":" + item);
		console.log($("#nav2").css("display"));
		if ($("#nav2").css("display") == "none") {
			$("#nav2").show();
			if (val == '게시판') {
				$("#navbar2 > ul:first-of-type").hide();
				$("#navbar2 > ul:nth-of-type(2)").show();
			} else {
				$("#navbar2 > ul:first-of-type").show();
				$("#navbar2 > ul:nth-of-type(2)").hide();
			}
		} else {
			if (val == '게시판') {
				$("#navbar2 > ul:first-of-type").hide();
				$("#navbar2 > ul:nth-of-type(2)").show();
			} else {
				$("#navbar2 > ul:first-of-type").show();
				$("#navbar2 > ul:nth-of-type(2)").hide();
			}
		}
	});

	$("#searchIcon").hide();
	$("#searchinput").hide();

	$("#searchshow").click(function() {
		$("#searchIcon").toggle();
		$("#searchinput").toggle();

	});

	$("#searchIcon").click(function() {
		var input = $("#searchinput").val();
		if (input == "") {
			$("#searchIcon").toggle("fast");
			$("#searchinput").toggle("slow");

		} else {
			console.log("search");
		}
	});

	function toggleTooltip() {
		let contents = document.getElementById("notification-info");
		if (contents.style.display === "none") {
			contents.style.display = "block";
		} else {
			contents.style.display = "none";
		}
	}
	let toggle = document.getElementById("tooltip");
	toggle.addEventListener("click", toggleTooltip, false);
</script>
