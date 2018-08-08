package kh.spring.interfaces;

import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.MemberDTO;

public interface IFileDAO {
	public int saveFile(MultipartFile file);
	public int editProfileImage(MemberDTO dto);
}
