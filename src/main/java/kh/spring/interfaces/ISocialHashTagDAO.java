package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.SocialHashTagDTO;

public interface ISocialHashTagDAO {
	public int insertHashTag(SocialHashTagDTO shtdto);
	public List<SocialHashTagDTO> selectHashTag(int seq);
}
