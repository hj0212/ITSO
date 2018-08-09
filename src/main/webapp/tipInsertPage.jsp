<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>커뮤니티 | ITSO</title>


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
</style>

</head>

<body>

	<!-- Material input text -->
	<!-- tip article title -->
	<div class="md-form">
		<input type="text" id="tip_title" class="form-control"
			placeholder="제목" name="tip_title" required>
	</div>

	<!-- category -->
	<div class="md-form input-group">
		<input class='form-control' type="text" id="category"
			placeholder="카테고리" name="category" readonly required data-toggle="tooltip" data-placement="top" title="오른쪽 '카테고리' 버튼을 눌러 선택해주세요.">

		<div class="input-group-append">
			<button class="btn btn-elegant dropdown-toggle" type="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리
				선택</button>

			<div class="dropdown-menu">
				<a class="dropdown-item" href="#"
					onclick="javascript:document.getElementById('category').value=this.innerHTML">뷰티</a>
				<a class="dropdown-item" href="#"
					onclick="javascript:document.getElementById('category').value=this.innerHTML">피트니스</a>
				<a class="dropdown-item" href="#"
					onclick="javascript:document.getElementById('category').value=this.innerHTML">영양</a>
				<a class="dropdown-item" href="#"
					onclick="javascript:document.getElementById('category').value=this.innerHTML">네일아트</a>
				<a class="dropdown-item" href="#"
					onclick="javascript:document.getElementById('category').value=this.innerHTML">패션</a>

			</div>
		</div>
	</div>

	<input class=form-control type="hidden" id="tip_writer" placeholder="0"
		name="tip_writer">

	<input class=form-control type="hidden" id="tip_viewcount" value=0
		name="tip_viewcount">


	<textarea name="editorTA" id="editorTA" required></textarea>
	<div id=btns class="container mt-3">
<!-- 		<button id=tempSave type=button class="btn btn-elegant btn-sm">임시저장</button> -->
		<button id=writeBtn type=submit class="btn btn-elegant">올리기</button>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="insertSuccessModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">성공!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modalBody">글 등록 성공!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-elegant" id="modalConfirmBtn"
						data-dismiss="modal"
						onclick="javascript:location.href='tipBoardHome.go'">게시물
						확인</button>
				</div>
			</div>
		</div>
	</div>



	<script>
		window.onload = function() {

			// Tooltips Initialization
			$(function () {
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

				$.ajax({
					url : "tipInsertProc.tip",
					type : "post",
					data : data,
					dataType : "json",
					contentType : "application/json;charset=UTF-8",
					async : true,
					success : function(response) {
						if (response != null) {

							$("#insertSuccessModal").modal('show');

						}
					},
					error : function(response) {

						console.log(response);
						
						$("#modalTitle").html("실패!");
						$("#modalBody").html("글쓰기 실패! 관리자에게 문의하세요")
						$("#modalConfirmBtn").html("닫기");
						$("#modalConfirmBtn").attr("onclick","javascript:$('#insertSuccessModal').modal('hide')")
						
						
						$("#insertSuccessModal").modal('show');

					}
				});
			}

		
		};
	</script>












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


</body>

</html>
