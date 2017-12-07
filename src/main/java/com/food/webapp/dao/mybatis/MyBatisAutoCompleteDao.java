package com.food.webapp.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.AutoCompleteDao;

public class MyBatisAutoCompleteDao implements com.food.webapp.dao.AutoCompleteDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Map<String, String>> autoComplete(String autoComplete) {

		
		AutoCompleteDao autoCompleteDao = sqlSession.getMapper(AutoCompleteDao.class);
		List<Map<String, String>> list = autoCompleteDao.autoComplete(autoComplete);
		
		return list;
	}


}
