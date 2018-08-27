package kh.spring.dto;

import java.sql.Date;

public class NotificationDTO {
	private int noti_seq;	
	private int user_seq;
	private int noti_user_seq;
	private String noti_type;	// comment, tag, good, reply
	private String noti_contents;	
	private Date noti_date;		// 알림발생시간
	private String noti_read;	// y, n
	private String noti_url;
	private int article_seq;
	private String noti_user_photo;
	private String noti_user_name;
	
	public NotificationDTO() {
		super();
	}
	
	public NotificationDTO(int noti_seq, int user_seq, int noti_user_seq, String noti_type, String noti_contents,
			Date noti_date, String noti_read, String noti_url, int article_seq,String noti_user_photo,String noti_user_name) {
		super();
		this.noti_seq = noti_seq;
		this.user_seq = user_seq;
		this.noti_user_seq = noti_user_seq;
		this.noti_type = noti_type;
		this.noti_contents = noti_contents;
		this.noti_date = noti_date;
		this.noti_read = noti_read;
		this.noti_url = noti_url;
		this.article_seq = article_seq;
		this.noti_user_photo = noti_user_photo;
		this.noti_user_name = noti_user_name;
	}
	public NotificationDTO(int user_seq,int noti_useq_seq,String noti_type, String noti_contents, String noti_read,String noti_url, int article_seq) {
		this.user_seq = user_seq;
		this.noti_user_seq = noti_useq_seq;
		this.noti_type = noti_type;
		this.noti_contents = noti_contents;
		this.noti_read = noti_read;
		this.noti_url = noti_url;
		this.article_seq = article_seq;
	}
	
	public NotificationDTO(int user_seq) {
		this.user_seq = user_seq;
	}
	
	
	public int getNoti_seq() {
		return noti_seq;
	}
	public void setNoti_seq(int noti_seq) {
		this.noti_seq = noti_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getNoti_user_seq() {
		return noti_user_seq;
	}
	public void setNoti_user_seq(int noti_user_seq) {
		this.noti_user_seq = noti_user_seq;
	}
	public String getNoti_type() {
		return noti_type;
	}
	public void setNoti_type(String noti_type) {
		this.noti_type = noti_type;
	}
	public String getNoti_contents() {
		return noti_contents;
	}
	public void setNoti_contents(String noti_contents) {
		this.noti_contents = noti_contents;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	public String getNoti_read() {
		return noti_read;
	}
	public void setNoti_read(String noti_read) {
		this.noti_read = noti_read;
	}
	public String getNoti_url() {
		return noti_url;
	}
	public void setNoti_url(String noti_url) {
		this.noti_url = noti_url;
	}
	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	
	
}
