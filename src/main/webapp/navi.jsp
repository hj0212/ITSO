<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

</style>

<nav class="navbar navbar-expand-lg navbar-dark" id="nav1"> <a class="navbar-brand" href="#"><img id="logo" alt=""
		src="resources/images/logo_white_no.png"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1" aria-controls="navbar1" aria-expanded="false" aria-label="Toggle navigation">
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
        <ul class="navbar-nav ml-auto nav-flex-icons">
            <li class="nav-item"><a class="nav-link waves-effect waves-light"> <i
					class="far fa-bell"></i> 알림
			</a></li>
            <li class="nav-item"><a class="nav-link waves-effect waves-light"> <i
					class="far fa-envelope"></i> 메시지
			</a></li>
            <li class="nav-item"><a class="nav-link waves-effect waves-light"> <i class="fas fa-pen"></i> 피드에 글쓰기
			</a></li>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-user"> </i>
			</a>
                <div class="dropdown-menu dropdown-menu-right dropdown-default" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="mypage.go">마이페이지</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<nav class="mb-1 navbar navbar-expand-lg navbar-dark" id="nav2">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar2" aria-controls="navbar2" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
    <div class="collapse navbar-collapse" id="navbar2">
        <ul class="navbar-nav mr-auto hide">
            <li class="nav-item"><a class="nav-link" href="#">인기
			</a></li>
            <li class="nav-item"><a class="nav-link" href="#">최신</a></li>
            <li class="nav-item"><a class="nav-link" href="#">팔로잉</a></li>
        </ul>

        <ul class="navbar-nav mr-auto hide">
            <li class="nav-item"><a class="nav-link" href="tipBoardMainPage.go">팁
			</a></li>
            <li class="nav-item"><a class="nav-link" href="#">스타일링</a></li>
            <li class="nav-item"><a class="nav-link" href="#">컨테스트</a></li>
        </ul>
    </div>
</nav>

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
    })

</script>
