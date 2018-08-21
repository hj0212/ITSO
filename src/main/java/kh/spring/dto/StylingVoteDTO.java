package kh.spring.dto;

public class StylingVoteDTO {

	private int styling_vote_seq;
	private String styling_vote_title;
	private String styling_vote_contents;
	private String styling_date;
	private int styling_viewcount;
	private String styling_vote_term;
	private int styling_seq;

	
	public StylingVoteDTO() {}


	public StylingVoteDTO(int styling_vote_seq, String styling_vote_title, String styling_vote_contents,
			String styling_date, int styling_viewcount, String styling_vote_term, int styling_seq) {
		super();
		this.styling_vote_seq = styling_vote_seq;
		this.styling_vote_title = styling_vote_title;
		this.styling_vote_contents = styling_vote_contents;
		this.styling_date = styling_date;
		this.styling_viewcount = styling_viewcount;
		this.styling_vote_term = styling_vote_term;
		this.styling_seq = styling_seq;
	}

	public int getStyling_vote_seq() {
		return styling_vote_seq;
	}


	public void setStyling_vote_seq(int styling_vote_seq) {
		this.styling_vote_seq = styling_vote_seq;
	}


	public String getStyling_vote_title() {
		return styling_vote_title;
	}


	public void setStyling_vote_title(String styling_vote_title) {
		this.styling_vote_title = styling_vote_title;
	}


	public String getStyling_vote_contents() {
		return styling_vote_contents;
	}


	public void setStyling_vote_contents(String styling_vote_contents) {
		this.styling_vote_contents = styling_vote_contents;
	}


	public String getStyling_date() {
		return styling_date;
	}


	public void setStyling_date(String styling_date) {
		this.styling_date = styling_date;
	}


	public int getStyling_viewcount() {
		return styling_viewcount;
	}


	public void setStyling_viewcount(int styling_viewcount) {
		this.styling_viewcount = styling_viewcount;
	}


	public String getStyling_vote_term() {
		return styling_vote_term;
	}


	public void setStyling_vote_term(String styling_vote_term) {
		this.styling_vote_term = styling_vote_term;
	}


	public int getStyling_seq() {
		return styling_seq;
	}


	public void setStyling_seq(int styling_seq) {
		this.styling_seq = styling_seq;
	}
	
	
}
