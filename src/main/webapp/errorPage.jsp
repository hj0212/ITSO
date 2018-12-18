<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css" rel="stylesheet">
	<style>
        .error-background {
            background: url("resources/images/error-background2.jpg") no-repeat center center fixed; 
            background-size: cover;            
        }

        .move-btn {
            background-color: #1B0946;
        }

        .move-btn {
            color : white;
        }
        
        .error-box {
        	margin-top : 150px;
        }
	</style>
</head>
<body>
	<%@include file="navi.jsp"%>
    <div class="container error-box">
       <div class="row">
            <div class="col-md-12">
                <div class="card card-image error-background">
                    <div class="text-black text-center py-5 px-4 my-5">
                        <div>
                            <h1 class="card-title pt-3 mb-5 font-bold"><strong>Error!</strong></h1>
                            <p class="mx-5">존재하지 않는 주소를 입력하셨거나,</p>
                            <p class="mx-5">요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.</p>
                            <button class="btn move-btn" id="back-btn">뒤로가기</button>
                            <button class="btn move-btn" id="main-btn">메인으로</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<script>
		$(document).ready(function(){
			$("#back-btn").click(function(){
				window.history.back();
			})
			
			$("#main-btn").click(function(){
				location.href="main.go";
			})
		})
	</script>
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