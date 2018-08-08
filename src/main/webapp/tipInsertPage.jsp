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

	<input class=form-control type="text" id="tip_title" value="test1">
	<input class=form-control type="number" id="tip_writer" value=0>
	<input class=form-control type="text" id="category" value="피트니스">
	<input class=form-control type="number" id="tip_viewcount"
		value=0>
	

	<textarea name="editorTA" id="editorTA"></textarea>
	<div id=btns class="container mt-3">
		<button id=tempSave type=button class="btn btn-elegant btn-sm">임시저장</button>
		<button id=writeBtn type=submit class="btn btn-elegant btn-sm">올리기</button>
	</div>

	<script>
		window.onload = function() {
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

			// Temporaly Saving & byte size check
			document.getElementById("tempSave").onclick = function() {
				console.log('Total bytes: ' + editor.getData().length);
				alert("임시저장 완료");
			}


			// The "change" event is fired whenever a change is made in the editor.		
			editor.on('change', function(evt) {
				console.log('Total bytes: ' + editor.getData().length);

				CKEDITOR.instances.editorTA.updateElement();

				console.log(document.getElementById("editorTA").value);

				//$("#preview").html(data);

				
				
				
			});

			// let data = document.getElementById('editor').value;		
			document.getElementById("writeBtn").onclick = function() {

				console.log(document.getElementById("tip_title").value);
				console.log(document.getElementById("editorTA").value);
				console.log(document.getElementById("tip_title").value);
				console.log(document.getElementById("tip_viewcount").value);
				console.log(document.getElementById("category").value);
				
				
				$.ajax({
					url : "tipInsertProc.tip",
					type : "post",
					data : {
// 						"tip_title" : document.getElementById("tip_title").value,
						"tip_contents" : document.getElementById("editorTA").value,
// 		        		"tip_writer": document.getElementById("tip_title").value,
// 						"tip_viewcount" : document.getElementById("tip_viewcount").value,
// 						"category" : document.getElementById("category").value
					
					},
					success : function(response) {
						if (response != null) {
							alert("test");
						}
					},
					error : function(response) {
						alert("error");
					}
				});
			}
		}
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
	<script src="https://code.jquery.com/jquery-3.3.1.js"
		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		crossorigin="anonymous"></script>

</body>

</html>
