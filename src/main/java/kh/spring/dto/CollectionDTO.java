package kh.spring.dto;

public class CollectionDTO {
	private int collection_seq;
	private String collection_title;
	private String collection_contents;
	private int writer;
	private int social_seq;
	private String photo;
	private String name; // 작성자 이름
	
	public CollectionDTO() {
		super();
	}
	public CollectionDTO(int collection_seq, String collection_title, String collection_contents, int writer,
			int social_seq, String photo, String name) {
		super();
		this.collection_seq = collection_seq;
		this.collection_title = collection_title;
		this.collection_contents = collection_contents;
		this.writer = writer;
		this.social_seq = social_seq;
		this.photo = photo;
		this.name = name;
	}
	public int getCollection_seq() {
		return collection_seq;
	}
	public void setCollection_seq(int collection_seq) {
		this.collection_seq = collection_seq;
	}
	public String getCollection_title() {
		return collection_title;
	}
	public void setCollection_title(String collection_title) {
		this.collection_title = collection_title;
	}
	public String getCollection_contents() {
		return collection_contents;
	}
	public void setCollection_contents(String collection_contents) {
		this.collection_contents = collection_contents;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public int getSocial_seq() {
		return social_seq;
	}
	public void setSocial_seq(int social_seq) {
		this.social_seq = social_seq;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
