package kh.spring.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.interfaces.IAdminDAO;

@Repository
public class AdminDAOImpl implements IAdminDAO{

	@Autowired
	SqlSessionTemplate template;

	@Override
	public int getFemaleUserCounts() {
		return template.selectOne("adminPageSQL.getFemaleUserCounts");
	}

	@Override
	public int getMaleUserCounts() {
		return template.selectOne("adminPageSQL.getMaleUserCounts");
	}
	
	
	
	
}
