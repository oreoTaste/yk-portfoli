package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Calendar;

public interface CalendarDao {

  int insert(Calendar calendar);

  List<Calendar> find(int memberNumber);

  int delete(int id);

  int update(Calendar calendar);

  List<Calendar> checkToday(int memberNumber);

}
