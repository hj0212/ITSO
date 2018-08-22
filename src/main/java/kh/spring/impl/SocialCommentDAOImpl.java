package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.SocialCommentDTO;
import kh.spring.interfaces.ISocialCommentDAO;

@Repository
public class SocialCommentDAOImpl implements ISocialCommentDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<SocialCommentDTO> showCommentList(int seq) {
		return this.template.selectList("SocialComment.showCommentList", seq);
	}

	@Override
	public int insertSocialComment(SocialCommentDTO scdto) {
		return this.template.insert("SocialComment.insertSocialComment", scdto);
	}
}
