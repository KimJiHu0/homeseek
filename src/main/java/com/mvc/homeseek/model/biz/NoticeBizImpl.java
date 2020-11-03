package com.mvc.homeseek.model.biz;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.NoticeDao;
import com.mvc.homeseek.model.dto.NoticeDto;

@Service
public class NoticeBizImpl implements NoticeBiz {

	private Logger logger = LoggerFactory.getLogger(NoticeBizImpl.class);

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<NoticeDto> selectList() {
		// TODO Auto-generated method stub
		return noticeDao.selectList();
	}

	@Override
	public NoticeDto selectOne(int seq) {
		// TODO Auto-generated method stub
		return noticeDao.selectOne(seq);
	}

	@Override
	public int insert(NoticeDto dto) {
		// TODO Auto-generated method stub
		return noticeDao.insert(dto);
	}

	@Override
	public int update(NoticeDto dto) {
		// TODO Auto-generated method stub
		return noticeDao.update(dto);
	}

	@Override
	public int delete(int seq) {
		// TODO Auto-generated method stub
		return noticeDao.delete(seq);
	}


}
