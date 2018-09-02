<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="og:site_name" content="ITSO"/>
<meta property="og:title" content="IS THIS STYLE OK?">
<meta property="og:image"
	content="https://image.ibb.co/cvb5k9/itso_12.png">
<meta property="og:description" content="ITSO WELCOME PAGE">
<title>It So</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
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
<style>
/*body back ground*/
body, html {
	width: 100%;
	height: 120vh;
}
#loading-wrapper {
  position: fixed;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  z-index: 100;
}

#loading-text {
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  color: #fff;
  width: 100px;
  height: 30px;
  margin: -7px 0 0 -45px;
  text-align: center;
  font-family: 'PT Sans Narrow', sans-serif;
  font-size: 20px;
    z-index: 100;
}

#loading-content {
  display: block;
  position: relative;
  left: 50%;
  top: 50%;
  width: 170px;
  height: 170px;
  margin: -85px 0 0 -85px;
  border: 3px solid #F00;
    z-index: 100;
}

#loading-content:after {
  content: "";
  position: absolute;
  border: 3px solid #0F0;
  left: 15px;
  right: 15px;
  top: 15px;
  bottom: 15px;
    z-index: 100;
}

#loading-content:before {
  content: "";
  position: absolute;
  border: 3px solid #00F;
  left: 5px;
  right: 5px;
  top: 5px;
  bottom: 5px;
    z-index: 100;
}

#loading-content {
  border: 3px solid transparent;
  border-top-color: #4D658D;
  border-bottom-color: #4D658D;
  border-radius: 50%;
  -webkit-animation: loader 2s linear infinite;
  -moz-animation: loader 2s linear infinite;
  -o-animation: loader 2s linear infinite;
  animation: loader 2s linear infinite;
    z-index: 100;
}

#loading-content:before {
  border: 3px solid transparent;
  border-top-color: #D4CC6A;
  border-bottom-color: #D4CC6A;
  border-radius: 50%;
  -webkit-animation: loader 3s linear infinite;
    -moz-animation: loader 2s linear infinite;
  -o-animation: loader 2s linear infinite;
  animation: loader 3s linear infinite;
    z-index: 100;
}

#loading-content:after {
  border: 3px solid transparent;
  border-top-color: #84417C;
  border-bottom-color: #84417C;
  border-radius: 50%;
  -webkit-animation: loader 1.5s linear infinite;
  animation: loader 1.5s linear infinite;
    -moz-animation: loader 2s linear infinite;
  -o-animation: loader 2s linear infinite;
    z-index: 100;
}

@-webkit-keyframes loaders {
  0% {
    -webkit-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

@keyframes loader {
  0% {
    -webkit-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

#content-wrapper {
  color: #FFF;
  position: fixed;
  left: 0;
  top: 20px;
  width: 100%;
  height: 100%;
    z-index: 100;
}


#content
{
  width: 800px;
  height: 1000px;
  margin: 0 auto;
  text-align: center;
  background-color: #888;
    z-index: 100;
}

.bg {
	/* The image used */
	background-image:
		url("https://mdbootstrap.com/img/Photos/Others/men.jpg");
	/* Full height */
	width: 100%;
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

/*login*/
* {
	margin: 0px auto;
	box-sizing: border-box;
}

#facebook {
	margin-left: 5px;
	border-radius: 5px;
	border: 1px;
	background-color: #4267b2;
	color: white;
}

#facebook:hover {
	cursor: pointer;
	color: #4267b2;
	background-color: white;
}

#twitter {
	margin-left: 5px;
	border-radius: 10px;
	border: 1px;
	background-color: #3cf;
	color: white;
}

#twitter:hover {
	cursor: pointer;
	color: #3cf;
	background-color: white;
}

#google {
	margin-left: 5px;
	border-radius: 3px;
	border: 0px;
	background-color: #db4437;
	color: white;
}

#google:hover {
	cursor: pointer;
	color: #db4437;
	background-color: white;
}

#warpper {
	width: 100%;
}

#login-div {
	width: 100%;
}

/*login/signup button*/
#login {
	background-color: black;
	border: 2px solid black;
}

#login:hover {
	border: 2px solid #ffffff;
}

#signup {
	background-color: black;
	border: 2px solid black;
}

#signup:hover {
	border: 2px solid #ffffff;
}

#signin {
	color: black;
	background-color: #ffffff;
	border: 2px solid #ffffff;
}

#signin:hover {
	border: 2px solid #feff19;
}

#cancel {
	color: black;
	background-color: #ffffff;
	border: 2px solid #ffffff;
}

#cancel:hover {
	border: 2px solid #feff19;
}

#gender{
   border:0px;
   border-bottom: 1px solid white;
   width: 80%;
   margin: 0px auto;
   color: white;
}
.yes{
   color: blue;
}
#gender #g{
color: black;
}
</style>
<script>

	

$(document).ready(function () {
	$('#loading-wrapper').hide();
    $(".sign").hide();

    $("#signup").click(function () {
        $(".sign").show("slow");
        $("#login").hide();
        $(".login").hide();
        $(".form-control").val("");
    });

    $("#cancel").click(function () {
        $("#login").show();
        $(".sign").hide();
        $(".login").show();
        $(".form-control").val("");
    });
    /*input regex*/
    /*email*/
    document.getElementById("inputIconEx1").onblur = function () {
        var email = $("#inputIconEx1").val();

        if (!emailCheck(email)) {
            $("#inputIconEx1").val("");
            console.log("emali형식이 맞지않습니다");
        }

        function emailCheck(email) {
            var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            return regex.test(email);
        }
    };

    /*ajax */
    document.getElementById("email").onblur = function () {
        var email = $("#email").val();
        if (!emailCheck(email)) {
            $("#email").val("");
            console.log("email형식이 맞지않습니다");
        }

        function emailCheck(email) {
            var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            return regex.test(email);
        }

        console.log(email);
        $.ajax({
            url: "emailcheck.ajax",
            type: "post",
            data: {
                email: email
            },
            success: function (data) {
                console.log("들어옴" + data), $("#emailIcon")
                    .attr("class", data);
                iconColor(data);
            }
        });
    };

    function iconColor(data) {
        console.log(data + "1");
        if (data.indexOf("fa-close") > -1) {
            console.log(data + "2");
            $("#email").val("");
            $("#email").focus();
            $("#emailIcon").css("color", "red");
        } else {
            $("#emailIcon").css("color", "green");
        }
    }

    /*password*/
    $("#inputValidationEx2")
     
    .keypress(
            function () {
                var password = $(
                        "#inputValidationEx2")
                    .val();

                if (blank(password)) {
                    console.log(password);
                    var regex = /\s/g;
                    document
                        .getElementById("inputValidationEx2").value = document
                        .getElementById("inputValidationEx2").value
                        .replace(regex, "");
                };

                function blank(password) {
                    var regex = /\s/g;
                    return regex.test(password);
                };
            });

    /*login button click event*/
    /*    $("#signin").on('click', function () {
           $("userform").attr("action", "signin.do");
       });
    */
    $("#signin").click(function () {
        $("#userform").attr("action", "signin.do");
        $("#userform").submit();
    });

    $("#login").click(function () {
    	$('#loading-wrapper').show();
    	
    	setTimeout(function(){
    		 $("#userform").attr("action", "login.do");
    		 $("#userform").submit();
    	},1000);
    	
      
       
    });

    /* 페이스북 로그인 */
    var checkLoginStatus = function (response) {
        console.log(response);
        // statusChangeCallback(response);

        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            $("#authBtn").val("logout");
            fbLoginAction();
        } else {
            $("#authBtn").val("login");
            // The person is not logged into your app or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this app.';
        }
    };

    window.fbAsyncInit = function () {
        FB.init({
            appId: '1128205587330014',
            cookie: true, // enable cookies to allow the server to access 
            // the session
            xfbml: true, // parse social plugins on this page
            version: 'v2.8' // use graph api version 2.8
        });

        // Now that we've initialized the JavaScript SDK, we call 
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        checkLoginState = function () {
            FB.getLoginStatus(checkLoginStatus);
        }

    };

    // Load the SDK asynchronously
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));


    function fbLoginAction() {
        FB.login(function (response) {
            var fbname;
            var accessToken = response.authResponse.accessToken;
            FB.api('/me?fields=id,name,email', function (resp) {
                console.log(resp);
                var data = JSON.stringify(resp);
                console.log(data);
                $.ajax({
                    url: "fbLogin.ajax",
                    type: "post",
                    data: {
                        data: data
                    },
                    success: function (data) {
                        location.href = data;
                    }
                });


            });
        });
    }
});


</script>
</head>
<body>

<div id="loading-wrapper">
  <div id="loading-text">LOADING</div>
  <div id="loading-content"></div>
</div>

	<!--back ground-->
	<div class="bg view overlay">
		<!--  <div class="">-->

		<div id="warpper" class="mask rgba-black-strong">
			<div id="logo-div" style="text-align: center;">
				<img src="resources/images/logo_white.png" alt="" style="width: 25%">
			</div>
			<form id="userform" method="post">
				<div id="login-div" class="col-lg-3">
					<!-- Material input -->
					<!--email-->
					<div class="row login" style="width: 100%">
						<div class="md-form " style="width: 100%">
							<i class="fa fa-envelope prefix" style="color: white"></i> <input
								type="email" id="inputIconEx1" class="form-control" name="email"
								style="color: white"> <label for="inputIconEx1"
								style="color: white">E-mail address</label>

						</div>
					</div>
					<!--input Email-->
					<div class="row sign" style="width: 100%">
						<div class="md-form " style="width: 100%">
							<i class="fa fa-envelope prefix" style="color: white"
								id="emailIcon"></i> <input type="email" id="email"
								class="form-control" name="mail" style="color: white"> <label
								for="inputIconEx1" style="color: white">E-mail address</label>

						</div>
					</div>
					<!--password-->
					<div class="row" style="width: 100%">
						<div class="md-form " style="width: 100%">
							<i class="fa fa-lock prefix" style="color: white"></i> <input
								type="password" id="inputValidationEx2"
								class="form-control validate" name="pw" style="color: white">
							<label for="inputValidationEx2" data-error="wrong"
								data-success="right" style="color: white"> password</label>

						</div>
					</div>
					<!--name-->
					<div class="row sign" style="width: 100%">
						<div class="md-form " style="width: 100%">
							<i class="fa fa-user-circle prefix" style="color: white"></i> <input
								type="text" id="name" class="form-control " name="name"
								style="color: white"> <label for="name"
								data-error="wrong" data-success="right" style="color: white">
								UserName</label>

						</div>
					</div>
					<!--age-->
					<div class="row sign" style="width: 100%">
						<div class="md-form " style="width: 100%">
							<i class="fa fa-asterisk prefix" style="color: white"></i> <input
								type="text" id="Age" class="form-control" name="age"
								style="color: white"> <label for="Age"
								data-error="wrong" data-success="right" style="color: white">
								Age</label>
						</div>
					</div>
					 <!--gender-->
	               <div class="row sign" style="width: 100%">
	                  <div class="md-form " style="width: 100%">
	                     <i class="fa fa-venus-mars prefix" style="color: white"></i> 
	                     <select class="form-control" id="gender" name="gender" >
	                        <option value="" id="g" disabled selected>Gender</option>
	                        <option value="m" id="m" class="yes">Male</option>
	                        <option value="f" id="f" class="yes">Female</option>
	                     </select>
	                  </div>
	               </div>


					<!--button group-->
					<div id="login-bt-group" style="text-align: center;">
						<button type="button" class="btn aqua-gradient" id="login"
							name="login">User Login</button>
						<button type="button" class="btn login" id="signup" name="signup">Sign
							UP</button>

						<button type="button" class="btn sign" id="signin" name="signin">Sign
							in</button>
						<button class="btn sign" id="cancel" type="button">Cancel</button>
					</div>
					<!--password 찾기-->
					<div class="row forgot-password-row">
						<span class="blue-text text-lighten-1 waves-effect"> <a
							href="../findPw.jsp" style="margin-right: 0px">Forgot
								Password?</a></span>
					</div>
				</div>
			</form>
			<div id="other-bt-group" style="text-align: center;">

				<!-- T
				itle -->
				<h4 class="card-title" style="color: #e9e9e9">
					<strong>Other Login</strong>
				</h4>
				<!-- Subtitle -->

				<!-- Text -->
				<p class="card-text"></p>
				

				<!-- Facebook -->
				<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
				</fb:login-button>
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