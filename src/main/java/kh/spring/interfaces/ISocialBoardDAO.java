package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;

public interface ISocialBoardDAO {
	public List<SocialBoardDTO> showSocialBoardList();
	public List<CollectionDTO> getCollectionList(MemberDTO dto);
	public int insertSocialBoard(SocialBoardDTO sdto);
	public int updateSocialBoard(SocialBoardDTO sdto);
	public int deleteSocialBoard(SocialBoardDTO sdto);

}
