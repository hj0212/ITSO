package kh.spring.dto;

public class StylingVoteDTO {

	private int styling_vote_seq;
	private String styling_vote_title;
	private String styling_vote_contents;
	private int styling_writer;
	private String styling_writedate;
	private int styling_viewcount;
	private int styling_end;	
	private String styling_endterm;
	private int styling_voternum;

	
	public StylingVoteDTO() {}


	public StylingVoteDTO(int styling_vote_seq, String styling_vote_title, String styling_vote_contents,
			int styling_writer, String styling_writedate, int styling_viewcount, int styling_end,
			String styling_endterm, int styling_voternum) {
		super();
		this.styling_vote_seq = styling_vote_seq;
		this.styling_vote_title = styling_vote_title;
		this.styling_vote_contents = styling_vote_contents;
		this.styling_writer = styling_writer;
		this.styling_writedate = styling_writedate;
		this.styling_viewcount = styling_viewcount;
		this.styling_end = styling_end;
		this.styling_endterm = styling_endterm;
		this.styling_voternum = styling_voternum;
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


	public int getStyling_writer() {
		return styling_writer;
	}


	public void setStyling_writer(int styling_writer) {
		this.styling_writer = styling_writer;
	}


	public String getStyling_writedate() {
		return styling_writedate;
	}


	public void setStyling_writedate(String styling_writedate) {
		this.styling_writedate = styling_writedate;
	}


	public int getStyling_viewcount() {
		return styling_viewcount;
	}


	public void setStyling_viewcount(int styling_viewcount) {
		this.styling_viewcount = styling_viewcount;
	}


	public int getStyling_end() {
		return styling_end;
	}


	public void setStyling_end(int styling_end) {
		this.styling_end = styling_end;
	}


	public String getStyling_endterm() {
		return styling_endterm;
	}


	public void setStyling_endterm(String styling_endterm) {
		this.styling_endterm = styling_endterm;
	}


	public int getStyling_voternum() {
		return styling_voternum;
	}


	public void setStyling_voternum(int styling_voternum) {
		this.styling_voternum = styling_voternum;
	}
	
	

	
}
