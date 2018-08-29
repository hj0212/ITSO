package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.NotificationDTO;
import kh.spring.interfaces.INotificationDAO;

@Repository
public class NotificationDAOImpl implements INotificationDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public int insertNotification(NotificationDTO ndto) {
		// TODO Auto-generated method stub
		return this.template.insert("Notification.insertNotification",ndto);
	}

	@Override
	public List<NotificationDTO> selectNotification(NotificationDTO ndto) {
		// TODO Auto-generated method stub
		return this.template.selectList("Notification.selectNotification",ndto);
	}

	@Override
	public int updateNotification(NotificationDTO ndto) {
		// TODO Auto-generated method stub
		return this.template.update("Notification.readNotification",ndto);
	}

	@Override
	public List<NotificationDTO> notificationData(NotificationDTO ndto) {
		// TODO Auto-generated method stub
		return this.template.selectList("Notification.notificationData", ndto);
	}

}
