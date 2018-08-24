package kh.spring.impl;

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
}
