<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
* {
	box-sizing: border-box;
}

.notification-counter {
	position: absolute;
	top: 2px;
	left: 3px;
	background-color: rgba(212, 19, 13, 1);
	color: #fff;
	border-radius: 3px;
	padding: 1px 3px;
	font: 8px Verdana;
	background-color: rgba(212, 19, 13, 1);
}

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
	grid-template-columns: 0fr 1fr 0fr;
	padding-top: 5px;
	cursor: pointer;
}

.notification-list {
	overflow: auto;
	height: 400px;
}

/* 모달 */
.modal-heading {
	height: 30px;
	line-height: 30px;
}

.modal-heading .heading-left {
	text-align: left;
	padding-left: 30px;
	float: left;
}

.modal-heading .heading-right {
	text-align: right;
	padding-right: 30px;
	float: right;
}

.modal-list .modal-item {
	display: grid;
	grid-template-columns: 0fr 1fr 0fr;
	padding-top: 5px;
	cursor: pointer;
}

.modal-list {
	overflow: auto;
	height: 400px;
}

.user-name {
	color: #1B0946;
}

.user-image {
	float: left;
	width: 50px;
}

.user-content {
	width: 100%;
	float: left;
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



.read-n:hover {
	background: #e9e9e9;
}

.img-left {
	width: 60px;
	text-align: center;
}

.read-Y {
	background-color: #eae998;
}

.read-Y:hover {
	background-color: #dbd97f;
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

.d-inline-block {
	border-bottom: 1px black;
}

.msg {
	background: #f5f5f5;
	min-width: 10px;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 3px 2px 3px 3px rgba(0, 0, 0, 0.07);
}

.other-msg {
	background: #c0c0c0;
	min-width: 10px;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 3px 2px 3px 3px rgba(0, 0, 0, 0.07);
}
.modal-list:hover{
background-color: #f4f4f4;
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
		<div class="form-inline lg-form form-lg" style="width: 400px;">
			<input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Search" aria-label="Search" id="searchinput" style="display: none"> 
			<i id="searchIcon" class="fa fa-search" aria-hidden="true" style="color: white; display: none"></i>
		</div>

		<ul class="navbar-nav ml-auto nav-flex-icons">
			<li class="nav-item" id="searchli"><a
				class="nav-link waves-effect waves-light" id="searchshow"> <i class="fa fa-search"></i>검색
			</a></li>


			<li class="nav-item" id="tooltip"><a
				class="nav-link waves-effect waves-light" id="notibt"> <i
					class="fa fa-bell"></i> 알림 <span class="notification-counter"
					id="notification-counter">0</span>
			</a></li>

			<li class="nav-item" id="tooltip2"><a
				class="nav-link waves-effect waves-light"> <i
					class="fa fa-envelope"></i> 메시지
			</a></li>
			<li class="nav-item"><a
				class="nav-link waves-effect waves-light" href="writeSocial.jsp"> <i
					class="fa fa-pencil"></i> 글쓰기
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-user"> </i>
			</a>
				<div class="dropdown-menu dropdown-menu-right dropdown-default"
					aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="userpage.go">마이페이지</a> <a
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
			<li class="nav-item"><a class="nav-link" href="tipBoardMainPage.tip">팁 </a></li>
			<li class="nav-item"><a class="nav-link" href="stylingBoard.style">스타일링</a></li>
		</ul>
	</div>
</nav>

<!-- 알람 정보 -->
<div class="notification-info" id="notification-info"
	style="display: none;">
	<div class="notification-heading">
		<div class="heading-left">
			<span>알림</span>
		</div>
		<div class="heading-right">
			<a href="#" class="notification-link">모두 읽음 상태로 표시</a>
		</div>
	</div>




	<script type="text/javascript">
		var notificationcounter = 0;
		if ("WebSocket" in window) {
			var ws = new WebSocket(
					"ws://localhost:8080/websocket?seq=${sessionScope.user.seq}");
			var str;
			var file = "";

			ws.onopen = function() {
				ws.send("${sessionScope.user.seq}");
			};
			ws.onmessage = function(msg) {
				var obj = JSON.parse(msg.data);

				if (obj.noti_read == 'n') {
					var notification = "<div class='notification-item read-n' id='"+obj.noti_seq+"' seq='"+obj.article_seq+"'>";
				} else {
					var notification = "<div class='notification-item read-Y' id='"+obj.noti_seq+"' seq='"+obj.article_seq+"'>";
				}
				notification += "<div class='img-left'>";
				notification += "<img src='/upload/profile/"+obj.noti_user_photo+"' alt='' class='user-image rounded-circle'>";
				notification += "</div>";
				notification += "<div class='user-content'>";
				notification += "<span class='user-info'> <span class='user-name'><b>"
						+ obj.noti_user_name + "님이&nbsp;</b></span>";
				notification += obj.noti_contents;
				notification += "&nbsp;&nbsp;</span>";
				notification += "<p class='comment-time'>" + obj.noti_date
						+ "</p>";
				notification += "</div>";
				notification += "</div>";

				$("#notification_list").prepend(notification);
				notificationcounter++;
				$("#notification-counter").text(notificationcounter);
				if ($("#notification-counter").text != "0") {
					$("#notification-counter").show();
				}
				;

				console.log("이거 유저인데 :" + obj.user_seq + obj.noti_user_name);
			};

			ws.onclose = function() {
			};

		}
	</script>


	<div class="notification-list" id="notification_list"></div>
</div>



<!-- Modal: modalPoll -->
<div class="modal fade right" id="modalPoll" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-backdrop="false">
	<div
		class="modal-dialog modal-full-height modal-right modal-notify modal-info"
		role="document" style="width: 700px">
		<div class="modal-content">
			<!--Header-->
			<div class="modal-header" style="background-color: #fff">
				<p class="heading lead" style="color: #1B0946">채팅 목록</p>

				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: #1B0946">×</span>
				</button>
			</div>

			<!--Body-->
			<div class="modal-body" style="overflow: auto;">
				<ul class="list-unstyled friend-list w-100 p-2 " id="user_list"></ul>
			</div>
		</div>
		<!-- Grid column -->
	</div>
</div>


<!-- Modal: modalPoll -->


<!-- Central Modal Medium Success -->
<div class="modal fade" id="centralModalSuccess" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
	style="height: 100%;">
	<div class="modal-dialog modal-notify modal-success" role="document"
		style="height: 60%;">
		<!--Content-->
		<div class="modal-content" id="modal-content" style="height: 100%;">
			<!--Header-->
			<div class="modal-header" id="message-header">
			
			
			</div>

			<!--Body-->
			<div class="modal-body message-list"
				style="overflow: auto; padding-top: 10px; padding-bottom: 10px;"id="modal-body"></div>
			<!--Footer-->
			
				<textarea class="form-control rounded-0"
					id="exampleFormControlTextarea2" rows="3"
					style="margin: 0xp; padding: 0px; max-height: 94px; z-index: 100000;"></textarea>
				
					<a style="right: 10px;font-size: 20px;" id="sendMessage"><i class="fa fa-send" style="float:right;"></i></a>		
		</div>
		<!--/.Content-->
	</div>
</div>
<!-- Central Modal Medium Success-->




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

	/* $("#searchIcon").hide();
	$("#searchinput").hide();
	 */
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
			location.href = "searchWord.se?word="+input;
		}
	});

	$("#tooltip").click(function() {
		var seq = "${sessionScope.user.seq}"
		console.log(seq);
		let contents = document.getElementById("notification-info");

		$.ajax({
			url : "notificaiton.ajax",
			type : "post",
			data : {
				user_seq : seq
			},
			success : function(data) {
				showNotification(data);
			}

		});
	});

	function showNotification(data) {
		var notItem = "";
		var sessionSeq = "${sessionScope.user.seq}";
		$
				.each(
						JSON.parse(data),
						function(index, item) {
							if (item.user_seq == sessionSeq) {
								if (item.noti_read == 'y') {
									notItem += "<div class='notification-item read-Y' id='"+item.noti_seq+"' seq='"+item.article_seq+"'>"
								} else {
									notItem += "<div class='notification-item read-n' id='"+item.noti_seq+"' seq='"+item.article_seq+"'>"
								}
								notItem += "<div class='img-left'>";
								notItem += "<img src='/upload/profile/"+item.noti_user_photo+"' alt='' class='user-image rounded-circle'>";
								notItem += "</div>";
								notItem += "<div class='user-content'>";
								notItem += "<span class='user-info'> <span class='user-name'><b>"
										+ item.noti_user_name
										+ "님이&nbsp;</b></span>";
								notItem += item.noti_contents;
								notItem += "&nbsp;&nbsp;</span>";
								notItem += "<p class='comment-time'>"
										+ item.noti_date + "</p>";
								notItem += "</div>";
								notItem += "</div>";
							}
						});
		$("#notification_list").prepend(notItem).trigger("create");

	};

	$("#tooltip2").click(function() {
		
			$.ajax({
				 url :"userList.ajax",
				 type:"post",
				 data:{
					seq:"${sessionScope.user.seq}"
				 },
				 success: function(data){
					 console.log(data);
					 showUserList(data); 
				 }
			});		
			$("#tooltip2").attr("data-toggle",'modal');
			$("#tooltip2").attr("data-target",'#modalPoll');

	});
	
	function showUserList(data){
		var userlist="";
		var listget = $("#user_list").text();
		console.log(listget);
		$.each(data.list,function(index,item){			
			if(listget==""){
			userlist = '<li class="w-100 p-2 h-25 d-inline-block modal-list" seq="'+item.user+'" data-toggle="modal" data-target="#centralModalSuccess" ><a class="d-flex justify-content-between h-25 d-inline-block ">' ;
			 userlist += '<img src="/upload/profile"'+item.photo+'alt="avatar"class="avatar rounded-circle d-flex align-self-center mr-1 z-depth-1 " style="width: 50px; height: 50px;">'; 
			userlist += '<div class="text-md-left align-middle">';
			userlist += '<strong>'+item.name+'</strong>';
			userlist += '<p class="last-message text-muted">'+item.contents+'</p>';
			userlist += '</div>';
			userlist += '<div class="chat-footer">';
			userlist += '<p class="text-smaller text-muted mb-0">'+item.time+'</p>';
			userlist += '<span class="text-muted float-right">';
			userlist += '<i class="fa fa-mail-reply" aria-hidden="true"></i></span>';
			userlist += '</div>'	;
			userlist += '</a></li>';
			}
			$("#user_list").prepend(userlist);
		});
	};
		var messageReset =0;
	$(document).on("click",".modal-list",function(){
		var listseq =$(this).attr("seq");
		console.log(listseq);
	/* 	$(".modal-list").attr("data-toggle","modal");
		$(".modal-list").attr("data-target","#centralModalSuccess"); */
		
	
		$.ajax({
		    url :"messageUser.ajax",
		    type: "post",
		    data: {
		    	seq :listseq
		    },
		    success : function(data){
		     	
		   	  showMessageUser(data);
		   	 if(messageReset==0){		   	  
		   	 $("#modal-body").text("");	
		   	  showMessageList(data);
		   	  messageReset =0;
		   	 }
		   	 	console.log(messageReset);
		   	console.log(data.message[0].contents);
		   	console.log(data.message[1].contents);
		 
		    }
		});
	 	
		
	});

	function toggleTooltip() {
		let contents = document.getElementById("notification-info");
		$('#modal-body').scrollTop($('#modal-body').prop('scrollHeight'));

		if (contents.style.display === "none") {
			$("#modal-info").attr("style", "display:none;");
			contents.style.display = "block";
			$("#notification-counter").hide();
			$("#notification-counter").text("0");

			notificationcounter = 0;
		} else {
			contents.style.display = "none";
		}
	};
	let toggle = document.getElementById("tooltip");
	toggle.addEventListener("click", toggleTooltip, false);

	console.log($("#notification-counter").text());
	if ($("#notification-counter").text() == 0) {
		$("#notification-counter").hide();
	};

	
	$(document).on(
			'click',
			".notification-item",
			function() {
				console.log($(this).attr("id"));
				console.log($(this).attr("seq"));
				var seq = $(this).attr("seq");
				var noti_seq = $(this).attr("id");
				$(location).attr("href",
						"readSocial.go?seq=" + seq + "&noti_seq=" + noti_seq);

			});
	
	// 검색창에서 enter 입력시 실행
	$("#searchinput").keypress(function(e) {
		if(e.keyCode == 13){
			location.href = "searchWord.se?word="+$(this).val();
		}
	});
	
	$("#sendMessage").click(function(){
		var message = $("#exampleFormControlTextarea2").val();
		if(message != ""){
		 ws.send(message);
		 $.ajax({
			 url :"sendMessage.ajax",
			 type:"post",
			 data:{
				 message:message,
				 message_user_seq: message_user_seq
			 },
			 success: function(data){
				 if(data >0){
				 console.log("입력완료");
				 }else{
					 console.log("실패");
				 }
			 }
		 });	 	 
		}
	});
	$("#exampleFormControlTextarea2").keydown(function(key){
		if(key.keyCode ==13){
			var message = $("#exampleFormControlTextarea2").val();
			var message_user_seq =$(".heading-name").attr("seq");
			console.log(message_user_seq);
			if(message != ""){
				console.log("여기는 들어옴");
			 socket.send(message);
			 $.ajax({
				 url :"sendMessage.ajax",
				 type:"post",
				 data:{
					 message:message,
					 message_user_seq: message_user_seq
				 },
				 success: function(data){
					 if(data >0){
					 console.log("입력완료");
					 }else{
						 console.log("실패");
					 }
				 }
			 });
			 
			}
		}
	});

	var notificationcounter = 0;
	if ("WebSocket" in window) {
		var socket = new WebSocket(
				"ws://localhost:8080/socket?seq=${sessionScope.user.seq}");
		var str;
		var file = ""
			socket.onopen = function() {
		
			};
			socket.onmessage = function(msg) {
		

			console.log(msg);
		};

		ws.onclose = function() {
		};

	}

	
	
	function showMessageList(data){
		var list ="";
		var sessionSeq = "${sessionScope.user.seq}"	
	
	
		$.each(data.message,function(index,item){
		
			if(item.user_seq == sessionSeq){
				list = '<div class="msg col-md-6 ml-auto" style="width: 100%; margin-bottom: 20px;"><p class="text-sm">'+item.contents+'</p></div>'
			}else{
				list = '<div class="other-msg col-md-6" style="width: 100%; margin-bottom: 20px;"><p class="text-sm">'+item.contents+'</p></div>'
			}
			 $("#modal-body").append(list);
			
		});
	
	}; 
	 
	function showMessageUser(data){
		var user ="";
	
	 	$.each(data.user,function(index,item){
							
		user = '<img src="/upload/profile/"'+item.photo+'"alt="avatar" class="avatar rounded-circle d-flex align-self-center mr-1 z-depth-1 " style="width: 50px; height: 50px;">'
		user += '<p class="heading lead heading-name" seq="'+item.seq+'">'+item.name+'</p>'; 
		user+=	'<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
		user+=	'<span aria-hidden="true" class="white-text">&times;</span>'
			user+='	</button>'
		});	
	 	$("#message-header").html(user);  
		
	}; 

	
	
	
</script>