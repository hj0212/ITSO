<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function() {
		$("#mypagebtn").click(function() {
			location.href="mypage.go";
		})
	})
</script>
</head>


<body>
<<<<<<< Updated upstream
	<%@include file="navi.jsp" %>
	
<<<<<<< Updated upstream
	<button id="mypagebtn" type="button" class="btn btn-primary">Primary</button>
=======
=======
	<nav class="mb-1 navbar navbar-expand-lg navbar-dark"> <a
		class="navbar-brand" href="#"><img id="logo" alt=""
		src="resources/images/logo_white_no.png"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent-3"
		aria-controls="navbarSupportedContent-3" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent-3">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="#">스타일 피드 <!-- <span class="sr-only">(current)</span> -->
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
		</ul>
		<ul class="navbar-nav ml-auto nav-flex-icons">
			<li class="nav-item"><a
				class="nav-link waves-effect waves-light"> <i
					class="fa fa-twitter"></i>알림
			</a></li>
			<li class="nav-item"><a
				class="nav-link waves-effect waves-light"> <i
					class="fa fa-google-plus"></i>메시지
			</a></li>
			<li class="nav-item"><a
				class="nav-link waves-effect waves-light"> <i
					class="fa fa-google-plus"></i>피드에 글쓰기
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-user"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right dropdown-default"
					aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a> <a
						class="dropdown-item" href="#">Something else here</a>
				</div></li>			
		</ul>
	</div>
	</nav>

 <div class="py-1">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="">
            <b>DAILY LOOK</b>&nbsp;</h1>
        </div>
      </div>
    </div>
  </div>
  <div class="">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/resource.jpg" alt="Card image cap">
            <div class="card-body">
              <h6 class="card-title border m-0 p-0 d-inline-flex">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;
                <br>ID :
                <br>ID :</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/2222.jpg" alt="Card image cap">
            <div class="card-body">
              <h6 class="card-title p-0 m-0 d-inline-flex" contenteditable="true">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;&nbsp;
                <br>ID :&nbsp;
                <br>ID :</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top border" src="resources/images/4444.jpg" alt="Card image cap">
            <div class="card-body">
              <h6 class="card-title d-inline-flex p-0 m-0">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;&nbsp;
                <br>ID :&nbsp;
                <br>ID :</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/333333.jpg" alt="Card image cap">
            <div class="card-body">
              <h6 class="card-title d-inline-flex m-0 p-0">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;&nbsp;
                <br>ID :&nbsp;
                <br>ID :</p>
            </div>
          </div>
        </div>
      </div>
      <div class="row py-3">
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/640x640.jpgSDASDASDSADSADASD.jpg" alt="Card image cap">
            <div class="card-body">
              <h6 class="card-title m-0 p-0 d-inline-flex">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;
                <br>&nbsp;ID :&nbsp;
                <br>ID :</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/SDASDSADSADADSA.jpg" alt="Card image cap">
            <div class="card-body">
              <h6 class="card-title p-0 m-0 d-inline-flex">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;
                <br>&nbsp;ID :
                <br>&nbsp;ID :</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/ASDASDASDSADSADSADSA.jpg" alt="Card image cap">
            <div class="card-body">
              <h6 class="card-title m-0 p-0 d-inline-flex">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;
                <br>&nbsp;ID :&nbsp;
                <br>ID :</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top img-fluid" src="resources/images/ADSADSADAS.jpg" alt="Card image cap" width="100" height="100">
            <div class="card-body">
              <h6 class="card-title d-inline-flex m-0 p-0">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;
                <br>ID :&nbsp;
                <br>ID :</p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/구찌.jpg" alt="Card image cap">
            <ul class="list-group list-group-flush">
              <li class="list-group-item">SHOOSE :</li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/린넨선캡.jpg" alt="Card image cap">
            <ul class="list-group list-group-flush">
              <li class="list-group-item">HAT :</li>
              <li class="list-group-item">TOP :&nbsp;</li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/셀린느 가방.JPG" alt="Card image cap">
            <ul class="list-group list-group-flush">
              <li class="list-group-item">BAG :</li>
              <li class="list-group-item">WALET :</li>
              <li class="list-group-item">ETC :</li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/입생로랑 백.jpg" alt="Card image cap">
            <ul class="list-group list-group-flush">
              <li class="list-group-item">BAG :</li>
              <li class="list-group-item">DIARY :</li>
              <li class="list-group-item">ETC :</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5" >
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/선글라스.jpg" alt="Card image cap">
            <ul class="list-group list-group-flush">
              <li class="list-group-item">ACC :</li>
              <li class="list-group-item">L I P :</li>
              <li class="list-group-item">ETC :</li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/S여리여리남.jpg" alt="Card image cap">
            <div class="card-body">
              <h6 class="card-title m-0 p-0 border" contenteditable="true">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;&nbsp;
                <br>ID :&nbsp;
                <br>ID :</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/Z커플.png" alt="Card image cap">
            <div class="card-body">
              <h6 class="card-title m-0 p-0 d-inline-flex">YYYY-MM-DD</h6>
              <p class="card-text">ID : &nbsp;&nbsp;
                <br>ID :&nbsp;
                <br>ID :</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <img class="card-img-top" src="resources/images/블로퍼.jpg" alt="Card image cap">
            <ul class="list-group list-group-flush">
              <li class="list-group-item">BAG :</li>
              <li class="list-group-item">SHOOSE :</li>
              <li class="list-group-item">BOTTOM :</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12"></div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

>>>>>>> Stashed changes

>>>>>>> Stashed changes
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