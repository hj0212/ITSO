package kh.spring.jsonobject;

public class SocialTag {
	private String name;
	private String brand;
	private String store;
	private String url;
	private String category;
	private Coords coords;
	
	public SocialTag(String name, String brand, String store, String url, String category, Coords coords) {
		this.name = name;
		this.brand = brand;
		this.store = store;
		this.url = url;
		this.category = category;
		this.coords = coords;
	}
	
	public SocialTag() {}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getBrand() {
		return brand;
	}
	
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public String getStore() {
		return store;
	}
	
	public void setStore(String store) {
		this.store = store;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public Coords getCoords() {
		return coords;
	}
	
	public void setCoords(Coords coords) {
		this.coords = coords;
	}
}
