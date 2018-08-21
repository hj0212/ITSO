package kh.spring.dto;

import java.sql.Date;

public class SocialCommentDTO {
	private int social_comment_seq;
	private int social_seq;
	private int user_seq;
	private Date social_comment_time;
	private String social_comment_contents;
	private String name;
	
	public SocialCommentDTO(int social_comment_seq, int social_seq, int user_seq, Date social_comment_time, String social_comment_contents, String name) {
		this.social_comment_seq = social_comment_seq;
		this.social_seq = social_seq;
		this.user_seq = user_seq;
		this.social_comment_time = social_comment_time;
		this.social_comment_contents = social_comment_contents;
		this.name = name;
	}
	
	public SocialCommentDTO(int social_seq, int user_seq, String social_comment_contents) {
		this.social_seq = social_seq;
		this.user_seq = user_seq;
		this.social_comment_contents = social_comment_contents;
	}

	public SocialCommentDTO() {}

	public int getSocial_comment_seq() {
		return social_comment_seq;
	}
	
	public void setSocial_comment_seq(int social_comment_seq) {
		this.social_comment_seq = social_comment_seq;
	}
	
	public int getSocial_seq() {
		return social_seq;
	}
	
	public void setSocial_seq(int social_seq) {
		this.social_seq = social_seq;
	}
	
	public int getUser_seq() {
		return user_seq;
	}
	
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	
	public Date getSocial_comment_time() {
		return social_comment_time;
	}
	
	public void setSocial_comment_time(Date social_comment_time) {
		this.social_comment_time = social_comment_time;
	}
	
	public String getSocial_comment_contents() {
		return social_comment_contents;
	}
	
	public void setSocial_comment_contents(String social_comment_contents) {
		this.social_comment_contents = social_comment_contents;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
}
