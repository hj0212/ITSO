package kh.spring.dto;

public class StylingVoteItemDTO {

	private int styling_vote_seq;
	private int styling_vote_item_seq;
	private String styling_vote_contents;
	private String styling_vote_item_photo;
	
	public StylingVoteItemDTO() {}

	public StylingVoteItemDTO(int styling_vote_seq, int styling_vote_item_seq, String styling_vote_contents,
			String styling_vote_item_photo) {
		super();
		this.styling_vote_seq = styling_vote_seq;
		this.styling_vote_item_seq = styling_vote_item_seq;
		this.styling_vote_contents = styling_vote_contents;
		this.styling_vote_item_photo = styling_vote_item_photo;
	}

	public int getStyling_vote_seq() {
		return styling_vote_seq;
	}

	public void setStyling_vote_seq(int styling_vote_seq) {
		this.styling_vote_seq = styling_vote_seq;
	}

	public int getStyling_vote_item_seq() {
		return styling_vote_item_seq;
	}

	public void setStyling_vote_item_seq(int styling_vote_item_seq) {
		this.styling_vote_item_seq = styling_vote_item_seq;
	}

	public String getStyling_vote_contents() {
		return styling_vote_contents;
	}

	public void setStyling_vote_contents(String styling_vote_contents) {
		this.styling_vote_contents = styling_vote_contents;
	}

	public String getStyling_vote_item_photo() {
		return styling_vote_item_photo;
	}

	public void setStyling_vote_item_photo(String styling_vote_item_photo) {
		this.styling_vote_item_photo = styling_vote_item_photo;
	}
		
}
