package kh.spring.dto;

public class MessageDTO {
	private int user_seq;
	private int message_seq;
	private int message_recipoent_seq;
	private String message_contents;
	private Integer message_time;
	
	
	
	
	
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getMessage_seq() {
		return message_seq;
	}
	public void setMessage_seq(int message_seq) {
		this.message_seq = message_seq;
	}
	public int getMessage_recipoent_seq() {
		return message_recipoent_seq;
	}
	public void setMessage_recipoent_seq(int message_recipoent_seq) {
		this.message_recipoent_seq = message_recipoent_seq;
	}
	public String getMessage_contents() {
		return message_contents;
	}
	public void setMessage_contents(String message_contents) {
		this.message_contents = message_contents;
	}
	public Integer getMessage_time() {
		return message_time;
	}
	public void setMessage_time(Integer message_time) {
		this.message_time = message_time;
	}
	
	
	

}
