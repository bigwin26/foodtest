package com.food.webapp.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.NoticeDao;
import com.food.webapp.entity.Notice;
import com.food.webapp.entity.NoticeView;

public class MyBatisNoticeDao implements NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeView> getList(int page,String field,String query) {
		
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		List<NoticeView> list = noticeDao.getList(page, field, query);
		
		String output = String.format("p:%s, q:%s", page, query);
		output += String.format("title:%s\n", list.get(0).getTitle());
		
		return list;
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeView get(String id) {
		
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView noticeView = noticeDao.get(id);
		
		return noticeView;
	}

	/*@Override
	public int update(String id, String title, String content) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.update(id, title, content);
	}*/

	@Override
	public NoticeView getPrev(String id) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView result = noticeDao.getPrev(id);
		return result;
	}

	@Override
	public NoticeView getNext(String id) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView result = noticeDao.getNext(id);
		return result;
	}

	@Override
	public int insert(String title, String content, String writerName) {
		return insert(new Notice(title,content,writerName));
	}

	@Override
	public int insert(Notice notice) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.insert(notice);
		
	}

	@Override
	public String getNextId() {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.getNextId();
	}

	@Override
	public int getCountAdmin(String field, String query) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.getCountAdmin(field, query);
	}

	@Override
	public List<NoticeView> getListAdmin(int page, String field, String query) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		List<NoticeView> list = noticeDao.getListAdmin(page, field, query);
		return list;
	}

	@Override
	public int edit(int id, String title, String content) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.edit(id, title, content);
	}

}
