package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IMemberDAO;
import kh.spring.interfaces.IMemberService;

@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	private IMemberDAO dao;
	
	
	@Override
	public List<MemberDTO> loginExist(MemberDTO dto) {
		// TODO Auto-generated method stub
		return this.dao.loginExist(dto);
	}

	@Override
	public int insertUserData(MemberDTO dto) {
		// TODO Auto-generated method stub
		return this.dao.insertUserData(dto);
	}

	@Override
	public int updateUserData(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserData(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberDTO> emailExist(String email) {
		// TODO Auto-generated method stub
		return this.dao.emailExist(email);
	}

}
