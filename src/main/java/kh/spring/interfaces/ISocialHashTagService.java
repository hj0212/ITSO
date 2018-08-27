package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.SocialHashTagDTO;

public interface ISocialHashTagService {
	public int insertHashTag(SocialHashTagDTO shtdto);
	public List<SocialHashTagDTO> selectHashTag(int seq);
	public int deleteSocialHashTag(int seq);
}
