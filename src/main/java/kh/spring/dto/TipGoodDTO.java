package kh.spring.dto;

public class TipGoodDTO {

	int tip_good_seq;
	int tip_seq;
	int user_seq;

	@Override
	public String toString() {
		return "TipGoodDTO [tip_good_seq=" + tip_good_seq + ", tip_seq=" + tip_seq + ", user_seq=" + user_seq + "]";
	}

	public int getTip_good_seq() {
		return tip_good_seq;
	}

	public void setTip_good_seq(int tip_good_seq) {
		this.tip_good_seq = tip_good_seq;
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

	public TipGoodDTO(int tip_good_seq, int tip_seq, int user_seq) {
		super();
		this.tip_good_seq = tip_good_seq;
		this.tip_seq = tip_seq;
		this.user_seq = user_seq;
	}

	public TipGoodDTO() {
		super();
	}

}
