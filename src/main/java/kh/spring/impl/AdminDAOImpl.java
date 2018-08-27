package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IAdminDAO;

@Repository
public class AdminDAOImpl implements IAdminDAO {

	@Autowired
	SqlSessionTemplate template;

	@Override
	public int getFemaleUserCounts() {
		return template.selectOne("adminPageSQL.getFemaleUserCounts");
	}

	@Override
	public int getMaleUserCounts() {
		return template.selectOne("adminPageSQL.getMaleUserCounts");
	}

	@Override
	public int getTeenagersCounts() {
		return template.selectOne("adminPageSQL.getTeenagersCounts");
	}

	@Override
	public int getTwentiesCounts() {
		return template.selectOne("adminPageSQL.getTwentiesCounts");
	}

	@Override
	public int getThirtiesCounts() {
		return template.selectOne("adminPageSQL.getThirtiesCounts");
	}

	@Override
	public int getFortiesCounts() {
		return template.selectOne("adminPageSQL.getFortiesCounts");
	}

	@Override
	public List<MemberDTO> getReportedUser() {
		return template.selectList("adminPageSQL.getReportedUser");
	}
	
	@Override
	public int specificUserblock(int userSeq) {
		return template.update("adminPageSQL.specificUserblock", userSeq);
	}

	@Override
	public String isThisUserBlocked(int userSeq) {
		return template.selectOne("adminPageSQL.isThisUserBlocked", userSeq);
	}
	

}
