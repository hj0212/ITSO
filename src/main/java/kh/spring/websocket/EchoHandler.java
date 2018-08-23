package kh.spring.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	// 클라이언트와 연결 된 후
	public void afterConnectionEstablished(WebSocketSession session) {
		sessionList.add(session);
		//System.out.println("채팅방 입장: " + session.getPrincipal().getName());
	}
	
	// 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 연결된 모든 클라이언트에게 메세지 전송
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getPrincipal().getName() + "|" + message.getPayload()));
		}
	}
	
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		sessionList.remove(session);
		// System.out.println("채팅방 퇴장: " + session.getPrincipal().getName());
	}

}
