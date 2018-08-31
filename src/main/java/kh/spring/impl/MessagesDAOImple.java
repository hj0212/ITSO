package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MessagesDTO;
import kh.spring.interfaces.IMessagesDAO;

@Repository
public class MessagesDAOImple implements IMessagesDAO  {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	
	@Override
	public int sendMessage(MessagesDTO medto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MessagesDTO> selectMessage(MessagesDTO medto) {
		// TODO Auto-generated method stub
		return null;
	}

}
