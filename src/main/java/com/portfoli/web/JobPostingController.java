package com.portfoli.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.portfoli.domain.Certificate;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.CompanyRequiredCertificate;
import com.portfoli.domain.District;
import com.portfoli.domain.EmploymentStatus;
import com.portfoli.domain.Field;
import com.portfoli.domain.FinalEducation;
import com.portfoli.domain.JobPosting;
import com.portfoli.domain.JobPostingFile;
import com.portfoli.domain.Major;
import com.portfoli.domain.Member;
import com.portfoli.domain.Skill;
import com.portfoli.service.CertificateService;
import com.portfoli.service.DistrictService;
import com.portfoli.service.EmploymentStatusService;
import com.portfoli.service.FieldService;
import com.portfoli.service.FinalEducationService;
import com.portfoli.service.JobPostingService;
import com.portfoli.service.MajorService;
import com.portfoli.service.MemberService;
import com.portfoli.service.SkillService;
import net.coobird.thumbnailator.ThumbnailParameter;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@Controller
@RequestMapping("/jobposting")
public class JobPostingController {

  static Logger logger = LogManager.getLogger(JobPostingController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  JobPostingService jobPostingService;

  @Autowired
  EmploymentStatusService employmentStatusService;

  @Autowired
  CertificateService certificateService;

  @Autowired
  MajorService majorService;

  @Autowired
  DistrictService districtService;

  @Autowired
  FinalEducationService finalEducationService;

  @Autowired
  MemberService memberService;

  @Autowired
  FieldService fieldService;

  @Autowired
  SkillService skillService;


  public JobPostingController() {
    logger.debug("JobPostingController 생성");
  }

  @GetMapping("form")
  public void addForm(Model model) throws Exception {
    List<EmploymentStatus> employmentStatus = employmentStatusService.get();
    List<Certificate> certificates = certificateService.listCertificate();
    List<Major> majors = majorService.listMajor();
    List<District> districts = districtService.get();
    List<FinalEducation> finalEducations = finalEducationService.findAll();
    List<Field> fields = fieldService.list();
    List<Skill> skills = skillService.list();
    model.addAttribute("employmentStatus", employmentStatus);
    model.addAttribute("certificates", certificates);
    model.addAttribute("majors", majors);
    model.addAttribute("districts", districts);
    model.addAttribute("finalEducations", finalEducations);
    model.addAttribute("fields", fields);
    model.addAttribute("skills", skills);
  }

  @PostMapping("add")
  public String add(HttpServletRequest request, //
      JobPosting jobPosting, //
      Certificate certificate, //
      Major major, //
      MultipartFile[] jobPostingFiles) throws Exception {

    ArrayList<JobPostingFile> files = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/jobposting");
    for (MultipartFile photoFile : jobPostingFiles) {
      if (photoFile.getSize() <= 0) {
        continue;
      }
      String filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      files.add(new JobPostingFile().setFilePath(filename));

      Thumbnails.of(dirPath + "/" + filename)//
          .size(300, 300)//
          .outputFormat("jpg")//
          .toFiles(new Rename() {
            @Override
            public String apply(String name, ThumbnailParameter param) {
              return name + "_300x300";
            }
          });
    }
    CompanyMember companyMember = memberService.getCompanyMember(
        ((CompanyMember) request.getSession().getAttribute("loginUser")).getNumber());
    jobPosting.setCompanyMemberNumber(companyMember.getNumber());
    jobPosting.setFiles(files);
    System.out.println(jobPosting + "2222");
    jobPostingService.add(jobPosting);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    jobPostingService.delete(no);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(@RequestParam(defaultValue = "1") int no, HttpServletRequest request,
      Model model) throws Exception {

    Member mem = (Member) request.getSession().getAttribute("loginUser");
    if (mem == null) {
      throw new Exception("로그인을 하신 후, 채용정보를 볼 수 있습니다.");
    } else {
      jobPostingService.plusCnt(no);
      model.addAttribute("jobPosting", jobPostingService.get(no));

      JobPosting jobPosting = jobPostingService.get(no);

      // 자신이 작성한 채용공고인경우 수정/삭제버튼 생성
      if (mem.getNumber() == jobPosting.getCompanyMemberNumber()) {
        model.addAttribute("modifiable", true);
      }
    }
  }

  @GetMapping("list")
  public void list(@ModelAttribute("jobPosting") JobPosting jobPosting, Model model,
      HttpServletRequest request) throws Exception {

    Member mem = (Member) request.getSession().getAttribute("loginUser");
    if (mem == null) {
      throw new Exception("로그인을 하신 후, 채용정보를 볼 수 있습니다.");
    } else {
      int listCnt = jobPostingService.ListCnt(jobPosting);
      List<JobPosting> jobPostings = jobPostingService.list();
      model.addAttribute("listCnt", listCnt);
      model.addAttribute("jobPostings", jobPostings);

      // 기업회원일 경우
      if (mem.getType() == 2) {
        model.addAttribute("RegistrationPossible", true);
      }
    }
  }

  @GetMapping("list2")
  public void list2(@RequestParam(defaultValue = "1") int lastNo, Model model) throws Exception {
    List<JobPosting> jobPostings = jobPostingService.list2(lastNo);
    model.addAttribute("jobPostings", jobPostings);
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", jobPostingService.search(keyword));
  }

  @GetMapping("updateForm")
  public void updateForm(HttpServletRequest request, int no, Model model) throws Exception {
    CompanyMember companyMember = memberService.getCompanyMember(
        ((CompanyMember) request.getSession().getAttribute("loginUser")).getNumber());
    List<EmploymentStatus> employmentStatus = employmentStatusService.get();
    List<Certificate> certificates = certificateService.listCertificate();
    List<Major> majors = majorService.listMajor();
    List<District> districts = districtService.get();
    List<FinalEducation> finalEducations = finalEducationService.findAll();
    List<Field> fields = fieldService.list();
    List<Skill> skills = skillService.list();
    model.addAttribute("jobPosting", jobPostingService.get(no));
    model.addAttribute("employmentStatus", employmentStatus);
    model.addAttribute("certificates", certificates);
    model.addAttribute("majors", majors);
    model.addAttribute("districts", districts);
    model.addAttribute("finalEducations", finalEducations);
    model.addAttribute("companyMember", companyMember);
    model.addAttribute("fields", fields);
    model.addAttribute("skills", skills);
  }

  @PostMapping("update")
  public String update(//
      JobPosting jobPosting, //
      Certificate certificate, //
      Major major, //
      MultipartFile[] jobPostingFiles) throws Exception {
    ArrayList<JobPostingFile> files = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/jobposting");
    for (MultipartFile jobPostingFile : jobPostingFiles) {
      if (jobPostingFile.getSize() <= 0) {
        continue;
      }
      String filename = UUID.randomUUID().toString();
      jobPostingFile.transferTo(new File(dirPath + "/" + filename));
      files.add(new JobPostingFile().setFilePath(filename));

      Thumbnails.of(dirPath + "/" + filename)//
          .size(300, 300)//
          .outputFormat("jpg")//
          .toFiles(new Rename() {
            @Override
            public String apply(String name, ThumbnailParameter param) {
              return name + "_300x300";
            }
          });

    }

    List<Certificate> companyRequiredCertificates = new ArrayList<>();
    companyRequiredCertificates.add(//
        new CompanyRequiredCertificate().setCertificate(certificate));

    if (files.size() > 0) {
      jobPosting.setFiles(files);
    } else {
      jobPosting.setFiles(null);
    }

    jobPostingService.update(jobPosting);
    return "redirect:list";
  }


  @GetMapping("mylist")
  public void myList(@ModelAttribute("jobPosting") JobPosting jobPosting, Model model,
      HttpServletRequest request) throws Exception {

    Member mem = (Member) request.getSession().getAttribute("loginUser");

    List<JobPosting> myPostingList = jobPostingService.myPostingList(mem.getNumber());
    model.addAttribute("myPostingList", myPostingList);

    // 기업회원일 경우에만 공고등록 버튼 생성
    if (mem.getType() == 2) {
      model.addAttribute("RegistrationPossible", true);
    }

  }

  @GetMapping("premium")
  public void premium(Model model) throws Exception {
    List<JobPosting> list = jobPostingService.premiumList();
    System.out.println(list.toString());
    model.addAttribute("premium", jobPostingService.premiumList());
    for (JobPosting jp : list) {
      System.out.println(jp.getFiles().toString());
    }
  }
}
