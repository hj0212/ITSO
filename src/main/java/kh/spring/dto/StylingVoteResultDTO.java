package kh.spring.dto;

public class StylingVoteResultDTO {

	private int styling_vote_seq;
	private int eachcount;
	private int totalcount;
	private Double eachrate;
	
	public StylingVoteResultDTO() {}

	public StylingVoteResultDTO(int styling_vote_seq, int eachcount, int totalcount, Double eachrate) {
		super();
		this.styling_vote_seq = styling_vote_seq;
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

	public Double getEachrate() {
		return eachrate;
	}

	public void setEachrate(Double eachrate) {
		this.eachrate = eachrate;
	}
	
}
