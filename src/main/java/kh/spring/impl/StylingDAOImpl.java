package kh.spring.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.interfaces.IStylingDAO;

@Repository
public class StylingDAOImpl implements IStylingDAO{

	@Autowired
	private SqlSessionTemplate template;
}
