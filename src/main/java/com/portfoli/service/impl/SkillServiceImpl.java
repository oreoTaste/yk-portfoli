package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.SkillDao;
import com.portfoli.domain.GeneralMemberSkill;
import com.portfoli.domain.Skill;
import com.portfoli.service.SkillService;

@Component
public class SkillServiceImpl implements SkillService {

  TransactionTemplate transactionTemplate;
  SkillDao skillDao;

  public SkillServiceImpl(//
      PlatformTransactionManager txManager, SkillDao skillDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.skillDao = skillDao;
  }

  @Override
  public List<Skill> list() throws Exception {
    return skillDao.findAll();
  }

  @Override
  public List<Skill> list(int fieldNumber) throws Exception {
    return skillDao.findAllByNumber(fieldNumber);
  }

  @Override
  public List<Skill> listOfMember(int memberNumber) throws Exception {
    return skillDao.findAllByMemberNumber(memberNumber);
  }

  @Override
  public int getMemberSkillNumber(int generalMemberNumber, int skillNumber) throws Exception {
    Map<String, Integer> map = new HashMap<>();
    map.put("generalMemberNumber", generalMemberNumber);
    map.put("skillNumber", skillNumber);
    return skillDao.findMemberSkillNumber(map);
  }

  @Override
  public int delete(Map<String, Object> params) throws Exception {
    return skillDao.delete(params);
  }

  @Override
  public int add(Map<String, Object> params) throws Exception {
    return skillDao.insert(params);
  }

  @Override
  public Skill get(String skillName) throws Exception {
    return skillDao.findByName(skillName);
  }

  @Override
  public GeneralMemberSkill get(Map<String, Object> params) throws Exception {
    return skillDao.findMemberSkill(params);
  }

  @Override
  public List<Skill> list2(int fieldNumber) throws Exception {
    return skillDao.findAllByNumber2(fieldNumber);
  }
}
