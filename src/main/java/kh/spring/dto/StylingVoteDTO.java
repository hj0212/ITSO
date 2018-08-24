package kh.spring.dto;

import java.sql.Date;

public class StylingVoteDTO {

	private int styling_vote_seq;
	private String styling_title;
	private String styling_contents;
	private int styling_writer;
	private Date styling_writedate;
	private int styling_viewcount;
	private int styling_end;	
	private String styling_endterm;
	private int styling_voternum;
	private String photo;
	private String styling_writername;
	private String styling_writeip;
	private String styling_delete_flag;
	private Date styling_lastdate;

	
	public StylingVoteDTO() {}


	public StylingVoteDTO(int styling_vote_seq, String styling_title, String styling_contents, int styling_writer,
			Date styling_writedate, int styling_viewcount, int styling_end, String styling_endterm,
			int styling_voternum, String photo, String styling_writername, String styling_writeip,
			String styling_delete_flag, Date styling_lastdate) {
		super();
		this.styling_vote_seq = styling_vote_seq;
		this.styling_title = styling_title;
		this.styling_contents = styling_contents;
		this.styling_writer = styling_writer;
		this.styling_writedate = styling_writedate;
		this.styling_viewcount = styling_viewcount;
		this.styling_end = styling_end;
		this.styling_endterm = styling_endterm;
		this.styling_voternum = styling_voternum;
		this.photo = photo;
		this.styling_writername = styling_writername;
		this.styling_writeip = styling_writeip;
		this.styling_delete_flag = styling_delete_flag;
		this.styling_lastdate = styling_lastdate;
	}


	public int getStyling_vote_seq() {
		return styling_vote_seq;
	}


	public void setStyling_vote_seq(int styling_vote_seq) {
		this.styling_vote_seq = styling_vote_seq;
	}


	public String getStyling_title() {
		return styling_title;
	}


	public void setStyling_title(String styling_title) {
		this.styling_title = styling_title;
	}


	public String getStyling_contents() {
		return styling_contents;
	}


	public void setStyling_contents(String styling_contents) {
		this.styling_contents = styling_contents;
	}


	public int getStyling_writer() {
		return styling_writer;
	}


	public void setStyling_writer(int styling_writer) {
		this.styling_writer = styling_writer;
	}


	public Date getStyling_writedate() {
		return styling_writedate;
	}


	public void setStyling_writedate(Date styling_writedate) {
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


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getStyling_writername() {
		return styling_writername;
	}


	public void setStyling_writername(String styling_writername) {
		this.styling_writername = styling_writername;
	}


	public String getStyling_writeip() {
		return styling_writeip;
	}


	public void setStyling_writeip(String styling_writeip) {
		this.styling_writeip = styling_writeip;
	}


	public String getStyling_delete_flag() {
		return styling_delete_flag;
	}


	public void setStyling_delete_flag(String styling_delete_flag) {
		this.styling_delete_flag = styling_delete_flag;
	}


	public Date getStyling_lastdate() {
		return styling_lastdate;
	}


	public void setStyling_lastdate(Date styling_lastdate) {
		this.styling_lastdate = styling_lastdate;
	}
	
}
