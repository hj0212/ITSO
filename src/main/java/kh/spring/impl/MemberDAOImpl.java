package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.FollowDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SearchedUserInfoDTO;
import kh.spring.interfaces.IMemberDAO;

@Repository
public class MemberDAOImpl implements IMemberDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<MemberDTO> loginExist(MemberDTO dto) {
		
	return template.selectList("Member.selectData",dto);

/*		System.out.println("pw" + dto.getPw());
		return template.selectList("selectData",dto);*/
	}
	
	@Override
	public List<MemberDTO> getUserData(MemberDTO dto) {
		return template.selectList("Member.selectUserData", dto);
	}

	@Override
	public int insertUserData(MemberDTO dto) {
		return template.insert("Member.insertData",dto);
	}

	@Override
	public int updateUserData(MemberDTO dto) {
		return template.update("Member.updateData",dto);
	}

	@Override
	public int deleteUserData(MemberDTO dto) {
		return 0;
	}

	@Override
	public List<MemberDTO> emailExist(String email) {
		return template.selectList("Member.emailExist",email);
	}

	@Override
	public int insertFollowData(FollowDTO dto) {
		return template.insert("Member.insertFollow", dto);
	}
	
	@Override
	public int deleteFollowData(FollowDTO dto) {
		return template.delete("Member.deleteFollow", dto);
	}

	@Override
	public List<MemberDTO> getFollowerList(MemberDTO dto) {
		return template.selectList("Member.selectFollower", dto);
	}

	@Override
	public List<MemberDTO> getFollowingList(MemberDTO dto) {
		return template.selectList("Member.selectFollowing", dto);
	}
	
	@Override
	public MemberDTO selectSocialWriter(int social_seq) {
		return template.selectOne("Member.selectSocialWriter", social_seq);
	}

	@Override
	public List<SearchedUserInfoDTO> getSearchedUserList(String word) {
		return template.selectList("Member.searchedUserInfo",word);
	}

	@Override
	public Integer checkFollow(FollowDTO dto) {
		return template.selectOne("Member.checkFollow", dto);
	}
}
