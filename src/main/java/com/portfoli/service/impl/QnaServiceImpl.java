package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.BoardDao;
import com.portfoli.dao.QnaDao;
import com.portfoli.domain.Qna;
import com.portfoli.service.QnaService;

@Component
public class QnaServiceImpl implements QnaService {

  BoardDao boardDao;
  QnaDao qnaDao;
  TransactionTemplate transactionTemplate;

  public QnaServiceImpl(BoardDao boardDao, QnaDao qnaDao, PlatformTransactionManager pftxManager) {
    this.boardDao = boardDao;
    this.qnaDao = qnaDao;
    this.transactionTemplate = new TransactionTemplate(pftxManager);
  }


  @Override
  public List<Qna> list(int pageNumber, int pageSize) throws Exception {
    HashMap<String, Object> param = new HashMap<>();
    param.put("offset", (pageNumber - 1) * pageSize);
    param.put("pageSize", pageSize);

    List<Qna> qnaList = qnaDao.findAll(param);
    if (qnaList.size() < 0) {
      throw new Exception("Q&A 불러오기 실패");
    }
    return qnaList;
  }

  @Override
  public Qna get(int no) throws Exception {
    Qna qna = qnaDao.findByNo(no);
    if (qna == null) {
      throw new Exception("해당 번호의 게시글이 존재하지 않습니다.");
    }
    return qna;
  }

  @Transactional
  @Override
  public void delete(int boardNo) throws Exception {
    if (qnaDao.delete(boardNo) > 0) {
      if (boardDao.delete(boardNo) < 0) {
        throw new Exception("게시글 삭제 실패");
      }
    } else {
      throw new Exception("게시글 삭제 실패");
    }

  }

  @Transactional
  @Override
  public void update(Qna qna) throws Exception {
    if (boardDao.update(qna) > 0) {
      if (qnaDao.update(qna) < 0) {
        throw new Exception("QNA 수정 실패");
      }
    } else {
      throw new Exception("QNA 수정 실패");
    }

  }

  @Transactional
  @Override
  public void add(Qna qna) throws Exception {
    if (boardDao.insert(qna) > 0) {
      qna.setNumber(qna.getNumber());
      if (qnaDao.insert(qna) < 0) {
        throw new Exception("QNA 등록 실패");
      }
    } else {
      throw new Exception("QNA 등록 실패");
    }

  }


  @Override
  public int selectListCnt() throws Exception {
    return qnaDao.count();
  }


  @Override
  public void addReply(Map<String, Object> params) throws Exception {
    if(qnaDao.insertReply(params) < 0 ) {
     throw new Exception("QNA 답변 처리 중 오류 발생");
    }
    
  }



}
