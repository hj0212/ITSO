package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.SocialTagDTO;

public interface ISocialTagDAO {
	public int insertSocialTag(SocialTagDTO dto);
	public List<SocialTagDTO> showSelectedTagList(int seq);
	public int updateSocialTag(SocialTagDTO dto);
	public int deleteSocialTag(int seq);
	public int getSocialTagcurrval();
}
