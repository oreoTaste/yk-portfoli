package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Message;

public interface MessageDao {
  int insert(Message message) throws Exception;

  List<Message> findAllBySenderNumber(Map<String, Object> param) throws Exception;

  List<Message> findAllByReceiverNumber(Map<String, Object> param) throws Exception;

  int countAllSent(int userNumber) throws Exception;

  int countAllInbox(int userNumber) throws Exception;

  int countNotRead(int userNumber) throws Exception;

  Message findByMessageNumber(int number) throws Exception;

  void updateRead(Message message) throws Exception;

  void updateSenderDeleteFlag(Message message) throws Exception;

  void updateReceiverDeleteFlag(Message message) throws Exception;

  void delete(int number) throws Exception;
}