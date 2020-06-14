package com.portfoli.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;

public interface MemberService {

  int add(Member member, GeneralMember generalMember) throws Exception;

  int add(Member member, CompanyMember companyMember, int companyNumber) throws Exception;

  int delete(int memberType, int memberNumber, String currentPassword) throws Exception;

  Member get(String email, String password) throws Exception;

  Member get(int number) throws Exception;

  int updateDefaultInfo(GeneralMember member) throws Exception;

  int updateProfilePic(Map<String, Object> member) throws Exception;

  int updatePassword(int memberNumber, String newPassword, String password) throws Exception;

  int updateAddress(Member member) throws Exception;

  GeneralMember getGeneralMember(int number) throws Exception;

  CompanyMember getCompanyMember(int number) throws Exception;

  GeneralMember getSessionInfo(int number) throws Exception;

  int updateFlag(HashMap<String, Object> params) throws Exception;

  String getEmailByEmail(String email);

  Member findMemberByOtherProvider(String provider, String email) throws Exception;

  int updateProvider(String provider, String email);

  String getProviderByEmail(String email) throws Exception;

  List<Member> list(String regisDate, int currentPage, int pageSize) throws Exception;

  int selectListCnt() throws Exception;

  List<GeneralMember> findAll() throws Exception;

}
