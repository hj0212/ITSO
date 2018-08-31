package kh.spring.dto;

public class SearchedUserInfoDTO {
	private int seq;
	private String email;
	private String name;
	private String photo;
	private String state;
	
	public SearchedUserInfoDTO(int seq, String email, String name, String photo, String state) {
		this.seq = seq;
		this.email = email;
		this.name = name;
		this.photo = photo;
		this.state = state;
	}

	public SearchedUserInfoDTO() {}

	public int getSeq() {
		return seq;
	}
	
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
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
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
}
