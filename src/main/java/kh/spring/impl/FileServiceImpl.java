package kh.spring.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IFileDAO;
import kh.spring.interfaces.IFileService;

@Service
public class FileServiceImpl implements IFileService {
	@Autowired
	private IFileDAO dao;

	@Override
	public int saveFile(MultipartFile file) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int editProfileImage(MemberDTO dto) {
		return dao.editProfileImage(dto);
	}
}
