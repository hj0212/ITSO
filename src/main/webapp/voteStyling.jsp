<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Styling 게시판 투표 글쓰기</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--   ---------CDN 모음 ------------------------------------------  -->
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!--   ---------CDN 모음 끝------------------------------------------  -->

<style>
#wrapper {
	min-height: 100%;
	position: relative;
	margin-bottom: 100px; /* footer height */
}

div {
	/* border: 1px solid black; */
	box-sizing: border-box;
}

body {
	margin: 0px;
	font-family: 'NanumbarunpenR';
	font-size: 20px;
}

@font-face {
	font-family: 'NanumbarunpenR';
	src: url('resources/fonts/nanumbarunpenr.ttf') format('truetype');
}

@font-face {
	font-family: 'NanumbarunpenB';
	src: url('resources/fonts/nanumbarunpenb.ttf') format('truetype');
}

#wrapper {
	width: 100%;
 min-width:490px; 
}

@media (max-width: 576px) {
.btmrow{
float:left;
}
}

#voteitemimg {
	width: 10%;
}

#voteitemdiv {
	width: 100%;
}

#wrapper img {
	border: 0.3px solid lightgray;
	text-align: center;
	vertical-align: middle;
}

input[type="file"] {
	border: 0px;
}

#voteitemimg, .selimg {
	width: 100px;
	height: 100px;
}

.imgsel {
	width: 70%;
}

.btnsdiv a {
	box-shadow: 0px;
	width: 10%;
}

</style>

</head>


<body>
	<%@include file="navi.jsp"%>
	<div class="row my-5"></div>
	<div id="wrapper" class="container-fluid col-md-8">

		<%-- <c:set var="counter" value="1" type="integer"> --%>
		<div class="row my-2"></div>
		<form method="post" action="insertStylingVote.style" id="voteform" enctype="multipart/form-data">
			<div class="row z-depth-3 hoverable" id="toprow">
				<h4>투표주제</h4>
				<div class="md-form form-lg col-md-12 file-upload mt-0">
					<div class="md-form form-md form-group">
						<input type="text" id="votetitleid" name="styling_title"
							class="form-control col-md-9 float-right" maxlength="50"> <label
							for="votetitleid" class="offset-md-3 my-0 font-weight-bold"
							id="votelabel">제목을 입력해주세요.</label>
					</div>
					<div class="md-form form-md form-group">
						<input type="text" id="votecontentsid" name="styling_contents"
							class="form-control col-md-9 float-right" maxlength="90"
							placeholder="내용을 입력해주세요.">
					</div>
					<div class="media-body image-upload-wrap form-group"
						id="voteitemdiv">
						<img class="d-flex file-upload-image" src="" alt="사진 없음"
							id="voteitemimg"> <input type="file"
							name="votetitleimgfile" id="imgfile0" onchange="readURL(this);"
							class="file-upload-input form-control" accept="image/*" />
					</div>
				</div>
			</div>
			<hr />

			<div class="row">
				<h4 class="mb-0">투표항목</h4>
				<a class="btn btn-outline-indigo btn-sm waves-effect px-0 py-0"
					id="addvotebtn"> <i class="fa fa-plus" aria-hidden="true"></i>
				</a>
				<div class="md-form form-lg col-md-12 mt-0">
					<table class="table table-borderless" id="itemtb">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">아이템 소개</th>
							</tr>
						</thead>
						<tbody id="itemlist">
							<tr class="z-depth-3 hoverable">
								<th scope="row"></th>
								<td>
									<div class="media">
										<div class="media-img">
											<img class="d-flex mr-3 selimg" src="" alt="후보사진"> <input
												type="file" name="voteimgfile[]" id="imgfile1"
												class="file-upload-input form-control filesel"
												onchange="readURL(this);" accept="image/*">
										</div>

										<div class="media-body image-upload-wrap form-group"
											id="btnsdiv">
											
											<a class="delvotebtn"> <i
												class="fa fa-minus fa-1x indigo-text" aria-hidden="true"></i>
											</a><br>
											<div class="md-form form-sm">
												<input type="text" id="vitemtext" class="form-control itemconts"
													name="styling_vote_item_contents[]"> <label
													for="vitemtext">아이템을 소개해 주세요.</label>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>


			<div class="row">

				<!-- <input type="text" id="cate" class="form-control form-control-lg"
						readOnly placeholder="종료방법"> -->
				<h4>종료방법</h4>

				<span class="col-md-12"></span>
				<!-- Group of default radios - option 1 -->
				<!-- 	<div class="col-md-12 ml-5"> -->
				<div class="col custom-control custom-radio col-md-3  ml-2">
					<input type="radio" class="custom-control-input"
						name="styling_endsel" id="defaultGroupExample1" value="1">
					<label class="custom-control-label" for="defaultGroupExample1">기간</label><i
						class="fa fa-calendar" aria-hidden="true">:</i>
				</div>
				<div class="col">
					<input type="text" id="datepicker" name="datepickerval" disabled readOnly
						class="form-control form-control-sm col-md-4"> <input
						type="hidden" name="styling_endtermtxt" id="realterm">
				</div>
			</div>
			<!-- </div> -->
			<div class="row" id="voterrow">
				<div class="col custom-control custom-radio col-md-3  ml-2">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample2" name="styling_endsel" value="2">
					<label class="custom-control-label" for="defaultGroupExample2">참여자수:</label>

				</div>
				<div class="col">
					<input type="text" class="form-control form-control-sm col-md-4"
						readOnly id="votenum" placeholder="명" name="styling_voternumtxt" maxlength="12" oninput="maxLengthCheck(this)"/>
				</div>

			</div>
			<div class="row">
				<div class="custom-control custom-radio col-md-12 ml-2">
					<input type="radio" class="custom-control-input"
						id="defaultGroupExample3" name="styling_endsel" value="3">
					<label class="custom-control-label" for="defaultGroupExample3">종료
						없음</label>
				</div>
			</div>
			<input type="hidden" name="styling_end" id="radioresult">
			<div class="row my-2"></div>

			<div class="row">
				<div class="md-form form-lg col-md-12 my-2"></div>
			</div>

			<div class="row btmrow">
				<button class="btn btn-indigo" type="button" id="itsobtn">itso?</button>
				<a href="#top" class="btn btn-indigo ml-auto"><i
					class="fa fa-arrow-up" aria-hidden="true"></i></a>
			</div>
		</form>
	</div>
	<%@include file="footer.jsp"%>
	<!-- JQuery -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>

	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		document.oncontextmenu = function(e) {
			return false;
		};
		
		document.getElementById("votenum").oninput = function() { 
            var txt = document.getElementById("votenum").value;
            var regex = /[^0-9]/; 
            if (regex.test(txt) == true) {
                document.getElementById("votenum").value = "";
            } else {}
        }	

		/* $('.file-upload-input').attr('onchange',onChange()); */
		/* function onChange()
		onchange="readURL(this);" */
		
		/* $('.itemtb').on('change',function(){
			$('#itemlist tr th').val($("#itemlist").prev('tr').length);
		}) */
		
		function numbering(){
			var totaltr = $('#itemlist tr').length;
			console.log("tr 개수:"+totaltr);
			for(var i=1; i<=totaltr+1; i++){
				$('#itemlist').find('tr:nth-of-type('+i+')>th').text(i);
			}
		}
		numbering();
			
		/* $('#addvotebtn, .upvotebtn, .downvotebtn, .delvotebtn').on('click',function(){
			
		}) */
		
		  function maxLengthCheck(object){
			   if (object.value.length > object.maxLength){
			    object.value = object.value.slice(0, object.maxLength);
			   }    
			  }
			
		function readURL(input) {
			console.log(input.id);
			console.log(input.files[0].name);
			var inputId = input.id;
			console.log(document.getElementById(inputId));
			var imageId = document.getElementById(inputId).parentElement.children[0];

			console.log(imageId);
			var imagesrc = imageId.src;
			console.log(imagesrc);
			/*  console.log(imageId.src); */
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					imageId.src = e.target.result;
					/* imagesrc = e.target.result; */
					$('.image-title').html(input.files[0].name);
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				removeUpload();
			}
		}
		count = 1;
		counter =10;
		$("#addvotebtn")
				.on(
						"click",
						function() {
							if (count < 6) {
								count++;
								counter++;
								console.log(count);
								$('#itemlist')
										.append(
												'<tr class="z-depth-3 hoverable"><th scope="row">'
														+ '</th>'
														+ '<td><div class="media"><div class="media-img"><img class="d-flex mr-3 selimg" src="" alt="후보사진">'
														+ '<input type="file" name="voteimgfile[]" id="imgfile'
														+ counter
														+ '" class="file-upload-input form-control filesel"'
														+ 'onchange="readURL(this);" accept="image/*"></div>'
														+ '<div class="media-body image-upload-wrap form-group" id="btnsdiv">'	
														+ '<a class="delvotebtn"> <i class="fa fa-minus fa-1x indigo-text" aria-hidden="true"></i></a><br>'
														+ '<div class="md-form form-sm"><input type="text" id="vitemtext'+count+'" class="form-control itemconts" name="styling_vote_item_contents[]"><label for="itemtext'+count+'">아이템의 특징을 간단히 적어주세요.</label>'
														+ '</div></div></div></td></tr>');
							} else if (count == 6) {
								alert("투표 항목은 6개까지 추가할 수 있습니다.")
							}
							numbering();
						})

		$(document).on('click', '.delvotebtn', function() {
			var wraptr = $(this).closest("tr");
			$(this).closest("tr").remove();
			count--;
			numbering();
			/* var arr = wraptr.nextAll('tr').children('th');
			for(i=0 i<arr.size i++){
				arr 이거... 해야됨 ㅋㅋㅋㅋ 지우면 숫자 안바뀜
			} */
		})

		$(document).on('click', '.upvotebtn', function() {			
			/* if($(this)==$('#itemlist >tr')){} */
			var nowtr = $(this).closest('#itemlist tr');
			var prevtr = $(this).closest('#itemlist tr').prev('tr');
			console.log(prevtr);
		
			
			if(nowtr != $('#itemlist > tr')){
				var nowdata= $(this).closest('#itemlist tr').find('.media');
				var prevdata= $(this).closest('#itemlist tr').prev('tr').find('.media');				
				prevtr.find('td').html(nowdata);
				nowtr.find('td').html(prevdata);
			}
				
			/* var number = parseInt($(this).closest('td').siblings('th').text()); */
			/* wraptr.find('td').insertBefore(wraptr.prev()); */		 
		})

		$(document).on('click', '.downvotebtn', function() {
			var nowtr = $(this).closest('tr');
			var nexttr = $(this).closest('tr').next('tr');
			
			var nowdata= $(this).closest('tr').find('.media');
			var nextdata= $(this).closest('tr').next('tr').find('.media');
			
			nexttr.find('td').html(nowdata);
			nowtr.find('td').html(nextdata);		
		/* 	var wraptr = $(this).closest('tr');
			var wrapnext = $(this).closest('tr').next('tr');
			var number = parseInt($(this).closest('td').siblings('th').text());
			wraptr.insertAfter(wraptr.next());
			wrapnext.children('th').text(number);
			 if (number < count) {
				$(this).closest('td').siblings('th').text(number + 1);
			}  */
		})

		$(document).on('click','.custom-control-input',function() {
					if ($(this).val() == 2) {
						$('#votenum').attr('readOnly', false);
						$("#datepicker").attr('disabled', true);
					} else if ($(this).val() == 1) {
						$('#votenum').attr('readOnly', true);
						$("#datepicker").attr('disabled', false);
						$("#datepicker").css('background-color','white');
						$(function() {
							$("#datepicker").datepicker(
									{
										minDate : "+0D", //최소 선택일자
										maxDate : "+3Y",
										monthNamesShort : [ '1', '2', '3', '4',
												'5', '6', '7', '8', '9', '10',
												'11', '12' ] //달력의 월 부분 텍스트
										,
										monthNames : [ '1월', '2월', '3월', '4월',
												'5월', '6월', '7월', '8월', '9월',
												'10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
										,
										dayNamesMin : [ '일', '월', '화', '수',
												'목', '금', '토' ] //달력의 요일 부분 텍스트
										,
										dayNames : [ '일요일', '월요일', '화요일',
												'수요일', '목요일', '금요일', '토요일' ],
										//달력의 요일 부분 Tooltip 텍스트
										yearSuffix : "년",
										showMonthAfterYear : true

									});
						});
					} else {
						$('#votenum').attr('readOnly', true);
						$("#datepicker").attr('disabled', true);
					}
				})

		$('#itsobtn').click(function() {	
					
					var radioval = $('input[name = "styling_endsel"]:checked').val();
					if(radioval ==null){
						alert("종료 방법을 선택해 주세요.");
					}else{
						$('#radioresult').val(radioval);
						console.log($('input[name = "styling_end"]').val());		
						console.log($('#datepicker').val());
						$('#realterm').val($('#datepicker').val());
						
						if($('#votetitleid').val() == "" || $('#imgfile0').val() == "" || $('#votecontentsid').val() == "" || $('.file-upload-input, .filesel').val() == "" || $('.itemconts').val() == "" ){
							alert("항목을 모두 입력해 주세요.");
						}else if(radioval==1 && $('#datepicker').val()==""){
							alert("종료 날짜를 선택해 주세요.");			
						}else if(radioval==2 && $('#votenum').val()=="" || radioval==2 && $('#votenum').val()==0 || radioval==2 && $('#votenum').val()==1){
							alert("참여 인원을 입력해 주세요.(2명 이상)");		
						}else if($('#datepicker').val()=="" && $('#votenum').val()=="" && radioval!=3){
							alert("투표종료 조건을 입력해 주세요.");
						}else if($('.filesel').length<2){
							alert("투표항목은 2개 이상 입력해 주세요.");
						}else{
							if(radioval==3){
								$('#realterm').val("blank");
								$('#votenum').val(0);
								console.log($('#realterm:styling_endtermtxt 값').val()); 
							}
							
							if(radioval==2){
								$('#realterm').val("blank");
								console.log($('#realterm:styling_endtermtxt 값').val()); 
							}
							if(radioval==1){
								$('#votenum').val(0);
								console.log($('#realterm:styling_endtermtxt 값').val()); 
							}
							  console.log("submit");  
							   $('#voteform').submit();  
						}
					}						
					console.log(radioval+"번 종료조건 선택 함");
				});
	</script>

</body>
</html>