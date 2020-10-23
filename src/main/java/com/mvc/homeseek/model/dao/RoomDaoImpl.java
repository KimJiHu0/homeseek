package com.mvc.homeseek.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(RoomDao.class);
	
	@Override
	public int selectRoomInsert(RoomDto room_dto) {
		
		// controller에서 호출했으니 mapper가 실행됐을거에요
		// TO_DATE('20201024', 'yyyy/MM/dd')로 실행을 하면 잘 될거에요
		// 그럼 dto에서 저희가 넘겨준 값에 room_cpdatem, room_avdage도 controller에서
		// "20201024"형식으로 넘겨줬기 때문에 mapper에서 TO_DATE(#{room_cpdate}, 'yyyy/MM/dd')로
		// 진행하게 되면 date타입으로 잘 들어갈거에요.
		// 이래도 안되시면 말씀해주세요 다시 보고 피드백 드릴게요.
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"selectRoomInsert");
		} catch (Exception e) {
			logger.info("[ERROR] : selectRoomInsert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int selectRoomUpdate(RoomDto room_dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"selectRoomUpdate");
		} catch (Exception e) {
			logger.info("[ERROR] : selectRoomUpdate");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int selectRoomDelete(int room_no) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"selectRoomDelete");
		} catch (Exception e) {
			logger.info("[ERROR] : selectRoomDelete");
			e.printStackTrace();
		}
		
		return res;
	}

}








