package kh.spring.dto;

public class SocialHashTagDTO {
	private int social_hash_tag_seq;
	private int social_seq;
	private int user_seq;
	private String social_hash_tag_contents;
	
	public SocialHashTagDTO(int social_hash_tag_seq, int social_seq, int user_seq, String social_hash_tag_contents) {
		this.social_hash_tag_seq = social_hash_tag_seq;
		this.social_seq = social_seq;
		this.user_seq = user_seq;
		this.social_hash_tag_contents = social_hash_tag_contents;
	}

	public SocialHashTagDTO(int social_seq, int user_seq, String social_hash_tag_contents) {
		this.social_seq = social_seq;
		this.user_seq = user_seq;
		this.social_hash_tag_contents = social_hash_tag_contents;
	}

	public SocialHashTagDTO() {}

	public int getSocial_hash_tag_seq() {
		return social_hash_tag_seq;
	}
	
	public void setSocial_hash_tag_seq(int social_hash_tag_seq) {
		this.social_hash_tag_seq = social_hash_tag_seq;
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
	
	public String getSocial_hash_tag_contents() {
		return social_hash_tag_contents;
	}
	
	public void setSocial_hash_tag_contents(String social_hash_tag_contents) {
		this.social_hash_tag_contents = social_hash_tag_contents;
	}
}
