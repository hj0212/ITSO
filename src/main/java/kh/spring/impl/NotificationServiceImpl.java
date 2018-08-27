package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.NotificationDTO;
import kh.spring.interfaces.INotificationDAO;
import kh.spring.interfaces.INotificationService;

@Service
public class NotificationServiceImpl implements INotificationService {

	@Autowired
	private INotificationDAO dao;
	
	
	@Override
	public int insertNotification(NotificationDTO ndto) {
		// TODO Auto-generated method stub
		return this.dao.insertNotification(ndto);
	}


	@Override
	public List<NotificationDTO> selectNotification(NotificationDTO ndto) {
		// TODO Auto-generated method stub
		return this.dao.selectNotification(ndto);
	}


	@Override
	public int updateNotification(NotificationDTO ndto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
