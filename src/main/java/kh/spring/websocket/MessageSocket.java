package kh.spring.websocket;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint("/socket")
public class MessageSocket {

	public static Map<Integer,Session> message_user = Collections.synchronizedMap(new HashMap<>());
	
	

	@OnOpen
	public void hadleOpen(Session session) {
		System.out.println(session.getRequestParameterMap().get("seq").get(0));
		int seq =Integer.parseInt(session.getRequestParameterMap().get("seq").get(0));
		message_user.put(seq,session );
	}
	
	@OnMessage
	public void handleMessage(String message,Session session) {
		try {
							
			
			System.out.println(message +" :"+ session);
		}catch(Exception e) {
			e.printStackTrace();
		
		}
		
		
	
		
	}
	
	@OnClose
	public void handleClose(Session session) {
		message_user.remove(session);
	}
	
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}
