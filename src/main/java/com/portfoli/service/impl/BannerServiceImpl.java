package com.portfoli.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.portfoli.dao.BannerDao;
import com.portfoli.domain.Banner;
import com.portfoli.service.BannerService;

@Component
public class BannerServiceImpl implements BannerService {
  @Autowired
  BannerDao bannerDao;

  @Override
  public int add(Banner banner) throws Exception {
    return bannerDao.insert(banner);
  }

  @Override
  public List<Banner> activatedList() throws Exception {
    return bannerDao.findAllActivated();
  }

  @Override
  public List<Banner> notActivatedList() throws Exception {
    return bannerDao.findAllNotActivated();
  }

  @Override
  public Banner get(int number) throws Exception {
    return bannerDao.findByNumber(number);
  }

  @Override
  public int update(Banner banner) throws Exception {
    return bannerDao.update(banner);
  }

  @Override
  public int delete(int number) throws Exception {
    return bannerDao.delete(number);
  }
}