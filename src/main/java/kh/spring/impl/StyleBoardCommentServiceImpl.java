package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.StyleBoardCommentDTO;
import kh.spring.interfaces.IStyleBoardCommentDAO;
import kh.spring.interfaces.IStyleBoardCommentService;

@Service
public class StyleBoardCommentServiceImpl implements IStyleBoardCommentService {

	@Autowired
	private IStyleBoardCommentDAO dao;

	@Override
	public List<StyleBoardCommentDTO> showStyleComment() {
		return this.dao.showStyleComment();
	}

	@Override
	public int insertStyleComment(StyleBoardCommentDTO sbcdto) {
		return this.dao.insertStyleComment(sbcdto);
	}

	@Override
	public int deleteStyleComment(StyleBoardCommentDTO sbcdto) {
		return this.dao.deleteStyleComment(sbcdto);
	}

	@Override
	public int updateStyleComment(StyleBoardCommentDTO sbcdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
