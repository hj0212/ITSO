<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
       <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	   <title> Style-Share | ITSO</title>
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
            
	        body {
	            font-family: 'Montserrat'
	        }
	        .inner {
	            position: absolute;
	        }
	
	        .image-containers {
	            display: block;
	        }
	        
	        .pin-containers img {
	        	object-fit : contain;
	        }
	        
	        .image-containers img {
	        	object-fit : contain;
	        }
			
			.modify-delete {
				float : right;
			}

            /* #comment {
                border: 1px solid #e6e6e6;
            } */
            
            #write-btn {
            	margin-right : 0px;
            }
            
            #comment-container {
            	white-space: nowrap; 
            	overflow: hidden;
   				text-overflow: ellipsis; 
            }
        </style>
    </head>

    <body>




	<%@include file="navi.jsp"%>
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
                            <h3>${content.social_title}</h3>
                            <time>${date[1]} ${date[2]}, ${date[0]}</time>
                            <div class="instafilta-target mt-1">
                                2
                                <i class="fa fa-comment-o"></i>
                            </div>
                        </header>

						<div>
							<!-- image -->
							<br>
							<figure>
								<div class="pin-container" style="width: 500px; height: 500px">
									<div class="pin-containers inner">
										<img src="upload/social/${src}?${dummy}" class="pin" width="500"
											height="500" easypin-id="image_db">
									</div>
									<div class="image-containers inner">
										<img src="upload/social/${src}?${dummy}" width="500" height="500">
									</div>
								</div>
							</figure>
							</figure>

							<div style="display: none;" easypin-tpl>
								<popover> 
								</popover>

								<marker>
									<div style="border: solid 1px #1B0946; width: 15px; height: 15px; background-color: black; border-radius: 50%" class="clothes-marker" id="clothes-marker"></div>
								</marker>
							</div>


							<!-- user-context -->

							<div class=container>
								${content.social_contents}
							</div>
							<div style="float:right;">
								<c:if test="${sessionScope.user.seq == content.social_writer}">
									<button id="modify" class="btn btn-grey btn-sm">수정</button>
									<button id="delete" class="btn btn-grey btn-sm">삭제</button>								
								</c:if>
							</div>
						</div>

						<div class="container mt-4" id="comment-container">
                            <table id="comment" cellpadding="5">
								<tr>
									<td>
										<img class="avatar rounded-circle z-depth-1-half mr-3" src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg">
									</td>
									<td>
										<div>
											<a href="#">Risovic N.</a>
										</div>
										<div>
											<span class="user-comment">
												안녕하세요 친구들
											</span>
										</div>
										<div>
											<span class="comment-date"> 2018-08-21 16:28:39.0 <span><i class="fa fa-times" aria-hidden="true"></i></span></span>
										</div>
									</td>
								</tr>
							</table>
                        </div>
                    </div>
                </div>

                <!-- reply -->
                <form action="" method="post">
                    <div class="container mt-4">
                        <div class="form-group">
                            <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="3" placeholder="댓글 달기"></textarea>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-grey btn-sm" id="write-btn">쓰기</button>
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
				
				<c:if test="${!empty list}">
                <section class=border-bottom-line>
                    <div class="mt-4 mb-3 ">
                        <strong>사진 속 의류 정보</strong>
                    </div>
                    <ol>
                    	<c:forEach var="item" items="${list}">
                    	    <div class="clothesinfo">
                    	    <li class="mb-2">
  	                            <div>${item.tag_name}</div>
	                            <div>
	                                <a href=${item.tag_url} target="_blank">${item.tag_brand}</a>
	                                <c:if test="${!empty item.tag_store }">
		                                <a href="">in ${item.tag_store}</a>
	                                </c:if>
	                            </div>
                        	</li>
                    	    </div>
                    	</c:forEach>
                    </ol>
                </section>
				</c:if>
               
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
   	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
   	<script type="text/javascript" src="<c:url value='/jquery.easypin.js'/>"></script>
    <script>
   		var $j  = jQuery.noConflict();
        $j(document).ready(function () {
        	if("${dataflag}" === "true"){
	           	let markerdata = ${markerdata};
	            $j('.pin').easypinShow({
	            	data : markerdata,
	                popover : {
	                    animate : true,
	                },
	            });
	
	            $j(".image-containers").hover(function(){
	                $j(this).css("display","none");
	            });
	
	            $j(".pin-containers").mouseleave(function(){
	                $j(".image-containers").css("display","block");
	                $j(".easypin-marker").css("z-index","0");
	            })
	            
	            $j(".clothes-marker").mouseover(function(){
	           		var index = $j(".clothes-marker").index(this);
	           		$j(".clothesinfo")[index].style.backgroundColor = "yellow";
	        	}).mouseout(function(){
	           		var index = $j(".clothes-marker").index(this);
	            	$j(".clothesinfo")[index].style.backgroundColor = "white";
	        	});
        	};
        });
    </script>
    <c:if test="${sessionScope.user.seq == content.social_writer}">
   	<script>
        document.getElementById("modify").onclick = function() {
        	location.href = "modifySocial.go?seq="+${content.social_seq};
        }
        
       	document.getElementById("delete").onclick = function() {
       		let delcheck = confirm("글을 삭제하시겠습니까?");
       		if(delcheck) {
	       		location.href = "deleteSocial.go?seq="+${content.social_seq};
       		}
       	}    	
   	</script>
    </c:if>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css" rel="stylesheet">
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
</body>

    </html>