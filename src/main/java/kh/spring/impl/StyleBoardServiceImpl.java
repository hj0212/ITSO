package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.StyleBoardDTO;
import kh.spring.interfaces.IStyleBoardDAO;
import kh.spring.interfaces.IStyleBoardService;

@Service
public class StyleBoardServiceImpl implements IStyleBoardService{
	@Autowired
	private IStyleBoardDAO dao;

	@Override
	public List<StyleBoardDTO> showStyleBoard() {
		return this.dao.showStyleBoard();
	}

	@Override
	public int insertStyleBoard(StyleBoardDTO stydto) {
		return this.dao.insertStyleBoard(stydto);
	}

	@Override
	public int updateStyleBoard(StyleBoardDTO stydto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStyleBoard(StyleBoardDTO stydto) {
		return this.dao.deleteStyleBoard(stydto);
	}

}
