package kh.spring.dto;

public class TipCommentDTO {
	int tip_comment_seq;
	int tip_seq;
	int user_seq;
	String tip_comment_contents;
	String name;
	String tip_comment_time;
	String photo;
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getTip_comment_time() {
		return tip_comment_time;
	}

	public void setTip_comment_time(String tip_comment_time) {
		this.tip_comment_time = tip_comment_time;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "TipCommentDTO [tip_comment_seq=" + tip_comment_seq + ", tip_seq=" + tip_seq + ", user_seq=" + user_seq
				+ ", tip_comment_contents=" + tip_comment_contents + ", name=" + name + "]";
	}

	public int getTip_comment_seq() {
		return tip_comment_seq;
	}

	public void setTip_comment_seq(int tip_comment_seq) {
		this.tip_comment_seq = tip_comment_seq;
	}

	public int getTip_seq() {
		return tip_seq;
	}

	public void setTip_seq(int tip_seq) {
		this.tip_seq = tip_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getTip_comment_contents() {
		return tip_comment_contents;
	}

	public void setTip_comment_contents(String tip_comment_contents) {
		this.tip_comment_contents = tip_comment_contents;
	}


	/**
	 * @param tip_comment_seq
	 * @param tip_seq
	 * @param user_seq
	 * @param tip_comment_contents
	 * @param name
	 * @param tip_comment_time
	 */
	public TipCommentDTO(int tip_comment_seq, int tip_seq, int user_seq, String tip_comment_contents, String name,
			String tip_comment_time) {
		this.tip_comment_seq = tip_comment_seq;
		this.tip_seq = tip_seq;
		this.user_seq = user_seq;
		this.tip_comment_contents = tip_comment_contents;
		this.name = name;
		this.tip_comment_time = tip_comment_time;
	}

	/**
	 * 
	 */
	public TipCommentDTO() {
	}

}
