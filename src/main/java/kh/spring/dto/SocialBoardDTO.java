package kh.spring.dto;

import java.sql.Date;

public class SocialBoardDTO {
	private int collection_seq;
	private int social_seq;
	private String social_title;
	private String social_contents;
	private int social_writer;
	private String writerName;
	private Date social_date;
	private String photo;
	private String gender;
	private int age;
	private String user_photo;
	private String userState;
	private int comment_count;
	
	
	public SocialBoardDTO() {}

	

	public SocialBoardDTO(int collection_seq, int social_seq, String social_title, String social_contents,
			int social_writer, String writerName, Date social_date, String photo, String gender, int age,
			String user_photo, String userState, int comment_count) {
		super();
		this.collection_seq = collection_seq;
		this.social_seq = social_seq;
		this.social_title = social_title;
		this.social_contents = social_contents;
		this.social_writer = social_writer;
		this.writerName = writerName;
		this.social_date = social_date;
		this.photo = photo;
		this.gender = gender;
		this.age = age;
		this.user_photo = user_photo;
		this.userState = userState;
		this.comment_count = comment_count;
	}



	public SocialBoardDTO(int social_seq, String social_title, String social_contents, int social_writer, String photo, String gender, int age) {
		super();
		this.social_seq = social_seq;
		this.social_title = social_title;
		this.social_contents = social_contents;
		this.social_writer = social_writer;
		this.photo = photo;
		this.gender = gender;
		this.age = age;
	}

	public SocialBoardDTO(String social_title, String social_contents, int social_writer, String photo, String gender, int age) {
		this.social_title = social_title;
		this.social_contents = social_contents;
		this.social_writer = social_writer;
		this.photo = photo;
		this.gender = gender;
		this.age = age;
	}
	
	public SocialBoardDTO(int age,String gender,int social_seq) {
		this.age = age;
		this.gender = gender;
		this.social_seq =social_seq;
	}


	public int getCollection_seq() {
		return collection_seq;
	}


	public void setCollection_seq(int collection_seq) {
		this.collection_seq = collection_seq;
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


	public String getWriterName() {
		return writerName;
	}


	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}


	public Date getSocial_date() {
		return social_date;
	}


	public void setSocial_date(Date social_date) {
		this.social_date = social_date;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	
}
