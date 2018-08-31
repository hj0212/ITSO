package kh.spring.dto;

public class StylingVoteResultDTO {

	private int styling_vote_seq;
	private int eachcount;
	private int totalcount;
	private Double eachrate;
	private int vote_value;
	
	public StylingVoteResultDTO() {}

	

	public StylingVoteResultDTO(int styling_vote_seq, int eachcount, int totalcount, Double eachrate, int vote_value) {
		super();
		this.styling_vote_seq = styling_vote_seq;
		this.eachcount = eachcount;
		this.totalcount = totalcount;
		this.eachrate = eachrate;
		this.vote_value = vote_value;
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



	public int getVote_value() {
		return vote_value;
	}



	public void setVote_value(int vote_value) {
		this.vote_value = vote_value;
	}
	
}
