package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;

public interface ISocialBoardDAO {
	public List<SocialBoardDTO> showSocialBoardList();
	public List<SocialBoardDTO> getSocialList(MemberDTO dto);
	public List<CollectionDTO> getCollectionList(MemberDTO dto);
	public List<SocialBoardDTO> getCollectionPhotoList(MemberDTO dto);
	public List<SocialBoardDTO> getCollectionSocialList(CollectionDTO dto);
	public List<CollectionDTO> getCollectionData(CollectionDTO dto);
	public SocialBoardDTO selectSocialBoard(int seq);
	public int getSocialBoardcurrval();
	public int insertSocialBoard(SocialBoardDTO sdto);
	public int updateSocialBoard(SocialBoardDTO sdto);
	public int deleteSocialBoard(int seq);
	public int selectSocialWriter(int seq);
}
