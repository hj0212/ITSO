<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script type="text/javascript" src="<c:url value='/jquery.easypin.js'/>"></script>
    <title>Document</title>
    <style>
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
    </style>
</head>

<body>
    <div class="pin-container" style="width:500px; height:500px">
        <div class="pin-containers inner">
            <img src="upload/social/${src}" class="pin" width="500" height="500" easypin-id="image_db">
        </div>
        <div class="image-containers inner">
            <img src="upload/social/${src}" width="500" height="500">
        </div>
    </div>

    <div style="display:none;" easypin-tpl>
        <popover>
        </popover>

        <marker>
            <div style="border:solid 1px #1B0946; width:15px;height:15px; background-color:black; border-radius: 50%" class="clothes-marker" id="clothes-marker"></div>
        </marker>
    </div>
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
        	};
        	
        });
    </script>
        <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
        crossorigin="anonymous">
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