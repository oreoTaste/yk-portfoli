<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-fluid">
  <div class="row">
    <jsp:include page="navbar.jsp"/>

    <div class="portlet mt--20" style="width: 65%;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block m--3 myfont myfont-lg">내 신고내역</h1>
        <!-- 
        <div align="right" class="container-fluid">
          <a href="/portfoli/app/report/delete?number=${report.number}"><button type="button"
              class="btn btn-outline-secondary btn-pill btn-sm ml-2"> 삭제 </button></a>
        </div>
        -->
      </div>
      
      <div class="table-responsive rounded" style="min-height: 500px;">
        <table class="table m-0">
        <c:if test="not empty ${report.reportCategory.category}">
          <tr>
            <th scope="row">카테고리</th>
            <td>${report.reportCategory.category}</td>
          </tr>
        </c:if>
          <tr>
            <th scope="row">신고 대상</th>
            <td>${report.member.id}</td>
          </tr>
          <tr>
            <th scope="row">작성일</th>
            <td><fmt:formatDate var="registeredDate"
              value="${report.registeredDate}" pattern="yyyy.MM.dd HH:mm:ss"/> ${registeredDate}
            </td>
          </tr>
          <tr>
            <th scope="row">제목</th>
            <td>${report.title}</td>
          </tr>
        </table>
        <div class="border m-3 p-3" style="min-height: 300px;">
          <p style="white-space: pre-wrap;">${report.content}</p>
        </div>
        <c:if test="not empty ${report.reportCategory.category}">
        <table class="table m-0">
          <tr>
          <th scope="row">첨부파일</th>
          <td>
          <c:forEach items="${report.attachments}" var="attachment">
            <a href="${pageContext.servletContext.contextPath}/upload/report/${attachment.filePath}"
              target=”_blank”> ${attachment.fileName} </a> <br>
            </c:forEach>
          </td>
          </tr>
        </table>
        </c:if>
    </div>
    <br>
  </div>
  <!-------------------------------------------- /contents -------------------------------------------------->
</div>
</div>
<style>
.myfont{
	font-weight:bold!important;
	text-align:left; 
	/*margin-left:1rem;*/
}
.myfont-md{
	font-size:1.5rem!important; 
}
.myfont-lg{
	font-size:1.8rem!important; 
}
.myfont-sm{
	font-size:1.2rem!important; 
}
</style>