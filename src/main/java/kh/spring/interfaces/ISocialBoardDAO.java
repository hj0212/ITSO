package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;

public interface ISocialBoardDAO {
	public List<SocialBoardDTO> showSocialBoardList(SocialBoardDTO sdto);//최신
	public List<SocialBoardDTO> showSocialHotBoardList(SocialBoardDTO sdto);//인기
	public List<SocialBoardDTO> showSocialFollowBoardList(SocialBoardDTO sdto);//팔로잉
	
	public List<CollectionDTO> getCollectionList(MemberDTO dto);
	public List<SocialBoardDTO> getCollectionPhotoList(MemberDTO dto);
	public List<SocialBoardDTO> getCollectionSocialList(CollectionDTO dto);
	public List<CollectionDTO> getCollectionData(CollectionDTO dto);
	public int insertCollectionContent(SocialBoardDTO dto);
	public int deleteCollectionContent(SocialBoardDTO dto);
	public List<SocialBoardDTO> selectCollectionContent(SocialBoardDTO dto);
	public SocialBoardDTO selectSocialBoard(int seq);
	public int insertCollection(CollectionDTO dto);
	public int getSocialBoardcurrval();
	public int insertSocialBoard(SocialBoardDTO sdto);
	public int updateSocialBoard(SocialBoardDTO sdto);
	public int deleteSocialBoard(SocialBoardDTO sdto);
	
	//���ƿ� select insert delete
	public int selectGoodCount(GoodDTO gdto);
	public int insertGoodCount(GoodDTO gdto);
	public int deleteGoodCount(GoodDTO gdto);
	public int allGoodCount(GoodDTO gdto);
	public List<SocialBoardDTO> getMyGoodSocialList(MemberDTO dto);
}
