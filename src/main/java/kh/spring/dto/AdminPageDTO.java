package kh.spring.dto;

public class AdminPageDTO {

	String gender;
	int femaleUsers;
	int maleUsers;
	int user_seq;
	int report_count;
	String report_reason;
	String name;
	String email;
	String create_date;
	String block;

	
	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public String getBlock() {
		return block;
	}

	public void setBlock(String block) {
		this.block = block;
	}

	public int getMaleUsers() {
		return maleUsers;
	}

	public void setMaleUsers(int maleUsers) {
		this.maleUsers = maleUsers;
	}

	public int getFemaleUsers() {
		return femaleUsers;
	}

	public void setFemaleUsers(int femaleUsers) {
		this.femaleUsers = femaleUsers;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @param gender
	 * @param femaleUsers
	 * @param maleUsers
	 * @param user_seq
	 * @param report_count
	 * @param report_reason
	 * @param name
	 * @param email
	 * @param create_date
	 * @param block
	 */
	public AdminPageDTO(String gender, int femaleUsers, int maleUsers, int user_seq, int report_count,
			String report_reason, String name, String email, String create_date, String block) {
		super();
		this.gender = gender;
		this.femaleUsers = femaleUsers;
		this.maleUsers = maleUsers;
		this.user_seq = user_seq;
		this.report_count = report_count;
		this.report_reason = report_reason;
		this.name = name;
		this.email = email;
		this.create_date = create_date;
		this.block = block;
	}

	public AdminPageDTO() {
	}

}
