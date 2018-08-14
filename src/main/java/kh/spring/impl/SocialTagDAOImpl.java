package kh.spring.impl;

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
}
