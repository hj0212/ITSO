package kh.spring.dto;

public class StylingVoteResultDTO {

	private int styling_vote_item_seq;
	private int eachcount;
	private int totalcount;
	private float eachrate;
	
	public StylingVoteResultDTO() {}

	public StylingVoteResultDTO(int styling_vote_item_seq, int eachcount, int totalcount, float eachrate) {
		super();
		this.styling_vote_item_seq = styling_vote_item_seq;
		this.eachcount = eachcount;
		this.totalcount = totalcount;
		this.eachrate = eachrate;
	}

	public int getStyling_vote_item_seq() {
		return styling_vote_item_seq;
	}

	public void setStyling_vote_item_seq(int styling_vote_item_seq) {
		this.styling_vote_item_seq = styling_vote_item_seq;
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

	public float getEachrate() {
		return eachrate;
	}

	public void setEachrate(float eachrate) {
		this.eachrate = eachrate;
	}
	
	
}
