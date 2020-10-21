package com.mvc.homeseek.model.biz;

import com.mvc.homeseek.model.dto.MemberDto;

public interface MemberBiz {
	
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
}
