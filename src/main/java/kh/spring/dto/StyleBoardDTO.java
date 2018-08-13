package kh.spring.dto;

public class StyleBoardDTO {
	
	private int styling_seq;
	private String styling_title;
	private String styling_contents;
	private int styling_writer;
	private String styling_date;
	private String styling_viewcount;
	
	public StyleBoardDTO() {
		super();
	}

	public StyleBoardDTO(int styling_seq, String styling_title, String styling_contents, int styling_writer,
			String styling_date, String styling_viewcount) {
		super();
		this.styling_seq = styling_seq;
		this.styling_title = styling_title;
		this.styling_contents = styling_contents;
		this.styling_writer = styling_writer;
		this.styling_date = styling_date;
		this.styling_viewcount = styling_viewcount;
	}

	public int getStyling_seq() {
		return styling_seq;
	}

	public void setStyling_seq(int styling_seq) {
		this.styling_seq = styling_seq;
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

	public String getStyling_date() {
		return styling_date;
	}

	public void setStyling_date(String styling_date) {
		this.styling_date = styling_date;
	}

	public String getStyling_viewcount() {
		return styling_viewcount;
	}

	public void setStyling_viewcount(String styling_viewcount) {
		this.styling_viewcount = styling_viewcount;
	}
	
	

}
