package kh.spring.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IFileDAO;

@Repository
public class FileDAOImpl implements IFileDAO {
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int saveFile(MultipartFile file) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editProfileImage(MemberDTO dto) {
		return template.update("Member.updateImage", dto);
	}
	
	
}
