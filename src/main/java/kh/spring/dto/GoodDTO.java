package kh.spring.dto;

public class GoodDTO {
	private int social_good_seq;
	private int social_seq;
	private int user_seq;
	public GoodDTO(int social_good_seq, int social_seq, int user_seq) {
		this.social_good_seq = social_good_seq;
		this.social_seq = social_seq;
		this.user_seq = user_seq;
	}
	public GoodDTO(int social_seq,int user_seq) {
		this.social_seq = social_seq;
		this.user_seq = user_seq;
	}
	public GoodDTO() {
	}
	
	public GoodDTO(int social_seq) {
		this.social_seq = social_seq;
	}
	public int getSocial_good_seq() {
		return social_good_seq;
	}
	public void setSocial_good_seq(int social_good_seq) {
		this.social_good_seq = social_good_seq;
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


}
