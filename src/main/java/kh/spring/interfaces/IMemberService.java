package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.FollowDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SearchedUserInfoDTO;

public interface IMemberService {
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
  public Integer checkFollow(FollowDTO dto);
  public MemberDTO selectSocialWriter(int social_seq);
  public List<SearchedUserInfoDTO> getSearchedUserList(String word);
  public List<MemberDTO> recoFollow(MemberDTO dto);
}
