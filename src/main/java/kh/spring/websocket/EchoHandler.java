package kh.spring.websocket;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.spring.dto.NotificationDTO;
import kh.spring.impl.NotificationServiceImpl;
import kh.spring.interfaces.INotificationService;

@Controller
@ServerEndpoint("/websocket")
public class EchoHandler{

		
	public static Map<Integer,Session> users = Collections.synchronizedMap(new HashMap<>());
	
	 
	
	@OnOpen
	public void hadleOpen(Session session) {
		System.out.println("session들어왔슴돠");
	}
	
	@OnMessage
	public void handleMessage(int message,Session session) {
		try {
			users.put(message,session);
			
		
			
			
			System.out.println(message +" :"+ session);
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



