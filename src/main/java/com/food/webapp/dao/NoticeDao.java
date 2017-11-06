package com.food.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.food.webapp.entity.Notice;
import com.food.webapp.entity.NoticeView;

public interface NoticeDao {
	List<NoticeView> getList(@Param("page")int page,String field,String query);
	int getCount();
	NoticeView get(String id);
	int update(String id, String title, String content);
	NoticeView getPrev(String id);
	NoticeView getNext(String id);
	int insert(String title, String content, String writerId);
	int insert(Notice notice);
	String getNextId();
}
