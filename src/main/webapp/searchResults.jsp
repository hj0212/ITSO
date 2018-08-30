<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 결과</title>
	<!-- jquery  -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css" rel="stylesheet">
	<style>
		* {
			box-sizing: border-box;
		}
		
		.text-small {
			font-size: 0.75rem;
		}
		
		body {
			width: 100%;
			margin: 0px auto;
		}
		
		.gb {
			margin: 0px auto !important;
			width: 100%;
			margin-bottom: 10px !important;
		}
		
		.col-lg-4 {
			margin: 0px auto !important;
		}
		
		.follow:hover {
			background-color: #e9e9e9 !important;
		}
		
		.heart {
			cursor: pointer;
		}
		
		.share {
			cursor: pointer;
		}
		
		.share:hover {
			box-shadow: 1px 2px 2px 0px black;
		}
		
		@media ( max-width : 1100px) {
			#rightfix {
				display: none;
			}
		}
		
		@media ( max-width : 1100px) {
			#MOVE_TOP_BTN {
				visibility: hidden;
			}
		}
		
		.avatar {
			margin-bottom: 5px;
		}
		
		#rightfix {
			width: 300px;
			top: 30%;
			right: 50px;
			position: fixed;
		}
		
		.media-body {
			height: 70px;
			line-height: 70px;
			margin-top: 10px;
		}
		
		.media-body button {
			color: white;
			cursor: pointer;
		}
		
		.firstSection .mainIntro {
			text-align: center;
			padding: 20px;
			font-weight: 300;
			border-bottom: 1px solid rgb(183, 177, 206);
			line-height: 30px;
			background-image: url("resources/images/background.jpg");
		}
		
		.firstSection .mainIntro strong {
			font-weight: 600;
		}
		
		.secondSection .container {
			text-align: right;
			margin-bottom: 10px;
		}
		
		.secondSection .container .btn {
			background-color: white;
			color: black;
			box-shadow: none !important;
		}
		
		.btn-group .dropdown-menu :hover {
			background-color: black;
			color: white;
		}
		
		.droptxt1 {
			font-size: 10px;
		}
		
		.droptxt2 {
			font-size: 13px;
		}
		
		.dropdown-menu {
			border: 1px solid black;
		}
		
		.btn-group {
			margin-left: 3px;
		}
		
		button.dropdown-toggle {
			border: 1px solid #e9e9e9;
		}
		
		#sidefooter {
			width: 100%;
			bottom: 0px;
			border-top: 2px solid black;
			text-align: center;
		}
		
		#sidefooter p {
			font-style: oblique;
		}
		
		#sidefooter p a {
			font-style: oblique;
			color: black;
		}
		
		#MOVE_TOP_BTN {
			position: fixed;
			right: 5%;
			width: 100px;
			bottom: 100px;
			display: none;
			z-index: 999;
			background-color: black;
			color: white;
			text-align: center;
		}
		
		.writerName:hover {
			color: aqua;
		}
		
		.btn-floating {
			
		}
		
		.footer-brand {
			width: 70px;
		}
		
		.hidden {
			display: none;
		}
		
		.show {
			display: block;
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
		
		.mainItem {
			width: 600px;
			margin: 0 auto;
			border-top: 1px solid #eee;
		}
		
		.sharebtnarea button {
			width: 30px;
			height: 30px;
		}
		
		@media ( max-width : 600px) {
			.state {
				display: none;
			}
		}
		
		#social_contents a {
			color: dodgerblue;
		}
		
		#social_contents a:hover {
			color: black;
		}
		
		#user-tab, #tag-tab {
			color : black;
		}
		
		.user-image, .user-fans, .user-looks {
			width : 10%;
		}

		.user-info {
			width: 70%;
		}
		
		.user-image img{
			width : 100px;
			height: 100px;
			border-radius: 50%;
		}

		.user-name {
			font-size: 18px;
		}

		.status-message {
			color : darkgray;
		}

		.user-fans, .user-looks {
			font-size: 18px;
		}
	</style>
	<script>
		$(document).ready(function() {
			$(".heart").click(function() {
				var heartVal = $(this).attr("class");
				if (heartVal == "fa fa-heart red-text heart") {
					$(this).attr("class", "fa fa-heart-o red-text heart");
				} else {
					$(this).attr("class", "fa fa-heart red-text heart");
				}
			});
			$(".heart").on('click', function() {
				var seq = $(this).attr("value");
				var writer	= $(".writerseq").val();
				var font = $(this).children('font');
				console.log("숫자: " + $(this).children('font').html());
				console.log(seq);
				$.ajax({
					url : "mainHeart.ajax",
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
		$(function() {
			$(window).scroll(function() {
				var scrolltop = $(window).scrollTop();
				if ($(this).scrollTop() > 500) {
					$('#MOVE_TOP_BTN').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();
				}
				if (scrolltop == $(document).height()
						- $(window).height()) {
					$("#sidefooter").fadeIn();
				} else {
					$("#sidefooter").fadeOut();
				}
			});
			
			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
					return false;
				});
			});
		
		$(".followbtn").on('click',function() {
				var seq = $(this).siblings('.writerseq').val();
				var text = $(this).find('.show').text();
				console.log("text: " + text);
				var btn = $(".writerseq[value='" + seq + "']")
						.siblings("button.followbtn");
				var span = btn.find('span');
				$.ajax({
					url : "followUser.ajax",
					type : "post",
					data : {
						seq : seq,
						text : text
					},
					success : function(response) {
						if (response != null) {
							console.log("DB success : "
									+ response);
							btn.toggleClass("btn-itso");
							btn.toggleClass("btn-indigo");
							span.toggleClass("hidden");
							span.toggleClass("show");
						}
					},
					error : function(response) {
						console.log("DB Failed")
					}
				});
			})
		});
	</script>
</head>
<body>
	<%@include file="navi.jsp"%>
	<!-- Grid row -->
	<section class="firstSection">
	<div class="mainIntro">
		<p>
			<strong>HYPE</strong> the looks you like, and <strong>+FAN</strong>
			the people you like to personalize you feed.
		</p>
	</div>
	</section>
	<div id="wrapper" class="container">
		<div class="row">
			<section class="secondSection col-md-12 mt-3">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="user-tab" data-toggle="tab" href="#userdiv" role="tab" aria-controls="userdiv" aria-selected="true">사용자</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="tag-tab" data-toggle="tab" href="#tagdiv" role="tab" aria-controls="tagdiv" aria-selected="false">태그</a>
					</li>
				</ul>
				<div class="tab-content text-center" id="myTabContent">
					<div class="tab-pane fade show active" id="userdiv" role="tabpanel" aria-labelledby="user-tab">
						<div class="col-md-12 search-users mt-3">
							<table style="width : 100%;">
								<tr>
									<td class="user-image"><img src="resources/images/background.jpg" alt=""></td>
									<td class="user-info">
										<div class="user-name">
											<b>무함마드</b>
										</div>
										<div class="status-message">
											안뇽하세요
										</div>
									</td>
									<td class="user-fans">511 fans</td>
									<td class="user-looks">23 looks</td>
								</tr>			
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="tagdiv" role="tabpanel" aria-labelledby="tag-tab">
						
					</div>
				</div>
			</section>		
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
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
	<!-- 카카오api -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
		var newURL = window.location.protocol + window.location.host
				+ window.location.pathname;
		var titletext = '${list.social_title}';
	
		console.log("<c:out value='${param.mode}'/>");
	
		var mode = "<c:out value='${list.social_title}'/>";
	
		//트위터 공유  
		function twittergo(url, text) {
			var url = window.location.protocol + window.location.host
					+ window.location.pathname;
			var text = document.title;
	
			console.log(text);
			console.log(titletext);
	
			window.open("https://twitter.com/intent/tweet?text=" + text + "&url="
					+ url, "", "width=700, height=400");
		}
	
		//카카오톡공유  
		Kakao.init('6f7ebead2317edc298ae9592c2996720');
		function kakaogo() {
			Kakao.Link.createDefaultButton({
				container : '#kakao-link-btn',
				objectType : 'feed',
				content : {
					title : document.title,
					description : '내용, 주로 해시태그',
					imageUrl : document.images[0].src, //이미지 주소 올곳 
					link : {
						webUrl : document.location.href,
						mobileWebUrl : document.location.href
					}
				},
				social : {
					likeCount : 999999
				//좋아요우 올곳 
				},
				buttons : [ {
					title : '웹에서보기',
					link : {
						mobileWebUrl : document.location.href,
						webUrl : document.location.href
					}
				} ]
			});
		}
	
		//페이스북 
		function facebookgo() {
			//var url =  window.location.host + window.location.pathname; 
			var url = 'http://192.168.20.35/controller/main.go'
			var encodeUrl = encodeURIComponent(url);
			var facebook = 'https://www.facebook.com/sharer/sharer.php?u=';
			var link = facebook + encodeUrl;
			window.open(link, "", "width=700, height=400");
	
		}
	
		//메타태그 변경 
		function metago() {
	
		}
	</script>
</body>
</html>