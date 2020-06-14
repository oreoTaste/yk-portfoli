package com.portfoli.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.NoticeDao;
import com.portfoli.domain.Notice;
import com.portfoli.service.NoticeService;

@Component
public class NoticeServiceImpl implements NoticeService {
  NoticeDao noticeDao;
  TransactionTemplate transactionTemplate;

  public NoticeServiceImpl(NoticeDao noticeDao) {
    this.noticeDao = noticeDao;
  }

  @Override
  public List<Notice> list() throws Exception {
    return noticeDao.findAll();
  }

  @Override
  public List<Notice> list(Notice notice) throws Exception {
    return noticeDao.findAll(notice);
  }
  
  @Override
  public Notice get(int number) throws Exception {
    return noticeDao.findByNo(number);
  }

  @Override
  public boolean insert(Notice notice) throws Exception {
    return noticeDao.insert(notice) > 0;
  }

  @Override
  public boolean delete(int boardNumber) throws Exception {
    return noticeDao.delete(boardNumber) > 0;
  }

  @Override
  public boolean update(Notice notice) throws Exception {
    return noticeDao.update(notice) > 0;
  }

  @Override
  public List<Notice> getByCategoryNumber(int categoryNumber) throws Exception {
    return noticeDao.findByCategoryNumber(categoryNumber);
  }

  @Override
  public int selectListCnt(Notice notice) throws Exception {
    return noticeDao.selectListCnt();
  }

  @Override
  public int update(Map<String, Integer> map) throws Exception {
    return noticeDao.updateCategory(map);
  }





}
