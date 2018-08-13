package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.StyleBoardCommentDTO;

public interface IStyleBoardCommentService {
	public List<StyleBoardCommentDTO> showStyleComment();
	public int insertStyleComment(StyleBoardCommentDTO sbcdto);
	public int deleteStyleComment(StyleBoardCommentDTO sbcdto);
	public int updateStyleComment(StyleBoardCommentDTO sbcdto);
}
