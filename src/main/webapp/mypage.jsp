<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css"
	rel="stylesheet">

<!--   ---------CDN 모음 끝------------------------------------------  -->
<title>MyPage</title>
<style>
body {
	background-color : #eeeeee;
}

#wrapper div {
	background-color : #fff;
}
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

@media ( min-width : 1010px) {
	#profilestat {
		margin-top: 35px;
	}
}

@media ( max-width : 1010px) {
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
	height: 80px;
	width: 80px;
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

.rect img {
	width: 200px;
	height: 200px;
}

.tab-pane {
	padding-top: 10px;
	padding-bottom: 10px;
}

.active {
	font-weight: bold;
}

.textbtn {
	font-size: 12px;
	display: inline;
	margin-right: 5px;
	border: none;
	background: transparent;
	padding: 8px;
}
</style>

<script>
	$(document).ready(function() {
		$("#myinfobtn").click(function() {
			location.href = "myinfo.go";
		})

		$(".followbtn").on('click', function() {
			var seq = $(this).siblings("#seq").val();
			var text = $(this).text();
			
			var btn = $(this);
			
			$.ajax({
				url : "followUser.ajax",
				type : "post",
				data : {
					seq : seq,
					text : text
				},
				success : function(response) {
					if (response != null) {
						console.log("DB success : " + response);
						btn.toggleClass("btn-itso");
						btn.toggleClass("btn-indigo");
						btn.html(response);
					}
				},
				error : function(response) {
					console.log("DB Failed")
				}
			});
		})
		
		function getUrlParameter(sParam) {
	    	var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	        sURLVariables = sPageURL.split('&'), sParameterName, i;

		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');
		
		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : sParameterName[1];
		        }
		    }
		};
		
		var view = getUrlParameter('view');
		
		if(view == "collection") {
			$("a[href='#collectionPanel']").addClass("active show");
			$("#collectionPanel").addClass("in show active");
		} else {
			$("a[href='#socialPanel']").addClass("active show");
			$("#socialPanel").addClass("in show active");
		}
		
		function setModal(seq, title, contents) {
			$("#seqform").val(seq);
			$("#titleform").val(title);
			$("#contentsform").text(contents);
		}
		
		$(".editbtn").on("click", function() {
			var collection_seq = $(this).siblings("input[name='collectionseq']").val();
			var collection_title = $(this).parent().siblings("h4").children("a").children(".collectiontitle").html();
			var collection_contents = $(this).parent().siblings(".collectioncontents").html();
			
			setModal(collection_seq, collection_title, collection_contents);
		})
		
		$("#savebtn").on("click", function() {
			var collection_seq = $("#seqform").val();
			var collection_title = $("#titleform").val();
			var collection_contents = $("#contentsform").val();
			
			$.ajax({
				url : "editCollection.ajax",
				type : "post",
				data : {
					collection_seq : collection_seq,
					collection_title : collection_title,
					collection_contents : collection_contents
				},
				success : function(response) {
					if (response != null) {
						location.href = "mypage.go?view=collection";
					}
				},
				error : function(response) {
					console.log("DB Failed")
				}
			}); 
		})
		
		$(".removebtn").on("click", function() {
			var collection_seq = $(this).siblings("input[name='collectionseq']").val();
			$.ajax({
				url : "removeCollection.ajax",
				type : "post",
				data : {
					collection_seq : collection_seq
				},
				success : function(response) {
					if (response != null) {
						location.href = "mypage.go?view=collection";
					}
				},
				error : function(response) {
					console.log("DB Failed")
				}
			});
		})
	
	})
</script>
</head>

<body>
	<%@include file="navi.jsp"%>

	<div id="wrapper" class="container-fluid mt-3 col-sm-12 col-md-8">
		<!-- 프로필 정보 영역 -->
		<div class="row z-depth-1 mb-3" id="profile">
			<div id="imgarea" class="mr-2">
				<img src="/upload/profile/${sessionScope.user.photo}" alt=""
					class="profileimg">
			</div>
			<div id="infoarea" class="col">
				<p class="h4-responsive mb-0 nanumB">${sessionScope.user.name }</p>
				<p class="h6-responsive">${sessionScope.user.email }</p>
				<br>
				<p class="h4-responsive mb-0 nanumB">"${sessionScope.user.state }"</p>
				<br>
				<button id="myinfobtn" class="btn btn-itso btn-sm">프로필 수정</button>
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
					<p>${fn:length(followerList) }</p>
				</div>
				<div class="">
					<p class="mb-0">팔로잉</p>
					<p>${fn:length(followingList) }</p>
				</div>
				<div class="">
					<p class="mb-0">컬렉션</p>
					<p>${fn:length(collectionList) }</p>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- 탭영역 -->
			<div class="col-sm-12 z-depth-1 mr-2" id="leftarea">
				<ul class="nav md-pills nav-justified pills-secondary" id="tablist">
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#socialPanel" role="tab">스타일</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#collectionPanel" role="tab">컬렉션</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#followerPanel" role="tab">팔로워</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#followingPanel" role="tab">팔로잉</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#boardPanel" role="tab">내가 쓴 글</a></li>
				</ul>

				<!-- Tab panels -->
				<div class="tab-content">

					<!--Panel 1-->
					<div class="tab-pane fade" id="socialPanel" role="tabpanel">

						<div class="row gb" style="margin: 0xp auto;">
							<!-- Grid column -->
							<c:choose>
								<c:when test="${empty socialList }">
									작성한 글이 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach var="slist" items="${socialList }">
										<div class="col-md-6 col-sm-12">
											<!--Card-->
											<div class="card mb-1">
												<!--Card image-->
												<div class="view">
													<img src="/upload/social/${slist.photo }"
														class="card-img-top" alt="photo"> <a href="#">
														<div class="mask rgba-white-slight"></div>
													</a>
												</div>

												<!--Card content-->
												<div class="card-body">
													<!--Title-->
													<h4 class="card-title">
														<a>${slist.writerName }</a><i
															class="fa fa-heart-o red-text heart" aria-hidden="true"
															style="float: right;"><font color="black">0</font></i>
													</h4>
													<!--Text-->
													<p class="card-text">Some quick example text to build
														on the card title and make up the bulk of the card's
														content.</p>
														
													
													<a href="#" class="btn  btn-indigo"
														style="background-color: black;"><i class="fa fa-plus"></i> 팔로우</a>
													<!--share-->
													<!--instagram-->
													<button type="button" class="btn-floating btn-sm btn-is share "
														style="float: right; background-color: #ea4c89; color: white; border: 0px; margin-left: 10px; border-radius: 10px;">
														<i class="fa fa-instagram"></i>
													</button>
													<!--twitter-->
													<button type="button" class="btn-floating btn-sm btn-tw share"
														style="float: right; background-color: #55acee; color: white; border: 0px; margin-left: 10px; border-radius: 6px;">
														<i class="fa fa-twitter"></i>
													</button>
													<!--facebook-->
													<button type="button" class="btn-floating btn-sm btn-fb share"
														style="float: right; background-color: #4267b2; color: white; border: 0px; border-radius: 5px;">
														<i class="fa fa-facebook-f"></i></button>
												</div>
											</div>
											<!--/.Card-->
										</div>


									</c:forEach>

								</c:otherwise>
							</c:choose>

							<!-- Grid column -->
						</div>

					</div>
					<!--/.Panel 1-->

					<!--Panel 2-->
					<div class="tab-pane fade" id="collectionPanel" role="tabpanel">
						<table class="table">
							<tbody>
								<c:choose>
									<c:when test="${!empty collectionList }">
										<c:set var="num" value="0" />
										<c:forEach var="clist" items="${collectionList }">
											<tr>
												<td width=190><h4><a href="collection.go?seq=${clist.collection_seq }"><div class="collectiontitle">${clist.collection_title }</div></a></h4>
													<div class="collectioncontents">${clist.collection_contents }</div>
													<div class="linkarea mt-2"><button class="btn btn-itso btn-sm ml-0" style="padding-left: 8px;padding-right: 8px;">
														<a href="collection.go?seq=${clist.collection_seq }" style="color:white;">보기</a></button>
														<button class="textbtn editbtn" data-toggle="modal" data-target="#editCollectionModal"> 수정 </button><button class="textbtn removebtn"> 삭제 </button>
														<input type="hidden" value="${clist.collection_seq }" name="collectionseq"/>
													</div>
												</td>
												<td><c:set var="loop" value="true" /> 
												<c:set var="num" value="0" /> 
													<c:forEach var="slist" items="${photoList }">
														<c:if test="${loop eq true }">
															<c:if test="${slist.collection_seq eq clist.collection_seq }">
																<c:set var="num" value="${num+1 }" />
																<div class="rect">
																	<img src="upload/social/${slist.photo }" alt="" />
																</div>
																<c:if test="${num > 3 }">
																	<c:set var="loop" value="false" />
																</c:if>
															</c:if>
														</c:if>
													</c:forEach></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td>생성한 컬렉션이 없습니다.
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!--/.Panel 2-->

					<!--Panel 3-->
					<div class="tab-pane fade" id="followerPanel" role="tabpanel">
						<table class="table mb-0">
							<c:choose>
								<c:when test="${empty followerList }">
									<tr>
										<td>나를 팔로우 하는 사람이 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach var="ferlist" items="${followerList }">
										<tr>
											<td width=100>
												<div class="profilearea">
													<img src="/upload/profile/${ferlist.photo }" alt=""
														class="profileimg">
												</div>
												<input type="hidden" value="${ferlist.seq }"/>
											</td>
											<c:choose>
												<c:when test="${ferlist.part eq 'home'}">
													<td style="height: 100px; vertical-align: middle"><h6
															class="mt-1">${ferlist.name }</h6> 
														<c:if test="${ferlist.followcheck eq 'n' }">
															<button class="btn btn-itso btn-sm followbtn ml-0">팔로우</button>
														</c:if> 
														<c:if test="${ferlist.followcheck eq 'y' }">
															<button class="btn btn-indigo btn-sm followbtn ml-0">언팔로우</button>
														</c:if> 
														<input type="hidden" value="${ferlist.seq }" id="seq" /></td>
												</c:when>
												<c:otherwise>
													<!-- 페북 등 로그인일때 -->
												</c:otherwise>
											</c:choose>
										</tr>

									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>

					</div>
					<!--/.Panel 3-->

					<!--Panel 4-->
					<div class="tab-pane fade" id="followingPanel" role="tabpanel">
						<table class="table mb-0">
							<c:choose>
								<c:when test="${empty followingList }">
									<tr>
										<td>팔로우 하는 사람이 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach var="finglist" items="${followingList }">
										<tr>
											<td width=100>
												<div class="profilearea">
													<img src="/upload/profile/${finglist.photo }" alt=""
														class="profileimg">
												</div>
											</td>
											<c:choose>
												<c:when test="${finglist.part eq 'home'}">
													<td style="height: 100px; vertical-align: middle"><h6 class="mt-1">${finglist.name }</h6> 
														<c:if test="${ferlist.followcheck eq 'n' }">
															<button class="btn btn-itso btn-sm followbtn ml-0">팔로우</button>
														</c:if> 
														<c:if test="${finglist.followcheck eq 'y' }">
															<button class="btn btn-indigo btn-sm followbtn ml-0">언팔로우</button>
														</c:if> <input type="hidden" value="${finglist.seq }" id="seq" /></td>
												</c:when>
												<c:otherwise>
													<!-- 페북 등 로그인일때 -->
												</c:otherwise>
											</c:choose>
										</tr>

									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<!--/.Panel 4-->
					
					<!--Panel 5-->
					<div class="tab-pane fade" id="boardPanel" role="tabpanel">
						
					</div>
					<!--/.Panel 5-->
					
					<!-- Modal -->
					<div class="modal fade" id="editCollectionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-sm" role="document">
						<!--Content-->
						<div class="modal-content">
							<!--Header-->
							<div class="modal-header">
								<p class="heading lead mb-0">컬렉션 수정</p>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
		
							<!--Body-->
							<div class="modal-body">
								<input type="hidden" id="seqform" />
								<div class="md-form">
									<input type="text" id="titleform" class="form-control" name="collection_title" maxlength="30" autofocus> <label
										for="titleform">컬렉션 이름</label>
								</div>
								<div class="md-form mt-1">
									<textarea type="text" id="contentsform" class="md-textarea form-control"
										rows="3"  name="collection_contents"></textarea>
									<label for="form7" class="mb-0">컬렉션 상세 설명</label>
								</div>
							</div>
		
							<!--Footer-->
							<div class="modal-footer justify-content-center">
								<button class="btn btn-itso" data-toggle="modal"
									data-target="#modal" id="savebtn">수정</button>
								<button class="btn btn-outline-itso waves-effect"
									data-dismiss="modal">취소</button>
							</div>
						</div>
						<!--/.Content-->
			</div>
					</div>
					
				</div>
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