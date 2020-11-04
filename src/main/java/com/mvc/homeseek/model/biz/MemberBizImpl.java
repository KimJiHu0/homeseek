package com.mvc.homeseek.model.biz;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.MemberDao;
import com.mvc.homeseek.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {
	
	@Autowired
	private MemberDao memberDao;
	
	
	@Override
	public MemberDto login(MemberDto dto) {
		return memberDao.login(dto);
	}
	
	@Override
	public int insert(MemberDto dto) {
		return memberDao.insert(dto);
	}

	@Override
	public MemberDto selectMemberById(String id) {
		return memberDao.selectMemberById(id);
	};
	
	@Override
	public int checkId(String member_id){
		
		return memberDao.checkId(member_id);
		
	}
	@Override
	public int checkPhone(MemberDto dto) {
		return memberDao.checkPhone(dto);
	}
	
	@Override
	public int findId(MemberDto dto) {
		
		return memberDao.findId(dto);
	}
	
	@Override
	public String selectId(MemberDto dto) {
		
		return memberDao.selectId(dto);
	}
	
	@Override
	public int findPw(MemberDto dto) {
		
		return memberDao.findPw(dto);
	}

	@Override
	public int searchPassword(Map<String, Object> param) {
		
		return memberDao.searchPassword(param);
	}

	@Override
	public MemberDto getBySns(MemberDto snsUser) {
		
		return memberDao.getBySns(snsUser);
	}

	@Override
	public int updateMemberEnabled(String report_reid) {
		return memberDao.updateMemberEnabled(report_reid);
	}

	@Override
	public int dropoutMemberEnabled(String member_id) {
		return memberDao.dropoutMemberEnabled(member_id);
	}

}

