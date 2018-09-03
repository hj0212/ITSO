package kh.spring.dto;

public class StylingVoteUserDTO {

	private int styling_vote_seq;
	private int user_seq;
	private int vote_value;
	
	public StylingVoteUserDTO() {}

	public StylingVoteUserDTO(int styling_vote_seq, int user_seq, int vote_value) {
		super();
		this.styling_vote_seq = styling_vote_seq;
		this.user_seq = user_seq;
		this.vote_value = vote_value;
	}

	public int getStyling_vote_seq() {
		return styling_vote_seq;
	}

	public void setStyling_vote_seq(int styling_vote_seq) {
		this.styling_vote_seq = styling_vote_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public int getVote_value() {
		return vote_value;
	}

	public void setVote_value(int vote_value) {
		this.vote_value = vote_value;
	}
	
}
