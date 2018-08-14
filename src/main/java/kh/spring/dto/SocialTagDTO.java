package kh.spring.dto;

public class SocialTagDTO {
	private int tag_seq;
	private int social_seq;
	private String tag_name;
	private String tag_brand;
	private String tag_store;
	private String tag_url;
	private String tag_lat;
	private String tag_along;
	private String tag_category;
	
	public SocialTagDTO(int tag_seq, int social_seq, String tag_name, String tag_brand, String tag_store, String tag_url, String tag_lat, String tag_along, String tag_category) {
		this.tag_seq = tag_seq;
		this.social_seq = social_seq;
		this.tag_name = tag_name;
		this.tag_brand = tag_brand;
		this.tag_store = tag_store;
		this.tag_url = tag_url;
		this.tag_lat = tag_lat;
		this.tag_along = tag_along;
		this.tag_category = tag_category;
	}
}
