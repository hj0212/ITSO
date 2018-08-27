package kh.spring.interfaces;

import java.util.List;


import kh.spring.dto.AdminPageDTO;

public interface IAdminService {

public	List<AdminPageDTO> getAllAnalysisData();

	public int getFemaleUserCounts();

	public int getMaleUserCounts();

}
