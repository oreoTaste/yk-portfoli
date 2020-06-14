package com.portfoli.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import com.portfoli.dao.BoardDao;
import com.portfoli.domain.Board;
import com.portfoli.service.BoardService;

@Component
public class BoardServiceImpl implements BoardService {
  BoardDao boardDao;

  public BoardServiceImpl(BoardDao boardDao) {
    this.boardDao = boardDao;
  }

  @Override
  public boolean add(Board board) throws Exception {
    return boardDao.insert(board) > 0;
  }

  @Override
  public List<Board> list() throws Exception {
    return boardDao.findAll();
  }

  @Override
  public Board get(int number) throws Exception {
    return boardDao.findByNo(number);
  }

  @Override
  public boolean delete(int number) throws Exception {
    return boardDao.delete(number) > 0;
  }

  @Override
  public boolean update(Board board) throws Exception {
    return boardDao.update(board) > 0;
  }

  @Override
  public void addViewCount(Map<String, Object> params) throws Exception {
    if(boardDao.updateViewCount(params) < 0) {
      throw new Exception();
    }
    
  }



}
