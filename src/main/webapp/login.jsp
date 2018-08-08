<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>It So</title>
    <style>
        /*body back ground*/

        body,
        html {
            width: 100%;
            height: 120vh;
        }

        .bg {
            /* The image used */
            background-image: url("https://mdbootstrap.com/img/Photos/Others/men.jpg");

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

    </style>
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            $(".sign").hide();

            $("#signup").click(function() {
                $(".sign").show("slow");
                $("#signup").text("Sign In");
                $("#signup").attr("id", "signin");
                $("#login").hide();
                $(".form-control").val("");
            });

            $("#cancel").click(function() {
                $("#login").show();
                $(".sign").hide("slow");
                $("#signin").text("Sign Up");
                $("#signin").attr("id", "signup");
                $(".form-control").val("");
            });
            /*input regex*/
            /*email*/
            document.getElementById("inputIconEx1").onblur = function() {
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
            /*password*/
            $("#inputValidationEx2").keypress(function() {
                var password = $("#inputValidationEx2").val();

                if (blank(password)) {
                    console.log(password);
                    var regex = /\s/g;
                    document.getElementById("inputValidationEx2").value = document.getElementById("inputValidationEx2").value.replace(regex, "");
                };


                function blank(password) {
                    var regex = /\s/g;
                    return regex.test(password);
                };
            });

            /*login button click event*/
			$("#signin").click(function(){
				$("userform").attr("action","signin.do");
			});
            
            $("#login").click(function(){
            	$("#userform").attr("action","login.do");
            	$("#userform").submit();
            });
			
        });

    </script>


</head>

<body>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css" rel="stylesheet">

    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>

    <!--back ground-->
    <div class="bg view overlay">
        <!--  <div class="">-->

        <div id="warpper" class="mask rgba-black-strong">
            <div id="logo-div" style="text-align: center;"><img src="resources/images/logo_white.png" alt="" style="width:25%"></div>
            <form id="userform"  method="post">
                <div id="login-div" class="col-lg-3">
                    <!-- Material input -->
                    <!--email-->
                    <div class="row" style="width: 100%">
                        <div class="md-form " style="width: 100%">
                            <i class="fa fa-envelope prefix" style="color: white"></i>
                            <input type="email" id="inputIconEx1" class="form-control" name="email" style="color: white">
                            <label for="inputIconEx1" style="color: white">E-mail address</label>

                        </div>
                    </div>
                    <!--password-->
                    <div class="row" style="width: 100%">
                        <div class="md-form " style="width: 100%">
                            <i class="fa fa-lock prefix" style="color: white"></i>
                            <input type="password" id="inputValidationEx2" class="form-control validate" name="pw" style="color: white">
                            <label for="inputValidationEx2" data-error="wrong" data-success="right" style="color: white"> password</label>

                        </div>
                    </div>
                    <!--name-->
                    <div class="row sign" style="width: 100%">
                        <div class="md-form " style="width: 100%">
                            <i class="fa fa-user-circle prefix" style="color: white"></i>
                            <input type="text" id="name" class="form-control " name="name" style="color: white">
                            <label for="name" data-error="wrong" data-success="right" style="color: white"> UserName</label>

                        </div>
                    </div>
                    <!--age-->
                    <div class="row sign" style="width: 100%">
                        <div class="md-form " style="width: 100%">
                            <i class="fa fa-asterisk prefix" style="color: white"></i>
                            <input type="text" id="Age" class="form-control " name="age" style="color: white">
                            <label for="Age" data-error="wrong" data-success="right" style="color: white"> Age</label>
                        </div>
                    </div>
                    <!--gender-->
                   
                  

                    <!--button group-->
                    <div id="login-bt-group" style="text-align: center;"><button type="button" class="btn aqua-gradient" id="login" name="login">User Login</button>
                        <button type="button" class="btn " id="signup" name="signup">Sign UP</button>
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

                <!-- Title -->
                <h4 class="card-title" style="color: #e9e9e9"><strong>Other Login</strong></h4>
                <!-- Subtitle -->

                <!-- Text -->
                <p class="card-text">
                </p>

                <!-- Facebook -->
                <button type="button" class="btn-floating btn-lg btn-fb" id="facebook"><i class="fa fa-facebook"></i></button>
                <button type="button" class="btn-floating btn-lg btn-tw" id="twitter"><i class="fa fa-twitter"></i></button>
                <!--Google +-->
                <button type="button" class="btn-floating btn-lg btn-gplus" id="google"><i class="fa fa-google-plus"></i></button>

            </div>



        </div>


    </div>

</body>
</html>