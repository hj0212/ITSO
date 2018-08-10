package kh.spring.dto;

public class SocialBoardDTO {
	private int social_seq;
	private String social_title;
	private String social_contents;
	private int social_writer;
	private String social_date;
	private String photo;
	
	public SocialBoardDTO() {
		super();
	}
	
	
	public SocialBoardDTO(int social_seq, String social_title, String social_contents, int social_writer,
			String social_date, String photo) {
		super();
		this.social_seq = social_seq;
		this.social_title = social_title;
		this.social_contents = social_contents;
		this.social_writer = social_writer;
		this.social_date = social_date;
		this.photo = photo;
	}


	public int getSocial_seq() {
		return social_seq;
	}


	public void setSocial_seq(int social_seq) {
		this.social_seq = social_seq;
	}


	public String getSocial_title() {
		return social_title;
	}


	public void setSocial_title(String social_title) {
		this.social_title = social_title;
	}


	public String getSocial_contents() {
		return social_contents;
	}


	public void setSocial_contents(String social_contents) {
		this.social_contents = social_contents;
	}


	public int getSocial_writer() {
		return social_writer;
	}


	public void setSocial_writer(int social_writer) {
		this.social_writer = social_writer;
	}


	public String getSocial_date() {
		return social_date;
	}


	public void setSocial_date(String social_date) {
		this.social_date = social_date;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	

}
