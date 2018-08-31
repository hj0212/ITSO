package kh.spring.dto;

public class SearchedTipDTO {
	private int tip_seq;
	private String tip_title;
	private int tip_writer;
	private String tip_date;
	private int tip_viewcount;
	private String category;
	private int tip_like_count;
	private String name;
	private String photo;
	
	public SearchedTipDTO(int tip_seq, String tip_title, int tip_writer, String tip_date, int tip_viewcount, String category, int tip_like_count, String name, String photo) {
		this.tip_seq = tip_seq;
		this.tip_title = tip_title;
		this.tip_writer = tip_writer;
		this.tip_date = tip_date;
		this.tip_viewcount = tip_viewcount;
		this.category = category;
		this.tip_like_count = tip_like_count;
		this.name = name;
		this.photo = photo;
	}

	public SearchedTipDTO() {}

	public int getTip_seq() {
		return tip_seq;
	}
	
	public void setTip_seq(int tip_seq) {
		this.tip_seq = tip_seq;
	}
	
	public String getTip_title() {
		return tip_title;
	}
	
	public void setTip_title(String tip_title) {
		this.tip_title = tip_title;
	}
	
	public int getTip_writer() {
		return tip_writer;
	}
	
	public void setTip_writer(int tip_writer) {
		this.tip_writer = tip_writer;
	}
	
	public String getTip_date() {
		return tip_date;
	}
	
	public void setTip_date(String tip_date) {
		this.tip_date = tip_date;
	}
	
	public int getTip_viewcount() {
		return tip_viewcount;
	}
	
	public void setTip_viewcount(int tip_viewcount) {
		this.tip_viewcount = tip_viewcount;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getTip_like_count() {
		return tip_like_count;
	}
	
	public void setTip_like_count(int tip_like_count) {
		this.tip_like_count = tip_like_count;
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
}
