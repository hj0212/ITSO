package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.StyleBoardCommentDTO;
import kh.spring.interfaces.IStyleBoardCommentDAO;

@Repository
public class StyleBoardCommentDAOImpl implements IStyleBoardCommentDAO{
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<StyleBoardCommentDTO> showStyleComment() {
		return template.selectList("SocialBoardComment.showStyleComment");
	}

	@Override
	public int insertStyleComment(StyleBoardCommentDTO sbcdto) {
		return template.insert("SocialBoardComment.insertStyleComment", sbcdto);
	}

	@Override
	public int deleteStyleComment(StyleBoardCommentDTO sbcdto) {
		// TODO Auto-generated method stub
		return template.delete("SocialBoardComment.deleteStyleComment", sbcdto);
	}

	@Override
	public int updateStyleComment(StyleBoardCommentDTO sbcdto) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
