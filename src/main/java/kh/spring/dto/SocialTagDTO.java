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

	public SocialTagDTO(int social_seq, String tag_name, String tag_brand, String tag_store, String tag_url, String tag_lat, String tag_along, String tag_category) {
		this.social_seq = social_seq;
		this.tag_name = tag_name;
		this.tag_brand = tag_brand;
		this.tag_store = tag_store;
		this.tag_url = tag_url;
		this.tag_lat = tag_lat;
		this.tag_along = tag_along;
		this.tag_category = tag_category;
	}

	public SocialTagDTO() {}

	public int getTag_seq() {
		return tag_seq;
	}

	public void setTag_seq(int tag_seq) {
		this.tag_seq = tag_seq;
	}

	public int getSocial_seq() {
		return social_seq;
	}

	public void setSocial_seq(int social_seq) {
		this.social_seq = social_seq;
	}

	public String getTag_name() {
		return tag_name;
	}

	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}

	public String getTag_brand() {
		return tag_brand;
	}

	public void setTag_brand(String tag_brand) {
		this.tag_brand = tag_brand;
	}

	public String getTag_store() {
		return tag_store;
	}

	public void setTag_store(String tag_store) {
		this.tag_store = tag_store;
	}

	public String getTag_url() {
		return tag_url;
	}

	public void setTag_url(String tag_url) {
		this.tag_url = tag_url;
	}

	public String getTag_lat() {
		return tag_lat;
	}

	public void setTag_lat(String tag_lat) {
		this.tag_lat = tag_lat;
	}

	public String getTag_along() {
		return tag_along;
	}

	public void setTag_along(String tag_along) {
		this.tag_along = tag_along;
	}

	public String getTag_category() {
		return tag_category;
	}

	public void setTag_category(String tag_category) {
		this.tag_category = tag_category;
	}
}
