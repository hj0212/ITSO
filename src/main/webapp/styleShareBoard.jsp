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

            #wrapper a {
                color: black;
            }
            
            #social_contents a {
            	color : dodgerblue;
            }
            
            #social_contents a:hover {
            	color : black;
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

							<div class=container id="social_contents">
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
                            	<c:forEach var="commentList" items="${commentList}">
								<tr>
									<td>
										<img class="avatar rounded-circle z-depth-1-half mr-3" src="resources/images/${commentList.photo}">
									</td>
									<td>
										<div>
											<a href="#">${commentList.name}</a>
										</div>
										<div>
											<span class="user-comment">
												${commentList.social_comment_contents}
											</span>
										</div>
										<div>
											<span class="comment-date"> ${commentList.social_comment_time} 
												<c:if test="${sessionScope.user.seq == commentList.user_seq}">
													<span><a href="javascript:void(0)" data-seq="${commentList.social_comment_seq}" data-social="${commentList.social_seq}" class="delete"><i class="fa fa-times" aria-hidden="true"></i></a></span>
												</c:if>
											</span>
										</div>
									</td>
								</tr>                            	
                            	</c:forEach>
							</table>
                        </div>
                    </div>
                </div>

                <!-- reply -->
                <div class="container mt-4">
                    <div class="form-group">
                        <textarea class="form-control rounded-0" id="commentarea" rows="3" placeholder="로그인이 필요합니다." maxlength="166"></textarea>
                    </div>
                    <div class="text-right">
                        <input type="button" class="btn btn-grey btn-sm" id="write-comment" value="쓰기" disabled="disabled"></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- user info -->


        <div id="right-side" class="col">
            <aside id="aside">
                <section class="container border-bottom-line mt-4">
                    <img style="vertical-align: super;" src="resources/images/${writer.photo}"
                        class="vertical-align-none avatar rounded-circle z-depth-1-half">
                    <ul class="info">
                        <li>${writer.name}</li>
                        <li>${writer.age} ${writer.state}</li>
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
  	                            <div><a href=${item.tag_url} target="_blank">${item.tag_name}</a></div>
	                            <div>
	                                <a href="#">${item.tag_brand}</a>
	                                <c:if test="${!empty item.tag_store }">
		                                <a href="#">in ${item.tag_store}</a>
	                                </c:if>
	                            </div>
                        	</li>
                    	    </div>
                    	</c:forEach>
                    </ol>
                </section>
				</c:if>
        </div>


    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
   	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
   	<script type="text/javascript" src="<c:url value='/jquery.easypin.js'/>"></script>
    <script>
    	document.title = "${content.social_title}";
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
        };
        
       	document.getElementById("delete").onclick = function() {
       		let delcheck = confirm("글을 삭제하시겠습니까?");
       		if(delcheck) {
	       		location.href = "deleteSocial.go?seq="+${content.social_seq};
       		}
       	};   	
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
    <c:if test="${!empty sessionScope.user.seq}">
    <script>
    	$(document).ready(function(){
    		$("#commentarea").attr("placeholder","댓글 쓰기");
    		$("#write-comment").attr("disabled",false);
    		
    		$("#write-comment").click(function(){
    			var blank_pattern = /^\s+|\s+$/g;
    			if($("#commentarea").val().replace(blank_pattern,"") == ""){
    				alert("내용을 입력해주세요!");
    			}else{
    				$.ajax({
    					url : "procSocialComment.go",
    					dataType : "JSON",
    					method : "post",
    					data : {
    						comment : $("#commentarea").val(),
    						seq : "${content.social_seq}"
    					},
    					
    					success : function(data){
    						showComment(data);
    					}
    				});
    			}
    		});
    		
    		function showComment(data) {
    			let html = '<table id="comment" cellpadding="5">';
    			$.each(data, function(index,item){
    				html += '<tr>';
    				html += '	<td>';
    				html += '		<img class="avatar rounded-circle z-depth-1-half mr-3" src="resources/images/'+item.photo+'">';
    				html += '	</td>';
    				html += '	<td>';
    				html += '		<div>';
    				html += '			<a href="#">' + item.name + '</a>';
    				html += '		</div>';
    				html += '		<div>';
    				html += '			<span class="user-comment">';
    				html += 				item.social_comment_contents;
    				html +=	'			</span>';
    				html += '		</div>';
    				html += '		<div>';
    				html += '			<span class="comment-date">'+item.social_comment_time;
    				if(item.user_seq == item.writer){
    					html += '			<span><a href="javascript:void(0)" class="delete" data-seq="'+item.social_comment_seq+'" data-social="'+item.social_seq+'"><i class="fa fa-times" aria-hidden="true"></i></a></span>';
    				}
    				html += '			</span>';
    				html += '		</div>';
    				html += '	</td>';
    				html += ''
    			});
    			$("#commentarea").val("");
    			$("#comment-container").html(html);
    		}
    		
    		$(document).on('click','.delete',function(){
    			let comment_seq = $(this).data("seq");
    			let social_seq = $(this).data("social");
				
    			let deleteCheck = confirm("댓글을 삭제 하시겠습니까?");
    			
    			if(deleteCheck) {
    				$.ajax({
    					url : "deleteComment.go",
    					dataType : "JSON",
    					method : "post",
    					data : {
    						comment_seq : comment_seq,
    						social_seq : social_seq
    					},
    					
    					success : function(data) {
    						showComment(data);
    					}
    				});
    			}
    		})
    	});
    </script>
    </c:if>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
</body>
</html>