package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.SocialTagDTO;
import kh.spring.interfaces.ISocialTagDAO;

@Repository
public class SocialTagDAOImpl implements ISocialTagDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public int insertSocialTag(SocialTagDTO dto) {
		return template.insert("SocialTag.insertSocialTag",dto);
	}

	@Override
	public List<SocialTagDTO> showSelectedTagList(int seq) {
		return template.selectList("SocialTag.showSelectedTagList",seq);
	}

	@Override
	public int updateSocialTag(SocialTagDTO dto) {
		return template.update("SocialTag.updateSocialTag",dto);
	}

	@Override
	public int deleteSocialTag(int seq) {
		return template.delete("SocialTag.deleteSocialTag",seq);
	}

	@Override
	public int getSocialTagcurrval() {
		return template.selectOne("SocialTag.getSocialTagcurrval");
	}
}
