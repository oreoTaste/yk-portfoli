package com.portfoli.web;

import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.portfoli.domain.Calendar;
import com.portfoli.domain.Member;
import com.portfoli.service.CalendarService;

@Controller
@RequestMapping("calendar")
public class CalendarController {

  @Autowired
  CalendarService calendarService;

  static Logger logger = LogManager.getLogger(CalendarController.class);

  public CalendarController() {
    CalendarController.logger.debug("CalendarController 객체 생성!");
  }

  @GetMapping("calendar")
  public void calendar() throws Exception {}

  @GetMapping("eventCreate")
  public void eventCreateModal(String date, Model model) throws Exception {
    model.addAttribute("startDate", date);
  }

  @PostMapping("eventCreate")
  public String eventCreate(Calendar calendar, HttpSession session) throws Exception {
    calendar.setGeneralMemberNumber(((Member) session.getAttribute("loginUser")).getNumber());
    calendarService.add(calendar);
    return "redirect:/app/calendar/calendar";
  }

  @GetMapping("eventEdit")
  public void eventEditModal(String id, String start, String end, Model model) throws Exception {
    // 2020-05-12T15:00:00.000Z
    if(start != null) {
      Calendar calendar = new Calendar();
      calendar.setId(Integer.parseInt(id));
      calendar.setStart(start.substring(0, 10) + " " + start.substring(11, 16));
      calendar.setEnd(end.substring(0, 10) + " " +  end.substring(11, 16));
      eventEdit(calendar);
    }
    model.addAttribute("id", id);
  }

  @PostMapping("eventEdit")
  public void eventEdit(Calendar calendar) throws Exception {
    calendarService.update(calendar);
  }

  @ResponseBody
  @PostMapping("schedule")
  public Object schedule(HttpSession session, String start) throws Exception {
    int memberNumber = ((Member) session.getAttribute("loginUser")).getNumber();
    return calendarService.get(memberNumber);
  }

  @GetMapping("delete")
  public String delete(String id) throws Exception {
    calendarService.delete(Integer.parseInt(id));
    return "redirect:/app/calendar/calendar";
  }

}
