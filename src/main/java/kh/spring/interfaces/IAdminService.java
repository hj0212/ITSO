package kh.spring.interfaces;

import java.util.List;


import kh.spring.dto.AdminPageDTO;
import kh.spring.dto.MemberDTO;

public interface IAdminService {

public	List<AdminPageDTO> getAllAnalysisData();

	public int getFemaleUserCounts();

	public int getMaleUserCounts();

	public int getTeenagersCounts();

	public int getTwentiesCounts();

	public int getThirtiesCounts();

	public int getFortiesCounts();

	public List<MemberDTO> getReportedUser();

	public int specificUserblock(int userSeq);

	public String isThisUserBlocked(int userSeq);


}
