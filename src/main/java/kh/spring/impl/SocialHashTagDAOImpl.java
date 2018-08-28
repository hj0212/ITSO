package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.SocialHashTagDTO;
import kh.spring.interfaces.ISocialHashTagDAO;

@Repository
public class SocialHashTagDAOImpl implements ISocialHashTagDAO{
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int insertHashTag(SocialHashTagDTO shtdto) {
		return this.template.insert("SocialHashTag.insertHashTag",shtdto);
	}

	@Override
	public List<SocialHashTagDTO> selectHashTag(int seq) {
		return this.template.selectList("SocialHashTag.selectHashTag", seq);
	}

	@Override
	public int deleteSocialHashTag(int seq) {
		return this.template.delete("SocialHashTag.deleteHashTag",seq);
	}
}
