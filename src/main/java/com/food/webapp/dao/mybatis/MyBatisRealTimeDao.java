package com.food.webapp.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.AutoCompleteDao;
import com.food.webapp.dao.RealTimeDao;
import com.food.webapp.entity.RealTime;

public class MyBatisRealTimeDao implements RealTimeDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/*@Override
	public List<String> realTime() {

		
		RealTimeDao realTimeDao = sqlSession.getMapper(RealTimeDao.class);
		List<String> list = realTimeDao.realTime();
		
		return list;
	}*/
	
	
	@Override
	public List<RealTime> realTime() {
		RealTimeDao realTimeDao = sqlSession.getMapper(RealTimeDao.class);
		List<RealTime> list = realTimeDao.realTime();
		
		return list;
	}

}
