package kh.spring.dto;

public class CollectionDTO {
	private int collection_seq;
	private String collection_title;
	private String collection_contents;
	private int writer;
	private String photo;
	
	public CollectionDTO(int collection_seq, String collection_title, String collection_contents, int writer,
			String photo) {
		super();
		this.collection_seq = collection_seq;
		this.collection_title = collection_title;
		this.collection_contents = collection_contents;
		this.writer = writer;
		this.photo = photo;
	}
	public CollectionDTO() {
		super();
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
		
}
