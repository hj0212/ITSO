package kh.spring.dto;

public class AdminPageDTO {

	String gender;
	int femaleUsers;
	int maleUsers;
	
	
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
	 */
	public AdminPageDTO(String gender, int femaleUsers, int maleUsers) {
		this.gender = gender;
		this.femaleUsers = femaleUsers;
		this.maleUsers = maleUsers;
	}

	public AdminPageDTO() {
	}
	
	
	
	
}
