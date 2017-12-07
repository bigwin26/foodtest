package com.food.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AutoCompleteDao {

	
	public List<Map<String, String>> autoComplete(@Param("autoComplete")String autoComplete);
}
