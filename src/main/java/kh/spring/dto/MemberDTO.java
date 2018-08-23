package kh.spring.dto;

public class MemberDTO {
	private int seq;
	private Integer age;
	private String email;
	private String pw;
	private String name;
	private String g_email;
	private String g_name;
	private String part;
	private String create_Date;
	private String block;
	private String photo;
	private String withdrawal;
	private String state;
	private String followcheck; // 팔로우여부
	
	
	public MemberDTO(String email, String pw, String name,Integer age) {
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.age = age;
	}
	public MemberDTO(int seq) {
		this.seq = seq;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getG_email() {
		return g_email;
	}
	public void setG_email(String g_email) {
		this.g_email = g_email;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getCreate_Date() {
		return create_Date;
	}
	public void setCreate_Date(String create_Date) {
		this.create_Date = create_Date;
	}
	public String getBlock() {
		return block;
	}
	public void setBlock(String block) {
		this.block = block;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getWithdrawal() {
		return withdrawal;
	}
	public void setWithdrawal(String withdrawal) {
		this.withdrawal = withdrawal;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getFollowcheck() {
		return followcheck;
	}
	public void setFollowcheck(String followcheck) {
		this.followcheck = followcheck;
	}

	public MemberDTO(int seq, Integer age, String email, String pw, String name, String g_email, String g_name,
			String part, String create_Date, String block, String photo, String withdrawal, String state,
			String followcheck) {
		super();
		this.seq = seq;
		this.age = age;
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.g_email = g_email;
		this.g_name = g_name;
		this.part = part;
		this.create_Date = create_Date;
		this.block = block;
		this.photo = photo;
		this.withdrawal = withdrawal;
		this.state = state;
		this.followcheck = followcheck;
	}

	public MemberDTO() {
		super();
	}
	
	
}
