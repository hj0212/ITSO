<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    <!-- Font Awesome -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
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
	
	.interactive-image {
		background: url("style1-2.jpg");
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
			<p>여기는 네비 인클루드</p>
		</div>
		<form id="submitInfo" method="post" action="test.go">
			<div class="row" name="top">
				<div class="md-form form-lg col-md-12">
					<input type="text" id="stylename" class="form-control form-control-lg" name="stylename"> 
					<label for="stylename" class="ml-3">스타일 이름을 정해주세요.</label>
				</div>
			</div>
			<div class="row">
				<div class="md-form form-lg col-md-12">
					<input type="text" id="inputLGEx" class="form-control form-control-lg" readonly disabled="disabled"> 
					<label for="inputLGEx" class="ml-3">공유하고 싶은 아이템에 태그를 달아주세요.</label>
					<br>
					<div class="interactive-image" id="planit" data-toggle="modal" data-target="#styletag">
						<img class="taggd z-depth-3 pin" src="upload/social/${sfileName}" alt="photo" id="imgstyle" easypin-id="image_db"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="md-form form-lg col-md-12">
					<i class="fas fa-pencil-alt"></i>
					<textarea type="text" id="textareaPrefix" class="form-control md-textarea" rows="3" name="stylecontent"></textarea>
					<label for="textareaPrefix" class="ml-3">스타일을 소개해 주세요.</label>
				</div>
			</div>
			<div class="row">
				<div class="md-form form-lg col-md-12">
					<input type="text" id="cate" class="form-control form-control-lg"
						readOnly placeholder="카테고리 항목에 가장 적합한 한 가지를 선택해 주세요.">
				</div>
				<span class="col-md-12">1. 성별</span>
				<!-- Group of default radios - option 1 -->
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input" id="defaultGroupExample1" name="gender" value="m">
					<label class="custom-control-label" for="defaultGroupExample1">남</label>
				</div>
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input" id="defaultGroupExample2" name="gender" checked value="f">
					<label class="custom-control-label" for="defaultGroupExample2">여</label>
				</div>
				<!-- Group of default radios - option 3 -->
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input" id="defaultGroupExample3" name="gender" value="t">
					<label class="custom-control-label" for="defaultGroupExample3">남,여</label>
				</div>
			</div>
			<div class="row my-2"></div>

			<div class="row">
				<span class="col-md-12">2. 나이</span>

				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input" id="defaultGroupExample4" name="age" value="10">
					<label class="custom-control-label" for="defaultGroupExample4">10대</label>
				</div>
				<!-- Group of default radios - option 3 -->
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input" id="defaultGroupExample5" name="age" checked value="20"> 
					<label class="custom-control-label" for="defaultGroupExample5">20대</label>
				</div>
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input" id="defaultGroupExample6" name="age" value="30">
					<label class="custom-control-label" for="defaultGroupExample6">30대</label>
				</div>
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input" id="defaultGroupExample7" name="age" value="40">
					<label class="custom-control-label" for="defaultGroupExample7">40대</label>
				</div>
				<div class="custom-control custom-radio col-md-12 ml-5">
					<input type="radio" class="custom-control-input" id="defaultGroupExample8" name="age" value="0">
					<label class="custom-control-label" for="defaultGroupExample8">기타(10세이하/50세 이상)</label>
				</div>
			</div>
			<div class="row">
				<div class="md-form form-lg col-md-12 my-2"></div>
			</div>

			<div class="row">
				<input type="button" class="btn btn-deep-purple" value="ITSO?" onclick="notsubmit()">
				<a href="#top" class="btn btn-deep-purple ml-auto"><i class="fas fa-arrow-up"></i></a>
			</div>
			<input type="text" name="taginfo" readonly style="display:none" id="taginfo">
			<input type="text" name="imageinfo" readonly style="display:none" id="imageinfo" value="${sfileName}">
		</form>
		

		<div class="easy-modal" style="display: none;" modal-position="free">
			<form>
				<div class="tag-notification">EDIT ITEM TAG</div>
				<div class="required">
					<input type="text" class="form-control required" name="name" placeholder="이름 (e.g. 검은색 티셔츠)">
				</div>
				<input type="text" class="form-control" name="brand" placeholder="상품 이름" />
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
		
		
		<!-- <button class="coords btn btn-primary">nonon</button> -->
		
		<!-- MODAL -->
<!-- 		<div class="modal fade" id="styletag" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<form>
					<div class="modal-content">
						<div class="modal-header text-center">
							<h4 class="modal-title w-100 font-weight-bold">아이템 태그 설명</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body mx-3">
							<div class="md-form mb-4">
								<i class="prefix grey-text"></i> <input type="text" id="form3"
									class="form-control validate"> <label
									data-error="wrong" data-success="right" for="form3">아이템
									이름</label>
							</div>

							<div class="md-form mb-4">
								<i class="prefix grey-text"></i> <input type="text" id="form4"
									class="form-control validate"> <label
									data-error="wrong" data-success="right" for="form4">브랜드
									이름/매장 이름</label>
							</div>

							<div class="md-form mb-4">
								<i class="prefix grey-text"></i> <input type="text" id="form5"
									class="form-control validate"> <label
									data-error="wrong" data-success="right" for="form5">URL</label>
							</div>

						</div>
						<div class="modal-footer d-flex justify-content-center">
							<button class="btn btn-indigo">추가하기</button>
						</div>
					</div>
				</form>
			</div>
		</div> -->
	</div>
	<script>	
	    var $instance = $('.pin').easypin({
	        modalWidth: 300,
	        done: function (element) {
	            if ($('input[name="content"]', element).val() != '') {
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
	        console.log(data, params);
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
	                console.log(cloinfo);
	
	                if (cloinfo === null) {
	                    return;
	                }
	
		            let cinfo = cloinfo["image_db"];
	
	                for (key in cinfo) {
	                    if (!(cinfo[key]["name"] === undefined) && !(key == "canvas") && !(cinfo[key]["name"] == "")) {
	                        if (!(cinfo[key]["name"].match(/^\s/g))) {
	                            // cinfo[key]["num"] = num;
	                            cinfo[key].coords.lat = Number(cinfo[key].coords.lat) + 23;
	                            cinfo[key].coords.along = Number(cinfo[key].coords.along) + 40;
	                            //obj[num] = cinfo[key];
	                            //num++;
	                            
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
	        console.log(clothesInformation);
	        document.getElementById("taginfo").value = JSON.stringify(clothesInformation);
	        console.log(document.getElementById("taginfo").value);
	        
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
	<script>
 /* 	var image = $("#imgstyle");
	 document.getElementById('imgstyle'); 
	var options = {};
	var data = [
		  Taggd.Tag.createFromObject({
		    position: { x: 0.19, y: 0.4 },
		    text: 'This is a tree',
		  }),
		  Taggd.Tag.createFromObject({
		    position: { x: 0.5, y: 0.3 },
		    text: 'Pretty sure this is also a tree',
		  }),
		  Taggd.Tag.createFromObject({
		    position: { x: 0.775, y: 0.5 },
		    text: 'Can you guess this one?',
		  }),
		];

		var taggd = new Taggd(image, options, data);  */
	</script>
</body>

</html>