<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
</head>
<body>
<div id="contents"></div>

<input type="text" id="chatbox"  />
<button id="submitbtn">전송</button>

<script>
var stompClient = null;
//채팅방 연결
function connect() {
 
 // WebSocketMessageBrokerConfigurer의 registerStompEndpoints() 메소드에서 설정한 endpoint("/endpoint")를 파라미터로 전달
 var socket = new SockJS('/endpoint');
 stompClient = Stomp.over(socket);
 stompClient.connect({}, function(frame) {
     
     // 메세지 구독
     // WebSocketMessageBrokerConfigurer의 configureMessageBroker() 메소드에서 설정한 subscribe prefix("/subscribe")를 사용해야 함
     stompClient.subscribe('/subscribe/chat', function(message) {
         var data = JSON.parse(message.body);
         alert(data.username + ":" + data.message);
         $("#contents").append(data.username + ":" + data.message);
     });        
 });
 
}

//채팅 메세지 전달
function sendMessage() {
 var str = $("#chatbox").val();
 str = str.replace(/ /gi, '&nbsp;')
 str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
 if(str.length > 0) {
     // WebSocketMessageBrokerConfigurer의 configureMessageBroker() 메소드에서 설정한 send prefix("/")를 사용해야 함
     stompClient.send("/chat", {}, JSON.stringify({
         message: str
     }));
 }
}

$("#submitbtn").on("click",sendMessage);


//채팅방 연결 끊기
function disconnect() {
 stompClient.disconnect();
}


</script>
</body>
</html>