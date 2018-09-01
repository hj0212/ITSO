package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.MessagesDTO;
import kh.spring.interfaces.IMessagesDAO;
import kh.spring.interfaces.IMessagesService;

@Service
public class MessagesServiceImple implements IMessagesService{

	@Autowired
	private IMessagesDAO dao;
	
	
	@Override
	public int sendMessage(MessagesDTO medto) {
		// TODO Auto-generated method stub
		return dao.sendMessage(medto);
	}

	@Override
	public List<MessagesDTO> selectMessage(MessagesDTO medto) {
		// TODO Auto-generated method stub
		return dao.selectMessage(medto);
	}

}
