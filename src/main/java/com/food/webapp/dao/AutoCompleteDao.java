package com.food.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AutoCompleteDao {

	
	public List<String> autoComplete(@Param("autoComplete")String autoComplete);
}
