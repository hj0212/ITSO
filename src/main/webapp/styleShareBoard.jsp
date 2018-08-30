<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta property="fb:app_id" content="175142883151176" />
<meta property="og:site_name" content="ITSO" />
<meta property="og:title" content="${content.social_title}" />
<meta property="og:description" content="${content.social_contents}" />
<meta property="article:author" content="${content.social_writer}" />
<meta property="og:url" content="document.location.href" />
<meta property="og:image"
	content="https://image.ibb.co/cvb5k9/itso_12.png" />

<meta name="twitter:card" content="summary" />
<meta name="twitter:url" content="document.location.href" />
<meta name="twitter:title" content="${content.social_title}" />
<meta name="twitter:description" content="${content.social_contents}" />
<meta name="twitter:image"
	content="https://image.ibb.co/cvb5k9/itso_12.png" />
<meta name="twitter:site" content="${content.social_writer}" />
<meta name="twitter:creator" content="@트위터아이디" />


<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script type="text/javascript" src="<c:url value='/jquery.easypin.js'/>"></script>
<title>Style-Share | ITSO</title>
<style>
#wrapper {
	min-height: 100%;
	width: 980px;
	margin: 0 auto;
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
	height: 60px;
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

#wrapper a, a:hover {
	color: black;
}

#right-side {
	width: 30%;
	display: inline-block;
}

#left-side {
	width: 70%;
	display: inline-block;
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
	object-fit: contain;
}

.image-containers img {
	object-fit: contain;
}

.modify-delete {
	float: right;
}

/* #comment {
                border: 1px solid #e6e6e6;
            } */
#comment-container {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

/* ---------------- 모달 스타일 ------------------*/
#collectionarea {
	text-align: center;
	overflow: auto;
	-ms-overflow-style: none;
}

::-webkit-scrollbar {
	display: none;
}

@media ( max-width : 575px) {
	.collectionItem {
		width: 80%;
	}
}

@media ( min-width : 576px) and (max-width: 991px) {
	.collectionItem {
		width: 50%;
		float: left;
	}
}

@media ( min-width : 991px) {
	.collectionItem {
		width: 30%;
	}
}

.collectionItem {
	display: inline-block;
	margin: 0 auto 10px auto !important;
	background: white;
	height: 236px;
}

.collectionItem:hover {
	transform: scale(1.05);
	transition: all 0.1s ease-in-out;
}

.collectionPhoto {
	height: 100%;
	padding-left: 5px;
}

.collectionPhotoItem {
	float: left;
	display: inline;
	padding: 1px;
}

.collectionPhotoItem img {
	width: 105px;
}

#saveModal .active {
	border: 3px solid #21FCFF;
	margin-left: 1px;
}

.btn-group {
	margin-left: 3px;
}

/* 디자인 수정 */
.btn-group {
	float: right;
	margin-top: 15px;
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
							<div class="goodarea" style="margin-top: 17px; float: left;">
										<c:set var="loop_flag" value="false" />
										<c:choose>
											<c:when test="${countGood > 0 }">
												
													<i class="fa fa-heart red-text heart" aria-hidden="true"
																	style="float: left; font-size: 25px;"
																	value="${content.social_seq}"><font color="black">${countGood}
																</font></i>
												</c:when>
											
											<c:otherwise>
											<i class="fa fa-heart-o red-text heart"
																		aria-hidden="true"
																		style="float: left; font-size: 25px;"
																		value="${content.social_seq}"><font color="black">${countGood}
																	</font></i>
											</c:otherwise>
										</c:choose>
									</div>
							<!-- social button list -->
							<div id="snsLists" class="btn-toolbar" role="toolbar"
								aria-label="Toolbar with button groups">
								<div class="btn-group mr-2" role="group"
									aria-label="First group">
										<input type="hidden" value="${content.social_writer }"
											class="writerseq" /> 
										<input type="hidden"
											value="${content.social_seq }" class="socialseq" />
										<button type="button" class="btn-floating btn-sm savebtn"
											style="float: right; background-color: #fff; color: black; border: 0px; border-radius: 5px;"
											title="컬렉션에 저장" data-toggle="modal" data-target="#saveModal">
											<i class="fa fa-upload"></i>
										</button>
										<!--facebook-->
										<button type="button" class="btn-floating btn-sm btn-fb share"
											style="float: right; background-color: #4267b2; color: white; border: 0px; margin-left: 10px; border-radius: 5px;">
											<i class="fa fa-facebook-f" title="페이스북으로 공유하기"></i>
										</button>
										<!--twitter-->
										<button type="button" class="btn-floating btn-sm btn-tw share"
											style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 5px;">
											<i class="fa fa-twitter" title="트위터로 공유하기"></i>
										</button>
										<!--kakao-->
										<button type="button" class="btn-floating btn-sm share "
											style="float: right; background-color: #fae101; color: white; border: 0px; margin-left: 10px; border-radius: 5px;"
											title="카카오로 공유하기">
											<i class="fa fa-comment"></i>
										</button>
										
										
										
								</div>
							</div>
						</div>
					</header>
					<div class=container>
						<br>
						<!-- header -->
						<header class="container p-0">
							<h3>${content.social_title}</h3>
							<span class="time">${date[1]} ${date[2]}, ${date[0]}</span>
						</header>

						<div class="instafilta-target mt-1">
							2 <i class="fa fa-comment-o"></i>
						</div>

						<div>
							<!-- image -->
							<br>
							<figure>
								<div class="pin-container" style="width: 500px; height: 500px">
									<div class="pin-containers inner">
										<img src="upload/social/${src}?${dummy}" class="pin"
											width="500" height="500" easypin-id="image_db">
									</div>
									<div class="image-containers inner">
										<img src="upload/social/${src}?${dummy}" width="500"
											height="500">
									</div>
								</div>
							</figure>
							</figure>

							<div style="display: none;" easypin-tpl>
								<popover> </popover>

								<marker>
								<div
									style="border: solid 1px #1B0946; width: 15px; height: 15px; background-color: black; border-radius: 50%"
									class="clothes-marker" id="clothes-marker"></div>
								</marker>
							</div>


							<!-- user-context -->

							<div class="container m-0 p-0" id="social_contents">
								${content.social_contents}</div>
							<div style="float: right;">
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
										<td><img
											class="avatar rounded-circle z-depth-1-half mr-3"
											src="resources/images/${commentList.photo}"></td>
										<td>
											<div>
												<a href="#">${commentList.name}</a>
											</div>
											<div>
												<span class="user-comment">
													${commentList.social_comment_contents} </span>
											</div>
											<div>
												<span class="comment-date">
													${commentList.social_comment_time} <c:if
														test="${sessionScope.user.seq == commentList.user_seq}">
														<span><a href="javascript:void(0)"
															data-seq="${commentList.social_comment_seq}"
															data-social="${commentList.social_seq}" class="delete"><i
																class="fa fa-times" aria-hidden="true"></i></a></span>
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
						<textarea class="form-control rounded-0" id="commentarea" rows="3"
							placeholder="로그인이 필요합니다." maxlength="166"></textarea>
					</div>
					<div style="float: right;">
						<input type="button" class="btn btn-grey btn-sm"
							id="write-comment" value="쓰기" disabled="disabled"> <input
							type="button" class="btn btn-grey btn-sm" id="gomain" value="목록">
					</div>
				</div>
			</div>
		</div>

		<!-- user info -->


		<div id="right-side" class="col">
			<aside id="aside">
				<section class="container border-bottom-line mt-4">
					<img style="vertical-align: super;"
						src="resources/images/${writer.photo}"
						class="vertical-align-none avatar rounded-circle z-depth-1-half">
					<ul class="info">
						<li>${writer.name}</li>
						<li>${writer.age}${writer.state}</li>
						<li>
							
							
							
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
										<div>
											<a href=${item.tag_url } target="_blank">${item.tag_name}</a>
										</div>
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
	<!-- saveModal -->
		<div class="modal fade" id="saveModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<!--Content-->
				<div class="modal-content">
					<!--Header-->
					<div class="modal-header">
						<p class="heading lead mb-0">컬렉션으로 저장하기</p>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<!--Body-->
					<div class="modal-body">
						<div id="modalbtnarea">
							<button class="btn btn-itso" data-toggle="modal"
								data-target="#createModal">
								<i class="fa fa-plus"></i> 컬렉션 생성
							</button>
							<button class="btn btn-indigo" id="managebtn">컬렉션 관리</button>
						</div>

						<c:choose>
							<c:when test="${not empty collectionList }">
								<div id="collectionarea" class="mt-2">
									<c:set var="num" value="0"></c:set>
									<c:forEach items="${collectionList}" var="clist">

										<div class="collectionItem z-depth-1 mt-2">
											<h4 class="mt-1 mb-1 text-truncate">${clist.collection_title }</h4>
											<h6 class="text-truncate">${clist.collection_contents }</h6>
											<input type="hidden" class="collectionseq"
												value="${clist.collection_seq }" />
											<div class="collectionPhoto">

												<c:set var="num" value="0" />

												<c:forEach items="${photoList }" var="plist"
													varStatus="status">
													<c:choose>
														<c:when test="${num < 4 }">
															<c:if
																test="${plist.collection_seq == clist.collection_seq }">
																<c:set var="num" value="${num+1 }" />

																<div class="collectionPhotoItem">
																	<img src="/upload/social/${plist.photo }" alt=""><input
																		type="hidden" class="socialseq"
																		value="${plist.social_seq }" writer="${plist.social_writer}"/>
																</div>
															</c:if>
														</c:when>
														<c:otherwise>
															<c:if
																test="${plist.collection_seq == clist.collection_seq }">
																<div class="collectionPhotoItem" style="display: none;">
																	<img src="/upload/social/${plist.photo }" alt=""><input
																		type="hidden" class="socialseq"
																		value="${plist.social_seq }" writer="${plist.social_writer}" />
																</div>
															</c:if>
														</c:otherwise>

													</c:choose>

												</c:forEach>
											</div>
											<h6 class="mb-0" style="height: 19px;"></h6>
										</div>
									</c:forEach>
								</div>
							</c:when>
							<c:otherwise>
								<p class="mt-1 mb-0">생성된 컬렉션이 없습니다.</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!--/.Content-->
			</div>
		</div>


		<!-- createModal -->
		<div class="modal fade" id="createModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm" role="document">
				<!--Content-->
				<div class="modal-content">
					<!--Header-->
					<div class="modal-header">
						<p class="heading lead mb-0">컬렉션 생성</p>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<!--Body-->
					<div class="modal-body">
						<div class="md-form">
							<input type="text" id="inputMD" class="form-control"
								name="collection_title" maxlength="30"> <label
								for="inputMD">컬렉션 이름</label>
						</div>
						<div class="md-form mt-1">
							<textarea id="form7" class="md-textarea form-control" rows="3"
								name="collection_contents"></textarea>
							<label for="form7">컬렉션 상세 설명</label>
						</div>
					</div>

					<!--Footer-->
					<div class="modal-footer justify-content-center">
						<button class="btn btn-itso" data-toggle="modal"
							data-target="#modal" id="createcolbtn">생성</button>
						<button class="btn btn-outline-itso waves-effect"
							data-dismiss="modal">취소</button>
					</div>
				</div>
				<!--/.Content-->
			</div>
		</div>
	<script>
		$("#managebtn").on("click", function () {
		    window.open('mypage.go?view=collection', '_blank');
		})

		social_seq = 0;
		$('.savebtn').on("click", function () {
		    social_seq = $(this).siblings(".socialseq").val();
		    console.log(social_seq);

		    var clistsize = "${fn:length(collectionList)}";

		    for (var i = 1; i <= clistsize; i++) {
		        var cursor = $(".collectionItem:nth-of-type(" + i + ")");
		        var plistsize = cursor.find(".collectionPhotoItem").length;

		        for (var j = 1; j <= plistsize; j++) {
		            var collection_socialseq = $(cursor).find(".collectionPhotoItem:nth-of-type(" + j + ")").find(".socialseq").val();
		            console.log("검사 : " + i + "," + j + ":" + social_seq + ":" + collection_socialseq);
		            if (social_seq == collection_socialseq) {
		                cursor.addClass("active");
		                console.log("true");
		                break;
		            }
		        }
		    }
		})
		$("#collectionarea").on("click", ".collectionItem", function () {
		    var cursor = $(this);
		    cursor.toggleClass('active');
		    var collection_seq = $(this).children(".collectionseq").val();
		    console.log("collection_seq: " + collection_seq);
		    console.log("social_seq: " + social_seq);

		    var num = $(this).find(".collectionPhotoItem").length;
		    $.ajax({
		        url: "saveCollection.ajax",
		        type: "post",
		        data: {
		            collection_seq: collection_seq,
		            social_seq: social_seq
		        },
		        success: function (data) {
		            console.log("ajax: " +
		                data.photo + "," +
		                data.social_seq)
		            if (data.photo != null) {
		                console.log("여기");
		                cursor.find(".collectionPhoto").append(
		                    '<div class="collectionPhotoItem">' +
		                    '<img src="/upload/social/' + data.photo + '"> <input type="hidden" class="socialseq" value="' + data.social_seq + '">' +
		                    '</div>');
		                if (num > 4) {
		                    cursor.find(".collectionPhoto:last").attr("display", "none");
		                }
		            } else {
		                cursor.find(".collectionseq[value='" + collection_seq + "']").siblings(".collectionPhoto")
		                    .find(".socialseq[value='" + social_seq + "']").parent().remove();
		            }
		        },
		        error: function (response) {
		            console.log("DB Failed")
		        }

		    });

		})

		$("#createcolbtn")
		    .on('click', function () {
		        var collection_title = $("input[name='collection_title']").val();
		        var collection_contents = $("textarea[name='collection_contents']").val();

		        $.ajax({
		            url: "createCollection.ajax",
		            type: "post",
		            data: {
		                collection_title: collection_title,
		                collection_contents: collection_contents
		            },
		            success: function (data) {
		                console.log("생성" + data);
		                var dto = JSON.parse(data);
		                $("input[name='collection_title']").val("");
		                $("textarea[name='collection_contents']").val("");
		                $("#createModal").hide();

		                $("#collectionarea").append(
		                    '<div class="collectionItem z-depth-1 mt-2">' +
		                    '<h4 class="mt-1 mb-1 text-truncate">' +
		                    dto.collection_title +
		                    '</h4><h6 class="text-truncate">' +
		                    dto.collection_contents +
		                    '</h6>' +
		                    '<input type="hidden" class="collectionseq" value="' + dto.collection_seq + '"/>' +
		                    '<div class="collectionPhoto"></div></div><h6 class="mb-0" style="height: 19px;"></h6>');

		                $("#saveModal").show();

		            }
		        });
		    });
		$("#createModal").on('show.bs.modal', function () {
		    $("#saveModal").hide();
		});

		$("#createModal").on('hidden.bs.modal', function () {
		    $("#saveModal").show();
		});

		$("#saveModal").on('hidden.bs.modal', function () {
		    console.log("닫힘");
		    $(".collectionItem").removeClass("active");
		});

		</script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script type="text/javascript"
		src="<c:url value='/jquery.easypin.js'/>"></script>
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
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- JQuery -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
    	document.getElementById("gomain").onclick = function() {
    		location.href = "main.go";
    	}
    </script>
	<c:if test="${!empty sessionScope.user.seq}">
		<script>
    	$(document).ready(function(){
    		cosole.log($(".socailseq").attr("writer"));
    		
    		$(".heart").click(function() {
				var heartVal = $(this).attr("class");
				if (heartVal == "fa fa-heart red-text heart") {
					$(this).attr("class", "fa fa-heart-o red-text heart");
				} else {
					$(this).attr("class", "fa fa-heart red-text heart");
				}
			});
			$(".heart").on('click', function() {
				var seq = $(".socialseq").attr("value");
				var writer	= $(".socialseq").attr("writer");
				var font = $(this).children('font');
				console.log("숫자: " + $(this).children('font').html());
				console.log(seq);
				console.log(writer);
				$.ajax({
					url : "boardHeart.ajax",
					type : "post",
					data : {
						social_seq : seq , 
						social_writer :writer
					},
					success : function(data) {
						console.log("들어옴" + data), font.html(data)
					}
				});
			});
    		
    		
 		
    		
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
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
</body>
<!-- 카카오api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 페이스북api -->
<div id="fb-root"></div>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>

<script>

	//도큐멘트 title 값 제목값으로 변경
	 
	
	var newURL = window.location.protocol + window.location.host
			+ window.location.pathname;
	/* var titletext = '${content.social_title}'; */
	
	console.log("<c:out value='${param.mode}'/>");

	var mode = "<c:out value='${content.social_title}'/>";

		
	
	//트위터 공유 
	function twittergo(url, text) {
		//var url = window.location.protocol + window.location.host				+ window.location.pathname;
		var url=document.location.href;
		var text = encodeURI('${content.social_title}');	
		var wow = encodeURI('${goodCount.social_good_seq}');		
		
		console.log("와우에 오는 깃 : " + wow);
		console.log("text에 오는 것: " + text);
		console.log('${goodList.social_good_seq}');
		
		window.open("https://twitter.com/intent/tweet?text=" + text + "&url="+ url, "", "width=700, height=400");
	}
	
	var kakaoURL = 'http://192.168.20.35:8080/controller/readSocial.go?seq=186';
	
	
	

	//카카오톡공유 
	Kakao.init('6f7ebead2317edc298ae9592c2996720');	
	function kakaogo(){
		 Kakao.Link.createDefaultButton({
			 container: '#kakao-link-btn',
		      objectType: 'feed',
		      content: {
		        title: document.title,
		        description: '${content.social_contents}',
		        imageUrl: document.images[0].src, //이미지 주소 올곳
		        link: {
		          webUrl: document.location.href,
		          mobileWebUrl: document.location.href
		        }
		      },
		      
		      buttons: [
		        {
		          title: '웹에서보기',
		          link: {
		            mobileWebUrl: document.location.href,
		            webUrl: document.location.href
		          }
		        }  
		      ]
		    });
	}

	//페이스북
	function facebookgo() {
		//var url =  window.location.host + window.location.pathname;
		var url = document.location.href;
		//var url = 'http://192.168.20.35/controller/main.go'//test용이라 주소 직접 입력해놓음
		//var url ='http://192.168.20.35:8080/controller/readSocial.go?seq=186';
		var encodeUrl = encodeURIComponent(url);
		var facebook = 'https://www.facebook.com/sharer/sharer.php?u=';
		var link = facebook + encodeUrl;
		window.open(link, "", "width=700, height=400");
	}	
	
</script>

</html>