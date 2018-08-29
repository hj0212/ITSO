package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.MemberDTO;

public interface IAdminDAO {

public int getFemaleUserCounts();

public int getMaleUserCounts();
	
public int getTeenagersCounts();

public int getTwentiesCounts();

public int getThirtiesCounts();

public int getFortiesCounts();


List<MemberDTO> getReportedUser();

int specificUserblock(int userSeq);

String isThisUserBlocked(int userSeq);

int blockUserReleasing(int userSeq);

}
