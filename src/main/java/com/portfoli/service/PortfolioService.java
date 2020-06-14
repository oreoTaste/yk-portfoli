package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Portfolio;
import com.portfoli.domain.SearchMap;

public interface PortfolioService {

  List<Portfolio> list(Portfolio portfolio) throws Exception;

  Portfolio get(int boardNumber) throws Exception;

  List<Portfolio> getByMemberNumber(Portfolio portfolio) throws Exception;

  boolean insert(Portfolio portfolio) throws Exception;

  boolean delete(int boardNumber) throws Exception;

  boolean update(Portfolio portfolio) throws Exception;

  int selectListCnt(Portfolio portfolio) throws Exception;

  int selectMyListCnt(int generalMemberNumber) throws Exception;

  void readableon(Portfolio portfolio) throws Exception;

  void readableoff(Portfolio portfolio) throws Exception;

  List<Portfolio> search(SearchMap searchMap) throws Exception;

  List<Portfolio> listMyRecommendedlist(Portfolio portfolio) throws Exception;

  int selectMyRecommendedListCnt(int generalMemberNumber) throws Exception;

  List<Portfolio> searchMyRecommendedlist(SearchMap searchMap) throws Exception;



}
