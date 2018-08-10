<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>팁 게시판 | ITSO</title>


    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css" rel="stylesheet">
    <!-- JQuery 원래 밑에 있었음-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <style>
        ul {
            list-style-type: none;
        }

        .card-img-top,
        .card {
            border-radius: 0px;
        }

    </style>

</head>

<body>

<!-- navi -->
	<%@include file="navi.jsp"%>


	<!-- tip board main page -->
	<div id=wrapper class=container>


        <div id="bestTipList" class="mt-4">
            <h2 ><span class="badge indigo darken-2"><i class="fa fa-thumbs-o-up align-top"></i></span> 베스트 팁</h2>
            <!-- Card deck -->
            <div class="card-deck">

                <div class="row">
                    <!-- Card1 -->
                    <div class="card mb-4">

                        <!--Card image-->
                        <div class="view overlay">
                            <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/16.jpg" alt="Card image cap">
                            <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                            </a>
                        </div>

                        <!--Card content-->
                        <div class="card-body">

                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <!--Text-->
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                            
                            <div>
                            <button type="button" class=" btn btn-indigo btn-md">읽기</button>
                            <a><i class=" fa mr-2 fa-heart red-text" aria-hidden="true"></i>259</a>
                            <a><i class="fa mr-2 fa-share-alt green-text" aria-hidden="true"></i>82</a> 
                            <a><i class="fa mr-2 fa-comment amber-text" aria-hidden="true"></i>82</a> 
                            <a><i class="fa mr-2 fa-eye" aria-hidden="true"></i>44239</a>
                        </div>
                        </div>

                    </div>
                    <!-- Card -->

                    <!-- Card2 -->
                    <div class="card mb-4">

                        <!--Card image-->
                        <div class="view overlay">
                            <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/14.jpg" alt="Card image cap">
                            <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                            </a>
                        </div>

                        <!--Card content-->
                        <div class="card-body">

                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <!--Text-->
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                            <button type="button" class="btn btn-indigo btn-md">읽기</button>

                        </div>

                    </div>
                    <!-- Card -->

                    <!-- Card3 -->
                    <div class="card mb-4">

                        <!--Card image-->
                        <div class="view overlay">
                            <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/15.jpg" alt="Card image cap">
                            <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                            </a>
                        </div>

                        <!--Card content-->
                        <div class="card-body">

                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <!--Text-->
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                            <button type="button" class="btn btn-indigo btn-md">읽기</button>

                        </div>

                    </div>
                    <!-- Card -->

                </div>
                <div class="row">
                    <!-- Card4 -->
                    <div class="card mb-4">

                        <!--Card image-->
                        <div class="view overlay">
                            <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/15.jpg" alt="Card image cap">
                            <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                            </a>
                        </div>

                        <!--Card content-->
                        <div class="card-body">

                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <!--Text-->
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                            <button type="button" class="btn btn-indigo btn-md">읽기</button>

                        </div>

                    </div>
                    <!-- Card -->

                    <!-- Card5 -->
                    <div class="card mb-4">

                        <!--Card image-->
                        <div class="view overlay">
                            <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/15.jpg" alt="Card image cap">
                            <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                            </a>
                        </div>

                        <!--Card content-->
                        <div class="card-body">

                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <!--Text-->
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                            <button type="button" class="btn btn-indigo btn-md">읽기</button>

                        </div>

                    </div>
                    <!-- Card -->


                    <!-- Card6 -->
                    <div class="card mb-4">

                        <!--Card image-->
                        <div class="view overlay">
                            <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/15.jpg" alt="Card image cap">
                            <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                            </a>
                        </div>

                        <!--Card content-->
                        <div class="card-body">

                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <!--Text-->
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                            <button type="button" class="btn btn-indigo btn-md">읽기</button>

                        </div>

                    </div>
                    <!-- Card -->

                </div>
            </div>
            <!-- Card deck -->

        </div>

        <div id="unVotedListWrapper ">
            <h2><span class="badge amber darken-2 mr-2 align-top">New</span>최근 팁</h2>
            <!-- unvotedListWrapper  -->
            <div class=" row  mb-4">

                <div class="card col mr-4">
                    <div class="" id="beautyTipList">
                        <h2>뷰티</h2>
                        <ul>
                            <li>
                                <table>
                                    <!-- for each jstl 적용될 부분 -->
                                    <tr>
                                        <td>${requestScope.getBeautyTipList}</td>
                                        <td>${requestScope.getBeautyTipWriter}</td>
                                    </tr>
                                    <!-- 적용 끝 -->
                                </table>

                            </li>
                        </ul>

                    </div>


                    <div class="" id="fitnessTipList">
                        <h2>피트니스</h2>
                        <ul>
                            <li>
                                <table>
                                    <!-- for each jstl 적용될 부분 -->
                                    <tr>
                                        <td>${requestScope.getFitnessTipList}</td>
                                        <td>${requestScope.getFitnessTipWriter}</td>
                                    </tr>
                                    <!-- 적용 끝 -->
                                </table>

                            </li>
                        </ul>

                    </div>

                    <div class=" " id="foodTipList">
                        <h2>영양</h2>
                        <ul>
                            <li>
                                <table>
                                    <!-- for each jstl 적용될 부분 -->
                                    <tr>
                                        <td>${requestScope.getFoodTipList}</td>
                                        <td>${requestScope.getFoodTipWriter}</td>
                                    </tr>
                                    <!-- 적용 끝 -->
                                </table>

                            </li>
                        </ul>

                    </div>
                </div>


                <div class="col card ml-4">
                    <div class=" " id="nailartTipList">
                        <h2>네일아트</h2>
                        <ul>
                            <li>
                                <table>
                                    <!-- for each jstl 적용될 부분 -->
                                    <tr>
                                        <td>${requestScope.getNailArtTipList}</td>
                                        <td>${requestScope.getNailArtWriter}</td>
                                    </tr>
                                    <!-- 적용 끝 -->
                                </table>

                            </li>
                        </ul>
                    </div>


                    <div class=" " id="fashionTipList">
                        <h2>패션</h2>
                        <ul>
                            <li>
                                <table>
                                    <!-- for each jstl 적용될 부분 -->
                                    <tr>
                                        <td>${requestScope.getFashionTipList}</td>
                                        <td>${requestScope.getFashionWriter}</td>
                                    </tr>
                                    <!-- 적용 끝 -->
                                </table>

                            </li>
                        </ul>
                    </div>


                    <div class="" id="businessTipList">
                        <h2>직장생활</h2>
                        <ul>
                            <li>
                                <table>
                                    <!-- for each jstl 적용될 부분 -->
                                    <tr>
                                        <td>${requestScope.getbusinessTipList}</td>
                                        <td>${requestScope.getbusinessWriter}</td>
                                    </tr>
                                    <!-- 적용 끝 -->
                                </table>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            
            <div class=container>
            
            <button class="btn btn-indigo" onclick="location.href='tipInsertPage.go'">팁 쓰기</button>
            </div>
            
        </div>
    </div>



    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>


</body>

</html>