package com.mvc.homeseek.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.QnaDao;
import com.mvc.homeseek.model.dto.NoticeDto;
import com.mvc.homeseek.model.dto.QnaDto;

@Service
public class QnaBizImpl implements QnaBiz {
	
	@Autowired
	private QnaDao qnaDao;

	@Override
	public List<QnaDto> selectList() {
		// TODO Auto-generated method stub
		return qnaDao.selectList();
	}

	@Override
	public QnaDto selectOne(int seq) {
		// TODO Auto-generated method stub
		return qnaDao.selectOne(seq);
	}

	@Override
	public int insert(QnaDto dto) {
		// TODO Auto-generated method stub
		return qnaDao.insert(dto);
	}

	@Override
	public int update(QnaDto dto) {
		// TODO Auto-generated method stub
		return qnaDao.update(dto);
	}

	@Override
	public int delete(int seq) {
		// TODO Auto-generated method stub
		return qnaDao.delete(seq);
	}
	
	@Override
	public List<QnaDto> selectList(String keyword) {
		return qnaDao.selectList(keyword);
	}

}
