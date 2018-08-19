<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script type="text/javascript" src="jquery.easypin.js"></script>
    <title>Document</title>
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
</head>
<body>
    <div>네비게이션으로 넣을곳!</div>
    <div class="container">
        <form id="submitInfo" method="post" action="insertSocial.go">
            <div class="row" name="top">
                <div class="col-sm-12">
                    <div class="md-form form-lg">
                        <input type="text" id="stylename" name="stylename" maxlength="80" class="form-control form-control-lg">
                        <label for="stylename">스타일 제목을 정해주세요.</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="md-form form-lg">
                        <input type="text" id="ipdisabled" class="form-control form-control-lg" disabled>
                        <label for="ipdisabled" class="disabled">공유하고 싶은 아이템에 태그를 달아주세요</label>
                        <img class="pin" src="upload/social/${sfileName}" alt="photo" id="imgstyle" easypin-id="image_db"/>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="md-form form-lg">
                        <i class="fas fa-pencil-alt"></i>
                        <textarea type="text" id="textareaPrefix" class="form-control md-textarea" rows="3" name="stylecontent" maxlength="166"></textarea>
                        <label for="textareaPrefix">스타일을 소개해 주세요.</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="md-form form-lg">
                        <input type="text" id="rddisabled" class="form-control form-control-lg" disabled>
                        <label for="rddisabled" class="disabled">카테고리 항목에 적합한 한 가지를 선택해주세요</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <span>1.성별</span>
                    <div class="custom-control custom-radio ml-2">
                        <input type="radio" class="custom-control-input" id="genderGroup1" name="gender" value="m" checked>
                        <label class="custom-control-label" for="genderGroup1">남</label>
                    </div>
                    <div class="custom-control custom-radio ml-2">
                        <input type="radio" class="custom-control-input" id="genderGroup2" name="gender" value="f">
                        <label class="custom-control-label" for="genderGroup2">여</label>
                    </div>
                    <div class="custom-control custom-radio ml-2 mb-3">
                        <input type="radio" class="custom-control-input" id="genderGroup3" name="gender" value="g">
                        <label class="custom-control-label" for="genderGroup3">무관</label>
                    </div>
                    <span class="">2.나이</span>
                    <div class="custom-control custom-radio ml-2">
                        <input type="radio" class="custom-control-input" id="ageGroup1" name="age" value="10" checked>
                        <label class="custom-control-label" for="ageGroup1">10대</label>
                    </div>
                    <div class="custom-control custom-radio ml-2">
                        <input type="radio" class="custom-control-input" id="ageGroup2" name="age" value="20">
                        <label class="custom-control-label" for="ageGroup2">20대</label>
                    </div>
                    <div class="custom-control custom-radio ml-2">
                        <input type="radio" class="custom-control-input" id="ageGroup3" name="age" value="30">
                        <label class="custom-control-label" for="ageGroup3">30대</label>
                    </div>
                    <div class="custom-control custom-radio ml-2">
                        <input type="radio" class="custom-control-input" id="ageGroup4" name="age" value="40">
                        <label class="custom-control-label" for="ageGroup4">40대</label>
                    </div>
                    <div class="custom-control custom-radio ml-2 mb-3">
                        <input type="radio" class="custom-control-input" id="ageGroup5" name="age" value="0">
                        <label class="custom-control-label" for="ageGroup5">모든 연령</label>
                    </div>
                </div>

                <input type="button" class="btn btn-deep-purple" value="ITSO?" onclick="notsubmit()">
                <a href="#top" class="btn btn-deep-purple ml-auto"><i class="fas fa-arrow-up"></i></a>

                <input type="text" name="taginfo" readonly style="display:none" id="taginfo">
				<input type="text" name="imageinfo" readonly style="display:none" id="imageinfo" value="${sfileName}">
            </div>
        </form>
        
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
	           let obj = [];
	           let clothesInformation = {};
	           
	        $instance.easypin.fire("get.coordinates", { param1: 1, param2: 2, param3: 3 }, function (data) {
	            $instance.easypin.fire("get.coordinates", function (data) {
	                let jcloinfo = JSON.stringify(data);
	                let cloinfo = JSON.parse(jcloinfo);
	
	                if (cloinfo === null) {
	                    return;
	                }
	
		            let cinfo = cloinfo["image_db"];
	
	                for (key in cinfo) {
	                    if (!(cinfo[key]["name"] === undefined) && !(key == "canvas") && !(cinfo[key]["name"] == "") && !(cinfo[key]["brand"] == "")) {
	                        if (!(cinfo[key]["name"].match(/^\s/g)) && !(cinfo[key]["brand"].match(/^\s/g))) {
	                            //cinfo[key].coords.lat = Number(cinfo[key].coords.lat) + 23;
	                            //cinfo[key].coords.along = Number(cinfo[key].coords.along) + 40;
	                            if(cinfo[key]["key"] === undefined){
		                            cinfo[key]["key"] = "un";
	                            }
	                            obj.push(cinfo[key]);
	                        }
	                    }
	                }
	                clothesInformation = obj;
	            });
	        });
	        
	        let stylename = document.getElementById("stylename").value;
	        let stylecontent = document.getElementById("textareaPrefix").value;
	        
	        if(stylename === "") {
	        	alert("스타일 이름을 정해주세요");
	        	return false;	
	        }
	        
	        if(stylecontent === ""){
	        	alert("스타일을 소개해 주세요.");
	        	return false;
	        }

	        document.getElementById("taginfo").value = JSON.stringify(clothesInformation);
	       	document.getElementById("submitInfo").submit();
	    }
	</script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
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