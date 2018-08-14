package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.SocialTagDTO;
import kh.spring.interfaces.ISocialTagDAO;
import kh.spring.interfaces.ISocialTagService;

@Service
public class SocialTagServiceImpl implements ISocialTagService{
	@Autowired
	ISocialTagDAO dao;
	
	@Override
	public int insertSocialTag(SocialTagDTO dto) {
		return this.dao.insertSocialTag(dto);
	}

	@Override
	public List<SocialTagDTO> showSelectedTagList(int seq) {
		return this.dao.showSelectedTagList(seq);
	}
}
