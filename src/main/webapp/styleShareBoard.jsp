<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title> Style-Share | ITSO</title>
 
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

 <style>
        
            #wrapper {
                min-height: 100%;
                width: 980px;
                margin:0 auto;
            }

            .vertical-align-none {
                vertical-align: -50%;
            }

            #snsLists {
                display: inline;
            }

            .chevrons {
                display: inline;

            }

            .inline-block {
                display: inline-block;
            }

            .block {
                display: block;
            }

            .list-style-none {
                list-style-type: none;

            }

            .info {
                list-style-type: none;
                display: inline-block;
                padding: 10px;
            }

            .avatar {
                width: 64px;
                height: 64px;
                display: inline;
            }

            #lookAction {
                border-bottom: 1px #9AA9B2 solid;
            }

            .comment-child-border {
                border-left: 1px #e6e6e6 solid;

            }

            .border-bottom-line {
                border-bottom: 1px #9AA9B2 solid;
            }

            .comment-child {
                margin-top: 15px;
                margin-left: 32px;
            }

            .brand-icon {
                width: 64px;
            }

            #wrapper a,
            a:hover {
                color: black;
            }

            #right-side {
                width: 30%;
                display: inline-block;
            }
            #left-side{
                width:70%;
                display:inline-block;
            }


            /* #comment {
                border: 1px solid #e6e6e6;
            } */
        </style>
    </head>

    <body>





    <div id="wrapper" class="row">

        <div id="left-side" class="col">

            <div>
                <div>
                    <header>
                        <div id="lookAction" class=container>
                            <button type=button class="btn btn-elegant">HYPE</button> 853
                            <button type=button class="btn btn-grey-ligten-5 btn-sm">SAVE</button>
                            <!-- social button list -->
                            <div id="snsLists" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="First group">
                                    <button type="button" class="btn btn-grey-ligten-5 btn-sm">
                                        <i class="fa fa-facebook"></i>
                                    </button>
                                    <button type="button" class="btn btn-grey-ligten-5 btn-sm">
                                        <i class="fa fa-twitter" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-grey-ligten-5 btn-sm">
                                        <i class="fa fa-instagram"></i> 
                                    </button>
                                </div>
                            </div>
                            <div class="chevrons">
                                <span class="instafilta-target">
                                    <a href=#>
                                        <i class="fa fa-chevron-left"></i>
                                    </a>
                                </span>
                                <span class="instafilta-target">
                                    <a href="#">
                                        <i class="fa fa-chevron-right"></i>
                                    </a>
                                </span>
                            </div>
                        </div>
                    </header>
                    <div class=container>
                        <br>
                        <!-- header -->
                        <header class="container">
                            <h3>Marsquest Giveaway</h3>
                            <time>Nov 17, 2017</time>
                            <div class="instafilta-target mt-1">
                                2
                                <i class="fa fa-comment-o"></i>
                            </div>
                        </header>

                        <div>
                            <!-- image -->
                            <br>
                            <figure>
                                <img src="https://78.media.tumblr.com/851d55a1f3d275a127b63961500b3e91/tumblr_mgztb7LSrv1rlmfrlo1_500.jpg"> </figure>
                            </figure>


                            <!-- user-context -->

                            <div class=container>

                                <a href="">#bike</a>
                                <a href="">#black</a>
                                <a href="">#short</a>
                                <a href="">#brown-hair</a>
                                <a href="">#white-shirt</a>


                                디자이너에게 완벽함이란 무엇인가를 추가할 것이 있는 상태가 아니라 더 이상 버릴 것이 없는 상태다.</div>



                        </div>

                        <div class="container mt-4">
                            <table id="comment">
                                <tbody>
                                    <tr>
                                        <td>
                                            <img class="avatar rounded-circle z-depth-1-half mr-3" src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg">
                                        </td>
                                        <td>
                                            <div>
                                                <a href="#">Risovic N.</a>
                                                <a href="#">@risovic</a>
                                            </div>
                                            <div>
                                                Nice dress, color, and the vibe
                                            </div>
                                            <div id=comment>
                                                0
                                                <a href="#">▲</a>· reply · flag · 6 months ago
                                            </div>

                                        </td>
                                    </tr>


                                    <tr>
                                        <table>
                                            <tr>
                                                <td>
                                                    <div class="comment-child">
                                                        <img class="ml-4 avatar rounded-circle z-depth-1-half mr-3" src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg">
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td>
                                                    <div>
                                                        <a href="#">Alex X.</a>
                                                        <a href="">@Alex</a>
                                                    </div>
                                                    <div>How sweet of her. </div>

                                                    <div id=comment>
                                                        2
                                                        <a href="#">▲</a· reply>· flag · 6 months ago
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="comment-child">
                                                        <img class="ml-4 avatar rounded-circle z-depth-1-half mr-3" src="https://mdbootstrap.com/img/Photos/Avatars/avatar-10.jpg">
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td>
                                                    <div>
                                                        <a href="#">Lauren A.</a>
                                                        <a href="">@Lauren</a>
                                                    </div>
                                                    <div>I envy her body ratio </div>

                                                    <div id=comment>
                                                        5
                                                        <a href="#">▲</a>· reply· flag · 6 months ago
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                    </tr>

                                </tbody>


                            </table>
                        </div>


                    </div>
                </div>

                <!-- reply -->
                <form action="" method="post">
                    <div class="container mt-4">
                        <div class="form-group">
                            <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="3" placeholder="댓글 달기"></textarea>

                            <!-- Default inline 1-->

                            <div class="custom-control custom-checkbox custom-control-inline">

                                <input type="checkbox" class="custom-control-input" id="defaultInline1">
                                <label class="custom-control-label" for="defaultInline1">페이스북</label>
                            </div>

                            <!-- Default inline 2-->
                            <div class="custom-control custom-checkbox custom-control-inline">
                                <input type="checkbox" class="custom-control-input" id="defaultInline2">
                                <label class="custom-control-label" for="defaultInline2">카카오톡</label>
                            </div>

                            <!-- Default inline 3-->
                            <div class="custom-control custom-checkbox custom-control-inline">
                                <input type="checkbox" class="custom-control-input" id="defaultInline3">
                                <label class="custom-control-label" for="defaultInline3">인스타그램</label>
                            </div>

                            <!-- Default inline 3-->
                            <div class="ml-4 custom-control custom-checkbox custom-control-inline">
                                <input type="checkbox" class="custom-control-input" id="defaultInline3">
                            </div>

                            <button class="btn btn-grey btn-sm">쓰기</button>
                        </div>
                    </div>
                </form>



            </div>

        </div>

        <!-- user info -->


        <div id="right-side" class="col">
            <aside id="aside">
                <section class="container border-bottom-line mt-4">
                    <img style="vertical-align: super;" src="https://images.pexels.com/photos/607894/pexels-photo-607894.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
                        class="vertical-align-none avatar rounded-circle z-depth-1-half">
                    <ul class="info">
                        <li>이슬</li>
                        <li>24 디자인학과</li>
                        <li>
                            <i class="fa fa-map-marker"></i> 연남동, 서울
                        </li>
                        <li>
                            <button class="btn btn-elegant btn-sm">+ Fan</button>
                        </li>
                    </ul>
                </section>

                <section class=border-bottom-line>
                    <div class="mt-4 mb-3 ">
                        <strong>사진 속 의류 정보</strong>
                    </div>
                    <ol>
                    	<c:forEach var="item" items="${list}">
                    	    <li class="mb-2">
	                            <div>${item.tag_name}</div>
	                            <div>
	                                <a href=${item.tag_url} target="_blank">${item.tag_brand}</a>
	                                <c:if test="${!empty item.tag_store }">
		                                <a href="">in ${item.tag_store}</a>
	                                </c:if>
	                            </div>
                        	</li>
                    	</c:forEach>
                    </ol>
                </section>
               
                <div>
                    <!-- you may like these users -->
                    <div class="mt-4 mb-3">
                        <strong> 당신이 좋아할만한 유저
                        </strong>
                    </div>

                    <ol class="list-style-none">
                        <li class="mt-3">
                            <img class="vertical-align-none z-depth-1-half rounded-circle" alt="Primark" height="75" src="http://s3cdn-test-lookbooknu.netdna-ssl.com/files/users/small/6484472_image.jpg?1531857217">


                            <ol class="info">
                                <li class="ml-2">
                                    <a href=#>김연아</a>
                                </li>

                                <li class="ml-2">18 항공승무원 부산</li>
                                <li>
                                    <button class="btn btn-elegant btn-sm">+ Fan</button>
                                </li>
                            </ol>
                        </li>
                        <li class="mt-3">
                            <img class="vertical-align-none z-depth-1-half rounded-circle" alt="Zaful" height="75" src="http://s3cdn-test-lookbooknu.netdna-ssl.com/files/users/small/3348731_velvet_playsuit_seite_gesicht.jpg?1407499836"
                                width="75">

                            <ol class="info">
                                <li class="ml-2">
                                    <a href=#>안졸리나</a>
                                </li>

                                <li class="ml-2">23 수학과 서울</li>

                                <li>
                                    <button class="inline-block btn btn-elegant btn-sm">+ Fan</button>
                                </li>
                            </ol>


                        </li>

                    </ol>
                    </li>
                    </ul>


                    </ol>
                    </section>

                </div>
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
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>



</body>

    </html>