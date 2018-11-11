package kh.spring.jsonobject;

public class StylingParam {
	private int seq; //user.seq
	private int styling_vote_seq;
	
	public StylingParam() {}
	
	public StylingParam(int seq, int styling_vote_seq) {
		super();
		this.seq = seq;
		this.styling_vote_seq = styling_vote_seq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getStyling_vote_seq() {
		return styling_vote_seq;
	}
	public void setStyling_vote_seq(int styling_vote_seq) {
		this.styling_vote_seq = styling_vote_seq;
	} 
	
}
