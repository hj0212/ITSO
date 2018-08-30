package kh.spring.dto;

public class CollectionDTO {
	private int collection_seq;
	private String collection_title;
	private String collection_contents;
	private int collection_writer;
	private int social_seq;
	private String photo;
	private String writerName; // 작성자 이름
	
	public CollectionDTO() {
		super();
	}
	
	public CollectionDTO(int collection_seq, String collection_title, String collection_contents, int collection_writer,
			int social_seq, String photo, String writerName) {
		super();
		this.collection_seq = collection_seq;
		this.collection_title = collection_title;
		this.collection_contents = collection_contents;
		this.collection_writer = collection_writer;
		this.social_seq = social_seq;
		this.photo = photo;
		this.writerName = writerName;
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

	public int getCollection_writer() {
		return collection_writer;
	}

	public void setCollection_writer(int collection_writer) {
		this.collection_writer = collection_writer;
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

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	
}
