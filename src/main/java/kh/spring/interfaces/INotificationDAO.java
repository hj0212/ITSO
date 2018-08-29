package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.NotificationDTO;

public interface INotificationDAO {
	public int insertNotification(NotificationDTO ndto); //알림 들어간다
	public List<NotificationDTO> selectNotification(NotificationDTO ndto);
	public int updateNotification(NotificationDTO ndto);
	public List<NotificationDTO> notificationData(NotificationDTO ndto);
}
