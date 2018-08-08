<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--   ---------CDN 모음 ------------------------------------------  -->
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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

<!--   ---------CDN 모음 끝------------------------------------------  -->
<title>페이지 기본 틀2-게시판 형태용</title>
<style>
#header {
            height: 150px;
        }

        #profile {
            padding: 10px;
        }

        #imgarea {
            height: 145px;
            width: 145px;
            overflow: hidden;
            display: inline;
            float: left;
        }

        .profileimg {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        #infoarea {
            padding-top: 20px;
            padding-left: 5px;
            display: inline;
        }

        #infoarea p {
            display: inline;
        }

        #profilestat {
            display: inline;
            float: right;
            width: 280px;
        }

        #profilestat div {
            width: 55px;
            float: left;
            font-size: 18px;
            padding-left: 5px;
            border-right: 1px solid black;
        }

        #profilestat div p:first-of-type {
            font-weight: bold;
        }

        @media (min-width: 1010px) {
            #profilestat {
                margin-top: 35px;
            }
        }

        @media (max-width: 1010px) {
            #profilestat {
                margin-top: 15px;
                width: 100%;
            }
        }


        #profileimgarea {
            /* followpanel */
            width: 100px;
            height: 100px;
            overflow: hidden;
            display: inline;
            float: left;
        }

        table .profilearea {
            height: 100px;
            width: 100px;
            overflow: hidden;
            display: inline;
            float: left;
        }

        .rect {
            width: 200px;
            height: 200px;
            background: #eee;
            display: inline;
            float: left;
            margin-right: 5px;
            margin-bottom: 5px;
        }

        .tab-pane {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .active {
            font-weight: bold;
        }
</style>

<script>
	$(document).ready(function() {
		$("#myinfobtn").click(function() {
			location.href="myinfo.go";
		})
	})
</script>
</head>

<body>
	<%@include file="navi.jsp" %>

	<div id="wrapper" class="container-fluid mt-3 col-sm-12 col-md-8">
        <!-- 프로필 정보 영역 -->
        <div class="row z-depth-1 mb-3" id="profile">
            <div id="imgarea" class="mr-2">
                <img src="resources/images/background.jpg" alt="" class="profileimg">
            </div>
            <div id="infoarea" class="col">
                <p class="h4-responsive mb-0 nanumB">${sessionScope.user.name }</p>
                <p class="h6-responsive">${sessionScope.user.email }</p><br>
                <p class="h4-responsive mb-0 nanumB">"${sessionScope.user.state }"</p><br>
                <button id="myinfobtn" class="btn btn-indigo btn-sm">프로필 수정</button>
            </div>
            <div id="profilestat" class="">
                <div class="" style="border-left: 1px solid black;">
                    <p class="mb-0">스타일</p>
                    <p>1</p>
                </div>
                <div class="">
                    <p class="mb-0">좋아요</p>
                    <p>2</p>
                </div>
                <div class="">
                    <p class="mb-0">팔로워</p>
                    <p>3</p>
                </div>
                <div class="">
                    <p class="mb-0">팔로잉</p>
                    <p>4</p>
                </div>
                <div class="">
                    <p class="mb-0">컬렉션</p>
                    <p>1</p>
                </div>
            </div>
        </div>
        
        <div class="row">
            <!-- 탭영역 -->
            <div class="col-sm-12 z-depth-1 mr-2" id="leftarea">
                <ul class="nav md-pills nav-justified pills-secondary" id="tablist">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#panel1" role="tab">스타일</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#collectionPanel" role="tab">컬렉션</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#followerPanel" role="tab">팔로워</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#panel4" role="tab">팔로잉</a>
                    </li>
                </ul>

                <!-- Tab panels -->
                <div class="tab-content">

                    <!--Panel 1-->
                    <div class="tab-pane fade in show active" id="panel1" role="tabpanel">
                        <br>

                        <p>스타일</p>

                    </div>
                    <!--/.Panel 1-->

                    <!--Panel 2-->
                    <div class="tab-pane fade" id="collectionPanel" role="tabpanel">
                        <table>
                            <tr>
                                <td width=230>
                                    컬렉션이름<br> 3개
                                </td>
                                <td>
                                    <div class="rect">1</div>
                                    <div class="rect">1</div>
                                    <div class="rect">1</div>
                                    <div class="rect">1</div>
                                    <div class="rect">1</div>
                                    <div class="rect">1</div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!--/.Panel 2-->

                    <!--Panel 3-->
                    <div class="tab-pane fade" id="followerPanel" role="tabpanel">
                        <table>
                            <tr>
                                <td width=115>
                                    <div class="profilearea">
                                        <img src="background.jpg" alt="" class="profileimg">
                                    </div>
                                </td>
                                <td>
                                    <h6>어쩌구저쩌꾸asdfasdfasef</h6>
                                    <button class="btn btn-indigo btn-sm">팔로우</button>

                                </td>
                            </tr>
                        </table>

                    </div>
                    <!--/.Panel 3-->

                    <!--Panel 4-->
                    <div class="tab-pane fade" id="panel4" role="tabpanel">
                        <br>

                        <p>팔로잉</p>

                    </div>
                    <!--/.Panel 4-->

                </div>
            </div>
        </div>
    </div>
</body>
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
</html>