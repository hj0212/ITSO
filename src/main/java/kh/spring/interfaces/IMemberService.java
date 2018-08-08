package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.MemberDTO;

public interface IMemberService {
  public List<MemberDTO> loginExist(MemberDTO dto);
  public int insertUserData(MemberDTO dto);
  public int updateUserData(MemberDTO dto);
  public int deleteUserData(MemberDTO dto);
  public List<MemberDTO> emailExist(String email);
}
