package kh.spring.websocket;

import java.util.HashSet;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Configuration
@Repository
@EnableWebSocket
public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	private SqlSessionTemplate template;
	
	private Set<WebSocketSession> sessionList = new HashSet<>();
	
	// 클라이언트와 연결 된 후
	public void afterConnectionEstablished(WebSocketSession session) {
		sessionList.add(session);
		System.out.println("들어왔습니다" + session);
		//System.out.println("채팅방 입장: " + session.getPrincipal().getName());
	}
	
	// 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 연결된 모든 클라이언트에게 메세지 전송
		System.out.println(message);
		System.out.println(session);
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getPrincipal().getName() + "|" + message.getPayload()));
		}
	}
	
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		sessionList.remove(session);
		// System.out.println("채팅방 퇴장: " + session.getPrincipal().getName());
	}

}
