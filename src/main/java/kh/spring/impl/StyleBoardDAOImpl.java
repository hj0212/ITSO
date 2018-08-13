package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.StyleBoardDTO;
import kh.spring.interfaces.IStyleBoardDAO;

@Repository
public class StyleBoardDAOImpl implements IStyleBoardDAO{
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<StyleBoardDTO> showStyleBoard() {
		return template.selectList("StyleBoard.showStyleBoard");
	}

	@Override
	public int insertStyleBoard(StyleBoardDTO stydto) {
		return template.insert("StyleBoard.insertStyleBoard", stydto);
	}

	@Override
	public int updateStyleBoard(StyleBoardDTO stydto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStyleBoard(StyleBoardDTO stydto) {
		return template.delete("StyleBoard.deleteStyleBoard", stydto);
	}

}
