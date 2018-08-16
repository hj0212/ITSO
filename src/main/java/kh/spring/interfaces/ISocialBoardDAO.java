package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;

public interface ISocialBoardDAO {
	public List<SocialBoardDTO> showSocialBoardList(SocialBoardDTO sdto);
	public List<CollectionDTO> getCollectionList(MemberDTO dto);
	public List<SocialBoardDTO> getCollectionPhotoList(MemberDTO dto);
	public int insertSocialBoard(SocialBoardDTO sdto);
	public int updateSocialBoard(SocialBoardDTO sdto);
	public int deleteSocialBoard(SocialBoardDTO sdto);

	
	//좋아요 select insert delete
	public int selectGoodCount(GoodDTO gdto);
	public int insertGoodCount(GoodDTO gdto);
	public int deleteGoodCount(GoodDTO gdto);
	public int allGoodCount(GoodDTO gdto);
	public List<SocialBoardDTO> getMyGoodSocialList(MemberDTO dto);
}
