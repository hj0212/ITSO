<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
@media (max-width: 576px) {
.btmrow{
float:left;
}
}
#wrapper {
	width: 100%;
	min-width: 500px;
}
#voteitemimg {
	width: 10%;
}
#voteitemdiv {
	width: 100%;
} 
img {
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
.settxt{
font-size:15px;
}
</style>

</head>
			
<body>
	<%@include file="navi.jsp"%>
	<div class="row my-5"></div>
	<div id="wrapper" class="container-fluid col-md-8">

		<script>
			var count = 1;
		</script>
		<div class="row my-2"></div>
		<form method="post" action="modifyStylingVote.style?styling_vote_seq=${votedto.styling_vote_seq}" id="modiform" enctype="multipart/form-data">
			<div class="row z-depth-3 hoverable" id="toprow">
				<h4>투표주제</h4>&nbsp;<span class="text-muted text-sm settxt">(작성자: ${votedto.styling_writername}</span>
				&nbsp;<span class="text-muted text-sm settxt"><i class="fa mr-2 fa-eye" aria-hidden="true"></i>${votedto.styling_viewcount})</span>
				<input type="hidden" value="${votedto.styling_writer}" id="votewriterid" name ="styling_writer">
			<input type="hidden" name="styling_vote_seq" value="${votedto.styling_vote_seq}">
			<input type="hidden" name="styling_viewcount" value="${votedto.styling_viewcount}">
			<input type="hidden" id="showdto" value="투표인원${votedto.styling_voternum}::기간${votedto.styling_endterm}::최근수정날짜${votedto.styling_lastdate}::조회수${votedto.styling_viewcount}::글번호${votedto.styling_vote_seq}">
				<div class="md-form form-lg col-md-12 file-upload mt-0">
					<div class="md-form form-md form-group">
						<input type="text" id="votetitleid" name="styling_title"
							class="form-control col-md-9 float-right" value="${votedto.styling_title}" maxlength="50"> <label
							for="votetitleid" class="offset-md-3 my-0 font-weight-bold"
							id="votelabel">제목을 입력해주세요.</label>
					</div>
					<div class="md-form form-md form-group">
						<input type="text" id="votecontentsid"
							name="styling_contents" value="${votedto.styling_contents}"
							class="form-control col-md-9 float-right" maxlength="90"
							placeholder="내용을 입력해주세요.">
					</div>
					<div class="media-body image-upload-wrap form-group"
						id="voteitemdiv">
						<img class="d-flex file-upload-image" src="upload/stylingvote/${votedto.photo}" alt="사진 없음"
							id="voteitemimg"> <input type="file" name="titlefile"
							id="imgfile0" onchange="readURL(this);"
							class="file-upload-input form-control" accept="image/*" />
							<input type="hidden" name="photo" value="${votedto.photo}"/>
					</div>
				</div>
			</div>
			<hr />
			<input type="hidden" name="styling_writer" value="${votedto.styling_writer}">
			<input type="hidden" name ="styling_writedate" value="${votedto.styling_writedate}">
			<input type="hidden" name="styling_viewcount" value="${votedto.styling_viewcount}">
			<input type="hidden" name="state" value="${state}">

			<div class="row">
				<h4 class="mb-0">투표항목</h4>
				
				<a class="btn btn-outline-indigo btn-sm waves-effect px-0 py-0"
					id="addvotebtn"> <i class="fa fa-plus" aria-hidden="true"></i></i>
				</a>
				<div class="md-form form-lg col-md-12 mt-0">
					<table class="table table-borderless" id="itemtable">
						<thead>
							<tr>
								<th scope="col">seq</th>
								<th scope="col">img</th>
							</tr>
						</thead>
						<tbody id="itemlist">
						<c:forEach var="item" items="${voteitems}" varStatus = "status">
							<tr class="z-depth-3 hoverable" id="tr${status.index}">
								<th scope="row">
								<input type="hidden" name="styling_vote_item_seq" value="${item.styling_vote_item_seq}"></th>
								<td>
									<div class="media">
										<div class="media-img">
										<c:set var="itemphoto" value="${item.styling_vote_item_photo}"/>
										<c:set var="leng" value="${fn:length(itemphoto)}"/>
										
											<img class="d-flex mr-3 selimg" src="upload/stylingvote/${item.styling_vote_item_photo}" alt="후보사진"> 
											<input type="file" id="imgfile${status.count}"
												class="file-upload-input form-control filesel"
												onchange="readURL(this);" accept="image/*">
												<input type="hidden" class="oriphotovalue" value="${item.styling_vote_item_photo}">
										</div>

										<div class="media-body image-upload-wrap form-group"
											id="btnsdiv">
											 <a class="delvotebtn"> <i
												class="fa fa-minus fa-1x indigo-text" aria-hidden="true"></i>
											</a><br>
											<div class="md-form form-sm">
												<input type="text" id="vitemtext" class="form-control itemconttext" value="${item.styling_vote_item_contents}">
												<label for="vitemtext">아이템을 소개해 주세요.</label>
											</div>
										</div>
									</div>
								</td>
							</tr>
							
							</c:forEach>
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
					<input type="text" id="datepicker" name="datepickervalue" disabled readOnly
						class="form-control form-control-sm col-md-4" value="${votedto.styling_endterm}">
						<input type="hidden" name="styling_endtermtxt" id="realterm">
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
				<c:choose>
				<c:when test="${votedto.styling_voternum eq 0}">
				<input type="text" class="form-control form-control-sm col-md-4"  maxlength="12" oninput="maxLengthCheck(this)"
						readOnly id="votenum" placeholder="명" name="styling_voternum" value="${votedto.styling_voternum}">
				</c:when>	
				
				<c:otherwise>
					<input type="text" class="form-control form-control-sm col-md-4"
						readOnly id="votenum" placeholder="명" name="styling_voternum" value="${votedto.styling_voternum}">
				</c:otherwise>
				</c:choose>
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
			<input type="hidden" name="voteitemori[]" value="ori">
			<input type="hidden" name="voteitemnew[]" value="new">
			<input type="hidden" name ="deletedsvitem[]" value="del">
			<input type="hidden" name ="itemphotos[]" value="photo">

			<div class="row btmrow">
				<button class="btn btn-indigo" type="button" id="itsobtn">itso?</button>
				<a href="#top" class="btn btn-indigo ml-auto"><i
					class="fa fa-arrow-up" aria-hidden="true"></i></a>
			</div>
			
		</form>
	</div>

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
		
		count = $("#itemtable tr").length-1;
		
		 function maxLengthCheck(object){
			   if (object.value.length > object.maxLength){
			    object.value = object.value.slice(0, object.maxLength);
			   }    
			  }
			
		/* $('.file-upload-input').attr('onchange',onChange()); */
		/* function onChange()
		onchange="readURL(this);" */
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
			}else {
				removeUpload();
			}
		}
		
		$('.filesel').on('change', function(){
			$(this).attr('name',"voteimgfile[]");
			
		})
		 
		$("#addvotebtn")
				.on(
						"click",
						function() {
							if (count < 6) {
								count++;
								console.log(count);
								$('#itemlist')
										.append(
												'<tr class="z-depth-3 hoverable" id="tr${status.index}"><th scope="row">'
														+ count
														+ '</th>'
														+ '<td><div class="media"><div class="media-img"><img class="d-flex mr-3 selimg" src="" alt="후보사진">'
														+ '<input type="file" name="voteimgfile[]" id="imgfile'
														+ count
														+ '" class="file-upload-input form-control filesel"'
														+ 'onchange="readURL(this);" accept="image/*"></div>'
														+ '<div class="media-body image-upload-wrap form-group" id="btnsdiv">'
														+ '<a class="delvotebtn"> <i class="fa fa-minus fa-1x indigo-text" aria-hidden="true"></i></a><br>'
														+ '<div class="md-form form-sm"><input type="text" id="vitemtext'+count+'" class="form-control itemconttext"><label for="itemtext'+count+'">아이템의 특징을 간단히 적어주세요.</label>'
														+ '</div></div></div></td></tr>');
							} else if (count == 6) {
								alert("투표 항목은 6개까지 추가할 수 있습니다.")
							}
						})
		$(document).on('click', '.delvotebtn', function() {
			var wraptr = $(this).closest("tr");
			$(this).closest("tr").remove();
			count--;
			var delseq = $(this).parent().parent().parent().prev('th').children('input').val();
			$('#modiform').append('<input type="hidden" name="deletedsvitem[]" value="'+delseq+'">');	
			/* var arr = wraptr.nextAll('tr').children('th');
			for(i=0 i<arr.size i++){
				arr 이거... 해야됨 ㅋㅋㅋㅋ 지우면 숫자 안바뀜
			} */
		})
		$(document).on('click', '.upvotebtn', function() {
			var wraptr = $(this).closest('tr');
			var wrapprev = $(this).closest('tr').prev('tr');
			var number = parseInt($(this).closest('td').siblings('th').text());
			wraptr.insertBefore(wraptr.prev());
		/* 	if (number > 1) {
				wrapprev.children('th').text(number);
				$(this).closest('td').siblings('th').text(number - 1);
			} */
		})
		$(document).on('click', '.downvotebtn', function() {
			var wraptr = $(this).closest('tr');
			var wrapnext = $(this).closest('tr').next('tr');
			var number = parseInt($(this).closest('td').siblings('th').text());
			wraptr.insertAfter(wraptr.next());
			/* wrapnext.children('th').text(number);
			if (number < count) {
				$(this).closest('td').siblings('th').text(number + 1);
			} */
		})
		$(document).on('click', '.custom-control-input', function() {
			if ($(this).val() == 2) {
				$('#votenum').attr('readOnly', false);
				$("#datepicker").attr('disabled',true);
			} else if ($(this).val() == 1) {
				$('#votenum').attr('readOnly', true);
				$("#datepicker").attr('disabled',false);
				$("#datepicker").attr('readOnly',false);
				$("#datepicker").css("background-color","white");
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
			}else{
				$('#votenum').attr('readOnly', true);
				$("#datepicker").attr('disabled',true);
			}
		})
		
		$('#itsobtn').click(function(){			
			var	breakflag = false;
				
			var radioval = $('input[name = "styling_endsel"]:checked').val();
			if(radioval ==null){
				alert("종료 방법을 선택해 주세요.");
			}else{
				$('#radioresult').val(radioval);
				console.log($('input[name = "styling_end"]').val());		
				console.log($('#datepicker').val());
				$('#realterm').val($('#datepicker').val());
				if($('#votetitleid').val() == "" || ($('#imgfile0').val() == "" && $('#voteitemimg').attr('src')=="") || $('#votecontentsid').val() == "" || $('.itemconts').val() == "" ){
					alert("항목을 모두 입력해 주세요.");
					breakflag=true;
				}else if(radioval==1 && $('#datepicker').val()==""){
					alert("종료 날짜를 선택해 주세요.");
					breakflag=true;
				}else if(radioval==2 && $('#votenum').val()=="" || radioval==2 && $('#votenum').val()==0 || radioval==2 && $('#votenum').val()==1){
					alert("참여 인원을 입력해 주세요(2명 이상).");
					breakflag=true;
				}else if($('#datepicker').val()=="" && $('#votenum').val()==""){			
					alert("투표종료 조건을 입력해 주세요.");
					breakflag=true;
				}else if($('.filesel').length<2){
					alert("투표항목은 2개 이상 입력해 주세요.");	
					breakflag=true;									
				}else {
					for(i=1; i<$("#itemtable tr").length; i++){
						console.log(breakflag);
						console.log(i+"번째 포문");			
						if(breakflag==true){break;}else{
						if($('#itemtable tr:nth-of-type('+i+')').find('.filesel').val()=="" && $('#itemtable tr:nth-of-type('+i+')').find('.selimg').attr('src')=="" ){
							alert("사진을 선택해 주세요."); 
							breakflag=true;
							}
						else if($('#itemtable tr:nth-of-type('+i+')').find('.itemconttext').val()==null ||$('#itemtable tr:nth-of-type('+i+')').find('.itemconttext').val()==""){							
							alert("아이템 내용을 적어주세요.");
							breakflag=true;
						}else{
							console.log("여기서 음...내용 판별");
							if($('#itemtable tr:nth-of-type('+i+')').find('.filesel').val() == ""){
								var ori = $('#itemtable tr:nth-of-type('+i+')').find('.itemconttext').val();
								var pho = $('#itemtable tr:nth-of-type('+i+')').find('.oriphotovalue').val();
								$('#modiform').append('<input type="hidden" name="voteitemori[]" value="'+ori+'">');	
								$('#modiform').append('<input type="hidden" name="itemphotos[]" value="${"'+pho+'"}">');
							/* 	voteitemnew.push($('#itemtable tr:nth-of-type('+i+')').find('.itemconttext').val());	 */						
								console.log(ori);
								console.log(pho);
							
							}else{
								var newitem = $('#itemtable tr:nth-of-type('+i+')').find('.itemconttext').val();								
								$('#modiform').append('<input type="hidden" name="voteitemnew[]" value="'+newitem+'">');	
							}							
							}			
						}
						}
					}
					if(breakflag == false){
						console.log("최종submit-------------");
						console.log("del목록"+$('input[name ="deletedsvitem[]"]').length);
						console.log("new내용 개수"+$('input[name="voteitemnew[]"]').length);
						console.log("ori내용 개수"+$('input[name="voteitemori[]"]').length);
						console.log("사진값(있던사진):"+$('input[name="itemphotos[]"]').val());
						console.log("dto 분해 -투표주제:작성자/"+$('#votetitleid').val()+":"+$('#votewriterid').val());
						console.log($('#showdto').val());
						if(radioval==3){
							$('#realterm').val("blank");
							$('#votenum').val(0);
							console.log($('#realterm:styling_endtermtxt 값').val()); 
						}
						
						if(radioval==2){
							$('#realterm').val("blank");
							console.log($('#datepicker').val()); 
						}
						if(radioval==1){
							$('#votenum').val(0);
							console.log($('#realterm:styling_endtermtxt 값').val()); 
						}
						  console.log("submit");  		    
						   $('#modiform').submit();     			
					 
				}		
			}
		})
		
	</script>

</body>
</html>