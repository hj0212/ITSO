package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.SocialHashTagDTO;
import kh.spring.interfaces.ISocialHashTagDAO;
import kh.spring.interfaces.ISocialHashTagService;

@Service
public class SocialHashTagServiceImpl implements ISocialHashTagService{
	@Autowired
	private ISocialHashTagDAO dao;
	
	@Override
	public int insertHashTag(SocialHashTagDTO shtdto) {
		return this.dao.insertHashTag(shtdto);
	}

	@Override
	public List<SocialHashTagDTO> selectHashTag(int seq) {
		return this.dao.selectHashTag(seq);
	}
}
