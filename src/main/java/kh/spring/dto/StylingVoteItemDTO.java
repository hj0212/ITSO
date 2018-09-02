package kh.spring.dto;

import java.util.List;

public class StylingVoteItemDTO {

	private int styling_vote_seq;
	private int styling_vote_item_seq;
	private String styling_vote_item_contents;
	private String styling_vote_item_photo;
	private int eachcount;
	private int totalcount;
	private double eachrate;
	
	private List<StylingVoteItemDTO> items;
	
	public StylingVoteItemDTO() {}

	public StylingVoteItemDTO(int styling_vote_seq, int styling_vote_item_seq, String styling_vote_item_contents,
			String styling_vote_item_photo) {
		super();
		this.styling_vote_seq = styling_vote_seq;
		this.styling_vote_item_seq = styling_vote_item_seq;
		this.styling_vote_item_contents = styling_vote_item_contents;
		this.styling_vote_item_photo = styling_vote_item_photo;
		
	}

	
	public StylingVoteItemDTO(int styling_vote_seq, int styling_vote_item_seq, String styling_vote_item_contents,
			String styling_vote_item_photo, double eachrate) {
		super();
		this.styling_vote_seq = styling_vote_seq;
		this.styling_vote_item_seq = styling_vote_item_seq;
		this.styling_vote_item_contents = styling_vote_item_contents;
		this.styling_vote_item_photo = styling_vote_item_photo;
		this.eachrate = eachrate;
	}

	public StylingVoteItemDTO(int styling_vote_seq, int styling_vote_item_seq, String styling_vote_item_contents,
			String styling_vote_item_photo, int eachcount, int totalcount, double eachrate) {
		super();
		this.styling_vote_seq = styling_vote_seq;
		this.styling_vote_item_seq = styling_vote_item_seq;
		this.styling_vote_item_contents = styling_vote_item_contents;
		this.styling_vote_item_photo = styling_vote_item_photo;
		this.eachcount = eachcount;
		this.totalcount = totalcount;
		this.eachrate = eachrate;
		
	}

	public int getStyling_vote_seq() {
		return styling_vote_seq;
	}

	public void setStyling_vote_seq(int styling_vote_seq) {
		this.styling_vote_seq = styling_vote_seq;
	}

	public int getStyling_vote_item_seq() {
		return styling_vote_item_seq;
	}

	public void setStyling_vote_item_seq(int styling_vote_item_seq) {
		this.styling_vote_item_seq = styling_vote_item_seq;
	}

	public String getStyling_vote_item_contents() {
		return styling_vote_item_contents;
	}

	public void setStyling_vote_item_contents(String styling_vote_item_contents) {
		this.styling_vote_item_contents = styling_vote_item_contents;
	}

	public String getStyling_vote_item_photo() {
		return styling_vote_item_photo;
	}

	public void setStyling_vote_item_photo(String styling_vote_item_photo) {
		this.styling_vote_item_photo = styling_vote_item_photo;
	}

	public List<StylingVoteItemDTO> getItems() {
		return items;
	}

	public void setItems(List<StylingVoteItemDTO> items) {
		this.items = items;
	}

	public int getEachcount() {
		return eachcount;
	}

	public void setEachcount(int eachcount) {
		this.eachcount = eachcount;
	}

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}

	public double getEachrate() {
		return eachrate;
	}

	public void setEachrate(double eachrate) {
		this.eachrate = eachrate;
	}

	
		
}
