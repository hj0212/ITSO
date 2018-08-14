package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.SocialTagDTO;

public interface ISocialTagService {
	public int insertSocialTag(SocialTagDTO dto);
	public List<SocialTagDTO> showSelectedTagList(int seq);
}
