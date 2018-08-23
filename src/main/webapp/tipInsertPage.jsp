<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>팁 작성하기 | ITSO</title>

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


<script src="ckeditor/ckeditor.js"></script>

<!-- JQuery 원래 밑에 있었음-->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<style>
#btns {
	text-align: center;
	padding: 20px;
}

@media ( max-width : 1200px) {
	.ck-editor {
		width: 450px;
		height: 200px;
	}
}

#cke_1_top, #cke_1_bottom {
	background-color: white;
}

.btn-itso {
	background-color: #1B0946;
	color: white;
}
</style>
</head>
<body>
	<!-- navi -->
	<%@include file="navi.jsp"%>


	<!-- Material input text -->
	<div id=wrapper class=container>
		<!-- tip article title -->
		<div class="row">
			<div class="col md-form input-group">
				<input type="text" id="tip_title" class="form-control"
					placeholder="제목" name="tip_title" required>
			</div>

			<!-- category -->
			<div class="col md-form input-group">
				<input class='form-control' type="text" id="category"
					placeholder="카테고리" name="category" readonly required
					data-toggle="tooltip" data-placement="top"
					title="오른쪽 '카테고리' 버튼을 눌러 선택해주세요.">

				<div class="input-group-append">
					<button class="btn btn-itso dropdown-toggle" type="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리
						선택</button>

					<div class="dropdown-menu">
						<a class="dropdown-item" href="#"
							onclick="javascript:document.getElementById('category').value=this.innerHTML">뷰티</a>
						<a class="dropdown-item" href="#"
							onclick="javascript:document.getElementById('category').value=this.innerHTML">다이어트</a>
						<a class="dropdown-item" href="#"
							onclick="javascript:document.getElementById('category').value=this.innerHTML">패션</a>
						<a class="dropdown-item" href="#"
							onclick="javascript:document.getElementById('category').value=this.innerHTML">직장생활</a>
					</div>
				</div>
			</div>

		</div>

		<!-- hidden writer -->
		<input class=form-control type="hidden" id="tip_writer"
			value="${sessionScope.user.seq}" name="tip_writer">

		<!-- hidden view count -->
		<input class=form-control type="hidden" id="tip_viewcount" value=0
			name="tip_viewcount">


		<textarea name="editorTA" id="editorTA" required></textarea>
		<div id=btns class="container mt-3">
			<button id=writeBtn type=submit class="btn btn-itso">올리기</button>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="insertSuccessModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalTitle">성공!</h5>
						<!-- 						<button type="button" class="close" data-dismiss="modal" -->
						<!-- 							aria-label="Close"> -->
						<!-- 							<span aria-hidden="true">&times;</span> -->
						<!-- 						</button> -->
					</div>
					<div class="modal-body" id="modalBody">글 등록 성공!</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-itso" id="modalConfirmBtn"
							data-dismiss="modal"
							onclick="javascript:location.href'tipBoardMainPage.go'">팁
							게시판으로</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- script -->
	<script>
		window.onload = function() {

			// Tooltips Initialization
			$(function() {
				$('[data-toggle="tooltip"]').tooltip()
			})

			// Ckeditor Init
			let editor = CKEDITOR
					.replace(
							'editorTA',
							{
								extraPlugins : 'easyimage',
								cloudServices_tokenUrl : 'https://34277.cke-cs.com/token/dev/A2fh69MdD6ZbneTSLEawfBh2LsSlsoSyzyN4vF3UziV89xsfCWH7ntLhAIBD',
								cloudServices_uploadUrl : 'https://34277.cke-cs.com/easyimage/upload/'

							});

			CKEDITOR.config.width = '100%';
			CKEDITOR.config.height = '55vh';

			// The "change" event is fired whenever a change is made in the editor.		
			editor.on('change', function(evt) {
				console.log('Total bytes: ' + editor.getData().length);

				CKEDITOR.instances.editorTA.updateElement();

				console.log(document.getElementById("editorTA").value);

			});

			// let data = document.getElementById('editor').value;		
			document.getElementById("writeBtn").onclick = function() {

				var data = JSON
						.stringify({
							tip_title : document.getElementById("tip_title").value,
							tip_contents : document.getElementById("editorTA").value,
							tip_writer : document.getElementById("tip_writer").value,
							tip_viewcount : document
									.getElementById("tip_viewcount").value,
							category : document.getElementById("category").value
						});

				console.log(data);

				$
						.ajax({
							url : "tipInsertProc.tip",
							type : "post",
							data : data,
							dataType : "json",
							contentType : "application/json;charset=UTF-8",
							async : true,
							success : function(response) {
								if (response != null) {

									console.log("DB insert success");

									$("#modalTitle").html("성공!");
									$("#modalBody").html("글쓰기 성공!")
									$("#modalConfirmBtn").html("팁 게시판으로");
									$("#modalConfirmBtn")
											.attr("onclick",
													"javascript:location.href='tipBoardMainPage.tip'")

									$("#insertSuccessModal").modal('show');

								}
							},
							error : function(response) {

								console.log("DB insert Failed")
								console.log(response);

								$("#modalTitle").html("실패!");
								$("#modalBody").html(
										"글쓰기 실패! 제목, 카테고리, 내용을 모두 적으셔야 합니다.")
								$("#modalConfirmBtn").html("닫기");
								$("#modalConfirmBtn")
										.attr("onclick",
												"javascript:$('#insertSuccessModal').modal('hide')")

								$("#insertSuccessModal").modal('show');

							}
						});
			}

		};
	</script>

	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>


</body>

</html>
