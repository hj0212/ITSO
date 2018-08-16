package kh.spring.jsonobject;

public class Coords {
	private String lat;
	private String along;
	
	public Coords(String lat, String along) {
		this.lat = lat;
		this.along = along;
	}

	public Coords() {}

	public String getLat() {
		return lat;
	}
	
	public void setLat(String lat) {
		this.lat = lat;
	}
	
	public String getAlong() {
		return along;
	}
	
	public void setAlong(String along) {
		this.along = along;
	}
}
