<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    <!-- Font Awesome -->
	    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
	    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	    <script type="text/javascript" src="<c:url value='/jquery.easypin.js'/>"></script>
	<style>
		@font-face {
			font-family: 'NanumbarunpenR';
			src: url('resources/fonts/nanumbarunpenr.ttf') format('truetype');
		}
		
		@font-face {
			font-family: 'NanumbarunpenB';
			src: url('resources/fonts/nanumbarunpenb.ttf') format('truetype');
		}
	
		div {
			/* border: 1px solid black; */
			box-sizing: border-box;
		}
		
		body {
			margin: 0px;
			font-family: 'NanumbarunpenR';
		}
		
		#wrapper {
			width: 100%;
			height: 100vh;
		}
		
		#content {
			height: 100vh;
		}
		
		.tag-notification {
			font-size: 12px;
			text-align: center;
		}
		
		.form-control {
			font-size: 12px;
			margin-top: 5px;
		}
		
		.modalContext {
			border: 1px solid black;
		}
		
		.required::before {
			content: "*";
			position: absolute;
			color: orange;
			left: 1px;
		}
		
		.easy-modal {
			text-align: center;
		}
		
		#imgstyle {
			width: 500px;
			height : 500px;
			object-fit: contain;
		}
	</style>
	<title>Write Article</title>
	</head>

	<body>
		<div id="wrapper" class="container-fluid col-md-8">
				<div class="row">
					<div class="md-form form-lg col-md-12">
						<input type="text" id="inputLGEx" class="form-control form-control-lg" readonly disabled="disabled"> 
						<label for="inputLGEx" class="ml-3">공유하고 싶은 아이템에 태그를 달아주세요.</label>
						<br>
						<div class="interactive-image" id="planit" data-toggle="modal" data-target="#styletag">
							<img class="taggd z-depth-3 pin" src="upload/social/${sbdto.photo}" alt="photo" id="imgstyle" easypin-id="image_db"/>
						</div>
					</div>
				</div>

	
			<div class="easy-modal" style="display: none;" modal-position="free">
				<form>
					<div class="tag-notification">EDIT ITEM TAG</div>
					<div class="required">
						<input type="text" class="form-control required" name="name" placeholder="이름 (e.g. 검은색 티셔츠)">
					</div>
					<div class="required">
						<input type="text" class="form-control" name="brand" placeholder="브랜드" />
					</div>
					<input type="text" class="form-control" name="store" placeholder="회사 이름" /> 
					<input type="text" class="form-control" name="url" placeholder="URL" />
					<select name="category" id="category" class="form-control">
						<option value="not" disabled selected>카테고리 선택</option>
						<option value="accessory">액세서리</option>
						<option value="top">상의</option>
						<option value="bottom">하의</option>
						<option value="outer">아우터</option>
						<option value="shoes">신발</option>
						<option value="bag">가방</option>
					</select>
					<br />
					<button type="button" class="btn btn-primary easy-submit">Save Content</button>
				</form>
			</div>
	
			<div style="display: none;" width="130" shadow="true" popover>
				<div style="width: 100%; text-align: center;">{[name]}</div>
			</div>
		</div>
		<script>	
			var $j = jQuery.noConflict();
		    var $instance = $j('.pin').easypin({
		    	init : ${markerdata},
		        modalWidth: 300,
		        done: function (element) {
		            if ($j('input[name="content"]', element).val() != '') {
		                return true;
		            }
		            return false;
		        },
		        markerSrc: '<c:url value='marker.png'/>',
		        editSrc : '<c:url value='edit.png'/>',
		        deleteSrc: '<c:url value='remove.png'/>',
		    });
		
		    // set the 'get.coordinates' event
		    $instance.easypin.event("get.coordinates", function ($instance, data, params) {
		        // console.log(data, params);
		    });
		    	
		    function notsubmit() {
	            let num = 0;
	            //let obj = {};
	            let obj = [];
	            let clothesInformation = {};
	            
		        $instance.easypin.fire("get.coordinates", { param1: 1, param2: 2, param3: 3 }, function (data) {
		            $instance.easypin.fire("get.coordinates", function (data) {
		                let jcloinfo = JSON.stringify(data);
		                let cloinfo = JSON.parse(jcloinfo);
		                // console.log(cloinfo);
		
		                if (cloinfo === null) {
		                    return;
		                }
		
			            let cinfo = cloinfo["image_db"];
		
		                for (key in cinfo) {
		                    if (!(cinfo[key]["name"] === undefined) && !(key == "canvas") && !(cinfo[key]["name"] == "") && !(cinfo[key]["brand"] == "")) {
		                        if (!(cinfo[key]["name"].match(/^\s/g)) && !(cinfo[key]["brand"].match(/^\s/g))) {
		                            // cinfo[key]["num"] = num;
		                            //obj[num] = cinfo[key];
		                            //num++;
		                            
		                            if(cinfo[key]["key"] === undefined){
		                            	// console.log("정의되지 않음");
			                            cinfo[key]["key"] = "un";
		                            }
		                            
		                            obj.push(cinfo[key]);
		                            // console.log(obj);
		                        }
		                    }
		                }
		
		                //obj["canvas"] = { "src": "upload/social/${sfileName}", "width": "500", "height": "500" };
		
		                //clothesInformation["image_db"] = obj;
		                clothesInformation = obj;
		                //console.log(clothesInformation);
		
		                // localStorage.setItem("clothesInformation", JSON.stringify(clothesInformation));
		
		                //location.href = "test2.html";
		            });
		        });
		        
		        let stylename = document.getElementById("stylename").value;
		        let stylecontent = document.getElementById("textareaPrefix").value;
		        
		        if(stylename === "") {
		        	alert("스타일 이름을 정해주세요");
		        	return false;	
		        }else if(stylecontent === ""){
		        	alert("스타일을 소개해 주세요.");
		        	return false;
		        }
		        
		        // 제출 하기전 
		        //console.log(clothesInformation);
		        document.getElementById("taginfo").value = JSON.stringify(clothesInformation);
		        //console.log(document.getElementById("taginfo").value);
		        
		       	document.getElementById("submitInfo").submit();
		    }
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