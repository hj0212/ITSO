package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.FollowDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IMemberDAO;
import kh.spring.interfaces.IMemberService;

@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	private IMemberDAO dao;
	
	
	@Override
	public List<MemberDTO> loginExist(MemberDTO dto) {
		return this.dao.loginExist(dto);
	}

	@Override
	public int insertUserData(MemberDTO dto) {
		dto.setPart("home");
		dto.setBlock("n");
		dto.setState(" ");
		dto.setPhoto("1.jpge");
		dto.setWithdrawal("n");
		return this.dao.insertUserData(dto);
	}
	
	@Override
	public List<MemberDTO> getUserData(MemberDTO dto) {
		return this.dao.getUserData(dto);
	}

	
	@Override
	public int updateUserData(MemberDTO dto) {
		return this.dao.updateUserData(dto);
	}

	@Override
	public int deleteUserData(MemberDTO dto) {
		return 0;
	}

	@Override
	public List<MemberDTO> emailExist(String email) {
		return this.dao.emailExist(email);
	}

	@Override
	public int insertFollowData(FollowDTO dto) {
		return this.dao.insertFollowData(dto);
	}

	@Override
	public List<MemberDTO> getFollowerList(MemberDTO dto) {
		return this.dao.getFollowerList(dto);
	}

	@Override
	public List<MemberDTO> getFollowingList(MemberDTO dto) {
		return this.dao.getFollowingList(dto);
	}

}
