package com.portfoli.web;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.portfoli.domain.City;
import com.portfoli.domain.District;
import com.portfoli.domain.Field;
import com.portfoli.domain.FinalEducation;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Recommend;
import com.portfoli.domain.Skill;
import com.portfoli.service.CityService;
import com.portfoli.service.DistrictService;
import com.portfoli.service.FieldService;
import com.portfoli.service.FinalEducationService;
import com.portfoli.service.MemberService;
import com.portfoli.service.RecommendService;
import com.portfoli.service.SkillService;



@Controller
@RequestMapping("recommendEmployee")
public class RecommendEmployeeController {

  static Logger logger = LogManager.getLogger(RecommendEmployeeController.class);

  public RecommendEmployeeController() {
    RecommendEmployeeController.logger.debug("RecommendEmployeeController 객체 생성!");
  }

  @Autowired
  MemberService memberService;

  @Autowired
  DistrictService districtService;

  @Autowired
  FinalEducationService finalEducationService;

  @Autowired
  SkillService skillService;

  @Autowired
  CityService cityService;

  @Autowired
  FieldService fieldService;

  @Autowired
  RecommendService recommendService;

  @GetMapping("recommend")
  public void recommendEmployee(Model model, @RequestParam(defaultValue = "109000") int cityNumber,
      @RequestParam(defaultValue = "40101") int fieldNumber) throws Exception {
    List<GeneralMember> memCareers = memberService.findAll();
    List<District> districts = districtService.get();
    List<FinalEducation> educations = finalEducationService.findAll();
    List<Skill> skills = skillService.list();
    List<City> citys = cityService.list();
    List<Field> fields = fieldService.list();
    model.addAttribute("memCareers", memCareers);
    model.addAttribute("districts", districts);
    model.addAttribute("educations", educations);
    model.addAttribute("skills", skills);
    model.addAttribute("citys", citys);
    model.addAttribute("fields", fields);
  }

  @PostMapping(value = "listByFilter", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String listByFilter(HttpServletRequest request,
      @RequestBody Map<String, Object> convertedData) throws Exception {

    String careerNew = (String) convertedData.get("careerNew");
    String careerStart = (String) convertedData.get("careerStart");
    String careerEnd = (String) convertedData.get("careerEnd");
    String education = (String) convertedData.get("selectEducation");
    String viewOrder = (String) convertedData.get("viewOrder");
    List<Skill> skillList = (List<Skill>) convertedData.get("skillList");
    List<District> districtList = (List<District>) convertedData.get("districtList");

    if (careerStart.length() > 0) {
      convertedData.put("careerStart",
          Integer.parseInt(((String) convertedData.get("careerStart")).substring(0, 1)));
    }

    if (careerEnd.length() > 0) {
      convertedData.put("careerEnd",
          Integer.parseInt(((String) convertedData.get("careerEnd")).substring(0, 1)));
    }

    List<Recommend> rankList = recommendService.list(convertedData);
    // List<Recommend> result = new ArrayList<>();

    for (Recommend r : rankList) {
      System.out.println(r);
    }
    // 사용자 중복 제거
    // for (int i = 0; i < rankList.size(); i++) {
    // boolean flag = true;
    // for (int j = 0; j < result.size(); j++) {
    // if (rankList.get(i).getName().equals(result.get(j).getName())) {
    // flag = false;
    // }
    // }
    // if (flag) {
    // result.add(rankList.get(i));
    // }
    // }

    // 포트폴리오 한 리스트로 병합
    // for (int i = 0; i < result.size(); i++) {
    // List<Portfolio> pList = new ArrayList<>();
    // int who = -1;
    // for (int j = 0; j < rankList.size(); j++) {
    // if (result.get(i).getName().equals(rankList.get(j).getName())) {
    // who = i;
    // Portfolio portfolio = rankList.get(j).getPortfolios().get(0);
    // if (!pList.contains(portfolio)) {
    // pList.add(portfolio);
    // }
    // }
    // }
    // result.get(who).setPortfolios(pList);
    // }

    // 스킬 한 리스트로 병합
    // for (int i = 0; i < result.size(); i++) {
    // List<Skill> sList = new ArrayList<>();
    // int who = -1;
    // for (int j = 0; j < rankList.size(); j++) {
    // if (result.get(i).getName().equals(rankList.get(j).getName())) {
    // who = i;
    // Skill skill = rankList.get(j).getSkills().get(0);
    // if (!sList.contains(skill)) {
    // sList.add(skill);
    // }
    // }
    // }
    // result.get(who).setSkills(sList);
    // }

    // 관심지역 한 리스트로 병합
    // for (int i = 0; i < result.size(); i++) {
    // List<District> dList = new ArrayList<>();
    // int who = -1;
    // for (int j = 0; j < rankList.size(); j++) {
    // if (result.get(i).getName().equals(rankList.get(j).getName())) {
    // who = i;
    // District district = rankList.get(j).getDistricts().get(0);
    // if (!dList.contains(district)) {
    // dList.add(district);
    // }
    // }
    // }
    // result.get(who).setDistricts(dList);
    // }

    // for (Recommend r : result) {
    // System.out.println(r);
    // }

    return new Gson().toJson(rankList);
  }
}
