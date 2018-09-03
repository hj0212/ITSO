package kh.spring.dto;

import java.util.List;

public class MainDTO {
	private List<SocialBoardDTO> socialList;
	private List<SocialBoardDTO> goodList;
	private List<MemberDTO> followingList;
	
	public List<SocialBoardDTO> getSocialList() {
		return socialList;
	}
	public void setSocialList(List<SocialBoardDTO> socialList) {
		this.socialList = socialList;
	}
	public List<SocialBoardDTO> getGoodList() {
		return goodList;
	}
	public void setGoodList(List<SocialBoardDTO> goodList) {
		this.goodList = goodList;
	}
	public List<MemberDTO> getFollowingList() {
		return followingList;
	}
	public void setFollowingList(List<MemberDTO> followingList) {
		this.followingList = followingList;
	}
	public MainDTO(List<SocialBoardDTO> socialList, List<SocialBoardDTO> goodList, List<MemberDTO> followingList) {
		super();
		this.socialList = socialList;
		this.goodList = goodList;
		this.followingList = followingList;
	}
	public MainDTO() {
		super();
	}
	
	
}
