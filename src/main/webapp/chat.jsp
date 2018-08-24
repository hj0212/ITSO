<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>JSP</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

    $(document).ready(function() {

        $("#sendBtn").click(function() {

            send_Message();

        });

    

    var ws="";
	function send_Message() {
		ws = new WebSocket("ws://localhost:8080/echo/websocket");
		ws.onopen = function(event) {
			onOpen(event);
		};
		ws.onmessage = function(event) {
			onMessage(event)
		};
		ws.onerror = function(event) {
			onError(event);
		};
	}
		function onOpen(event){
			console.log("onOpen");
			ws.send($("#message").val());
		}
		function onMessage(event){
			$("body").html(event);
			console.log("돌아왔어");
		}
		function onError(event){
			console.log("에러입니다");
		}
	
    });
</script>

</head>

<body>

    <input type="text" id="message" />

    <input type="button" id="sendBtn" value="전송" />

    <div id="data"></div>

</body>

</html>
