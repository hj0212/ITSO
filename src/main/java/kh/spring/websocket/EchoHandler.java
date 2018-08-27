package kh.spring.websocket;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@ServerEndpoint("/websocket")
@Controller
public class EchoHandler{
	
	private  Set<Session> users = Collections.synchronizedSet(new HashSet<>());
	
	
	@OnOpen
	public void hadleOpen(Session session) {
		users.add(session);
		System.out.println(users.size());
	}
	
	@OnMessage
	public void handleMessage(String message,Session session) {
		try {
			for(Session tmp : users) {
				System.out.println(message);
				tmp.getBasicRemote().sendText(message);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	
		
	}
	
	@OnClose
	public void handleClose(Session session) {
		users.remove(session);
	}
	
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}



