package com.food.webapp.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.NoticeDao;
import com.food.webapp.dao.NoticeFileDao;
import com.food.webapp.entity.Notice;
import com.food.webapp.entity.NoticeFile;
import com.food.webapp.entity.NoticeView;

public class MyBatisNoticeFileDao implements NoticeFileDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeFile> getListByNoticeId(String noticeId) {
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
		List<NoticeFile> result = noticeFileDao.getListByNoticeId(noticeId);
		
		return result;
	}

	  @Override
	   public int insert(NoticeFile noticeFile) {
	      NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
	      return noticeFileDao.insert(noticeFile);
	   }

	   @Override
	   public int update(NoticeFile noticeFile) {
	      NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
	      int result = noticeFileDao.update(noticeFile);

	      return result;
	   }

	   @Override
	   public int delete(String id) {
	      NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
	      int result = noticeFileDao.delete(id);

	      return result;
	   }

}
