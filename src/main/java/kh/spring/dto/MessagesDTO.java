package kh.spring.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MessagesDTO {
	private int message_seq;
	private int user_seq;
	private String message_contents;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date message_time;
	private int message_user_seq;
	private String message_read;
	private String message_icon;
	private String message_img;
	private int seq;
	private String name;
	private String photo;
	
	

	public MessagesDTO() {
	}
	public MessagesDTO(int message_seq, int user_seq, String message_contents, Date message_time, int message_user_seq,
			String message_read, String message_icon, String message_img,int seq, String name,String photo) {
		this.message_seq = message_seq;
		this.user_seq = user_seq;
		this.message_contents = message_contents;
		this.message_time = message_time;
		this.message_user_seq = message_user_seq;
		this.message_read = message_read;
		this.message_icon = message_icon;
		this.message_img = message_img;
		this.seq= seq;
		this.name=name;
		this.photo=photo;
	}
	
	public MessagesDTO(int user_seq,int message_user_seq) {
		this.user_seq = user_seq;
		this.message_user_seq = message_user_seq;
	}
	
	public MessagesDTO(int user_seq,int message_user_seq,String message_contents) {
		this.user_seq = user_seq;
		this.message_user_seq = message_user_seq;
		this.message_contents = message_contents;
	}
	public MessagesDTO(int user_seq) {
		this.user_seq = user_seq;
	}
	
	public int getMessage_seq() {
		return message_seq;
	}
	public void setMessage_seq(int message_seq) {
		this.message_seq = message_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getMessage_contents() {
		return message_contents;
	}
	public void setMessage_contents(String message_contents) {
		this.message_contents = message_contents;
	}
	public Date getMessage_time() {
		return message_time;
	}
	public void setMessage_time(Date message_time) {
		this.message_time = message_time;
	}
	public int getMessage_user_seq() {
		return message_user_seq;
	}
	public void setMessage_user_seq(int message_user_seq) {
		this.message_user_seq = message_user_seq;
	}
	public String getMessage_read() {
		return message_read;
	}
	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}
	public String getMessage_icon() {
		return message_icon;
	}
	public void setMessage_icon(String message_icon) {
		this.message_icon = message_icon;
	}
	public String getMessage_img() {
		return message_img;
	}
	public void setMessage_img(String message_img) {
		this.message_img = message_img;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	
	

}
