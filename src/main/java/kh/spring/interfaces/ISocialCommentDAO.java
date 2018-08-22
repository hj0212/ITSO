package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.SocialCommentDTO;

public interface ISocialCommentDAO {
	public List<SocialCommentDTO> showCommentList(int seq);
	public int insertSocialComment(SocialCommentDTO scdto);
}
