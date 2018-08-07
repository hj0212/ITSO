package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IMemberDAO;

@Repository
public class MemberDAOImpl implements IMemberDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<MemberDTO> loginExist(MemberDTO dto) {
<<<<<<< HEAD
		
		return template.selectList("Members.selectData",dto);
=======
		System.out.println("pw" + dto.getPw());
		return template.selectList("selectData",dto);
>>>>>>> 형섭스
	}

	@Override
	public int insertUserData(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
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

}
