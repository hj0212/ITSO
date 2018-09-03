package kh.spring.dto;

public class ReportDTO {
	private int report_seq;
	private int user_seq;
	private String report_reason;
	private int reporting_user;
	private int board_seq;
	private String board;
	
	public ReportDTO() {
		super();
	}

	public ReportDTO(int report_seq, int user_seq, String report_reason, int reporting_user, int board_seq,
			String board) {
		super();
		this.report_seq = report_seq;
		this.user_seq = user_seq;
		this.report_reason = report_reason;
		this.reporting_user = reporting_user;
		this.board_seq = board_seq;
		this.board = board;
	}

	public int getReport_seq() {
		return report_seq;
	}

	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public int getReporting_user() {
		return reporting_user;
	}

	public void setReporting_user(int reporting_user) {
		this.reporting_user = reporting_user;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}
	
	
	
}
