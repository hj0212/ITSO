package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.SocialCommentDTO;
import kh.spring.interfaces.ISocialCommentDAO;
import kh.spring.interfaces.ISocialCommentService;

@Service
public class SocialCommentServiceImpl implements ISocialCommentService{
	@Autowired
	ISocialCommentDAO dao;
	
	@Override
	public List<SocialCommentDTO> showCommentList(int seq) {
		return dao.showCommentList(seq);
	}
}
