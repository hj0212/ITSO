package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.StyleBoardDTO;

public interface IStyleBoardDAO {
	public List<StyleBoardDTO> showStyleBoard();
	public int insertStyleBoard(StyleBoardDTO stydto);
	public int updateStyleBoard(StyleBoardDTO stydto);
	public int deleteStyleBoard(StyleBoardDTO stydto);

}
