package kh.spring.dto;

public class FollowDTO {
	private int follow_seq;
	private int user_seq;
	private int following_seq;
	
	public FollowDTO() {
		super();
	}
	public FollowDTO(int follow_seq, int user_seq, int following_seq) {
		super();
		this.follow_seq = follow_seq;
		this.user_seq = user_seq;
		this.following_seq = following_seq;
	}
	
	public FollowDTO(int user_seq, int following_seq) {
		super();
		this.user_seq = user_seq;
		this.following_seq = following_seq;
	}
	public int getFollow_seq() {
		return follow_seq;
	}
	public void setFollow_seq(int follow_seq) {
		this.follow_seq = follow_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getFollowing_seq() {
		return following_seq;
	}
	public void setFollowing_seq(int following_seq) {
		this.following_seq = following_seq;
	}
}
