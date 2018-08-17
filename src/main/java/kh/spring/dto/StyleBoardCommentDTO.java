package kh.spring.dto;

public class StyleBoardCommentDTO {

	private int styling_comment_seq;
	private int styling_seq;
	private int user_seq;
	private String styling_comment_time;
	private String styling_comment_contents;
	
	public StyleBoardCommentDTO() {	}

	public StyleBoardCommentDTO(int styling_comment_seq, int styling_seq, int user_seq, String styling_comment_time,
			String styling_comment_contents) {
		super();
		this.styling_comment_seq = styling_comment_seq;
		this.styling_seq = styling_seq;
		this.user_seq = user_seq;
		this.styling_comment_time = styling_comment_time;
		this.styling_comment_contents = styling_comment_contents;
	}	

	public StyleBoardCommentDTO(int styling_comment_seq) {
		super();
		this.styling_comment_seq = styling_comment_seq;
	}

	public int getStyling_comment_seq() {
		return styling_comment_seq;
	}

	public void setStyling_comment_seq(int styling_comment_seq) {
		this.styling_comment_seq = styling_comment_seq;
	}

	public int getStyling_seq() {
		return styling_seq;
	}

	public void setStyling_seq(int styling_seq) {
		this.styling_seq = styling_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getStyling_comment_time() {
		return styling_comment_time;
	}

	public void setStyling_comment_time(String styling_comment_time) {
		this.styling_comment_time = styling_comment_time;
	}

	public String getStyling_comment_contents() {
		return styling_comment_contents;
	}

	public void setStyling_comment_contents(String styling_comment_contents) {
		this.styling_comment_contents = styling_comment_contents;
	}

	
	
}
