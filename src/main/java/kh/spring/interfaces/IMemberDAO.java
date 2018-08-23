package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.FollowDTO;
import kh.spring.dto.MemberDTO;

public interface IMemberDAO {
	  public List<MemberDTO> loginExist(MemberDTO dto);
	  public List<MemberDTO> getUserData(MemberDTO dto);
	  public int insertUserData(MemberDTO dto);
	  public int updateUserData(MemberDTO dto);
	  public int deleteUserData(MemberDTO dto);
	  public List<MemberDTO> emailExist(String email);
	  public int insertFollowData(FollowDTO dto);
	  public int deleteFollowData(FollowDTO dto);
	  public List<MemberDTO> getFollowerList(MemberDTO dto);
	  public List<MemberDTO> getFollowingList(MemberDTO dto);
}
