package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.MessagesDTO;

public interface IMessagesDAO {
	public int sendMessage(MessagesDTO medto);
	public List<MessagesDTO> selectMessage(MessagesDTO medto);

}
