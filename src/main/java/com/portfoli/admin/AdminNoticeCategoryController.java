package com.portfoli.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.portfoli.domain.NoticeCategory;
import com.portfoli.domain.Pagination;
import com.portfoli.service.NoticeCategoryService;
import com.portfoli.service.NoticeService;

@Controller
@RequestMapping("category")
public class AdminNoticeCategoryController {
  final int pageSize = 10;
  static Logger logger = LogManager.getLogger(AdminNoticeCategoryController.class);

  public AdminNoticeCategoryController() {
    AdminNoticeCategoryController.logger.debug("NoticeCategoryController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  NoticeService noticeService;

  @Autowired
  NoticeCategoryService noticeCategoryService;

  @RequestMapping("list")
  public void list(@ModelAttribute("notice") final NoticeCategory noticeCategory,
      @RequestParam(defaultValue = "1") final int curPage, final HttpServletRequest request,
      final Model model) throws Exception {

    // 전체리스트 개수
    int listCnt = noticeCategoryService.selectListCnt(noticeCategory);

    Pagination pagination = new Pagination(listCnt, curPage);
    pagination.setPageSize(pageSize);// 한페이지에 노출할 게시글 수

    noticeCategory.setStartIndex(pagination.getStartIndex());
    noticeCategory.setPageSize(pagination.getPageSize());

    // 전체리스트 출력
    model.addAttribute("listCnt", listCnt);
    model.addAttribute("pagination", pagination);

    List<NoticeCategory> categories = noticeCategoryService.list(noticeCategory);
    model.addAttribute("list", categories);
  }

  @RequestMapping("detail")
  public void detail(final int number, final Model model) throws Exception {
    NoticeCategory noticeCategory = noticeCategoryService.get(number);
    model.addAttribute("category", noticeCategory);
  }

  @GetMapping("form")
  public void form() throws Exception {}

  @PostMapping("add")
  public String add(final NoticeCategory noticeCategory) throws Exception {
    noticeCategoryService.insert(noticeCategory);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(final int categoryNumber) throws Exception {
    try {
      NoticeCategory noticeCategory = noticeCategoryService.get(categoryNumber);
      noticeCategoryService.delete(categoryNumber);
      logger.debug(String.format("게시물 분류 삭제: [%d번] %s", categoryNumber, noticeCategory.getName()));
      return "redirect:list";
    } catch (Exception e) {
      throw new IllegalStateException("해당 분류번호의 게시물이 있어 삭제할 수 없습니다.");
    }
  }

  @GetMapping("forceDelete")
  public String forceDelete(final int categoryNumber) throws Exception {
    try {
      // 9번 분류의 공지사항을 0번(미분류)로 변경(9번 카테고리를 지우는 경우)
      // UPDATE pf_notice SET category_no = 0 WHERE category_no = 9;
      Map<String, Integer> map = new HashMap<>();
      map.put("targetCategoryNumber", 0);
      map.put("sourceCategoryNumber", categoryNumber);
      noticeService.update(map);

      NoticeCategory noticeCategory = noticeCategoryService.get(categoryNumber);
      // 9번 분류 카테고리 삭제
      // DELETE FROM pf_notice_category WHERE category_no = 9;
      noticeCategoryService.delete(categoryNumber);
      logger.debug(String.format("게시물 분류 삭제: [%d번] %s", categoryNumber, noticeCategory.getName()));
      return "redirect:list";
    } catch (Exception e) {
      throw new IllegalStateException("해당 분류번호의 게시물이 있어 삭제할 수 없습니다.");
    }
  }

  @PostMapping("updateForm")
  public void updateForm(final NoticeCategory noticeCategory, final Model model) throws Exception {
    NoticeCategory item = noticeCategoryService.get(noticeCategory.getCategoryNumber());
    model.addAttribute("category", item);
  }


  @PostMapping("update")
  public String update(final NoticeCategory noticeCategory) throws Exception {
    noticeCategoryService.update(noticeCategory);
    return "redirect:list";
  }

  @PostMapping(value = "isValid", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String isValid(@RequestBody HashMap<String, String> map, Model model) throws Exception {
    int categoryNumber;
    try {
      categoryNumber = Integer.parseInt(map.get("categoryNumber"));

    } catch (NumberFormatException e) {
      return "";
    }
    NoticeCategory noticeCategory = new NoticeCategory();
    noticeCategory.setStartIndex(-1);

    List<NoticeCategory> categories = noticeCategoryService.list(noticeCategory);
    String result = "valid";
    for (NoticeCategory tmp : categories) {
      if (tmp.getCategoryNumber() == categoryNumber) {
        result = "invalid";
        break;
      }
    }

    Gson gson = new Gson();
    String jsonString = gson.toJson(result);
    return jsonString;
  }
}
