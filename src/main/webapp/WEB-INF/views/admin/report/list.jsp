<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="middle" class="flex-fill">
  <section class="rounded mb-3 ">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
      <strong> 신고 처리 </strong>
    </div>
    
      <div class="col-sm-12">
            <div class="table-responsive">
              <table class="table table-align-middle border-bottom mb-6">

                <thead>
                  <tr class="text-muted fs--13">
                    <th><span class="px-2 p-0-xs"> 제목 </span></th>
                    <th class="w--300 hidden-lg-down"> 신고자 </th>
                    <th class="w--200 hidden-lg-down">날짜</th>
                    <th class="w--100">조회수</th>
                  </tr>
                </thead>

                <tbody id="item_list">
                      <c:forEach items="${list}" var="report">
                    <tr id="report_id_${report.number}" class="text-dark">
                      <td>
                      <c:choose>
                        <c:when test="${report.reStep == 0}">
                        <span class="text-muted"> [${report.reportCategory.category}] </span>
                        </c:when> 
                        <c:when test="${report.reStep > 0}"> &nbsp; &nbsp; &nbsp; </c:when> 
                      </c:choose>
                      <a href="/portfoli/admin/report/detail?number=${report.number}"
                      class="font-weight-medium text-muted mx-2 m-0-xs"> ${report.title} </a>
                      </td>
                      <td class="hidden-lg-down"><span
                        class="d-block text-muted"> ${report.member.id} </span></td>
                      <td class="hidden-lg-down"><span class="d-block text-muted">
                      ${report.registeredDate} </span></td>
                      <td><span class="d-block text-muted"> ${report.viewCount} </span></td>
                    </tr>
                  </c:forEach>
                </tbody>

              </table>
            </div>

            <!-- options and pagination -->
            <div class="row text-center-xs">

              <!-- pagination -->
              <div class="col-12 col-xl-6">
                <nav aria-label="pagination">
                  <ul
                    class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

                    <c:if test="${page != startPage}">
                      <li
                        <c:if test="${pageNumber <= pageSize}"> class="page-item disabled btn-pill"</c:if>
                        <c:if test="${pageNumber != '1'}"> class="page-item"</c:if>
                        data-page="prev"><a class="page-link"
                        href="/portfoli/admin/report/list?pageNumber=${startPage - 1}"
                        tabindex="-1" aria-disabled="true">Prev</a></li>
                    </c:if>

                    <c:forEach begin="${startPage}" end="${endPage}" var="page">
                      <li
                        <c:if test="${page == pageNumber}"> class="page-item active"</c:if>
                        data-page="${page}"><a class="page-link"
                        href="/portfoli/admin/report/list?pageNumber=${page}">${page}</a>
                      </li>
                    </c:forEach>

                    <li
                      <c:if test="${endPage == totalPage}"> class="page-item disabled btn-pill"</c:if>
                      <c:if test="${endPage < totalPage}"> class="page-item"</c:if>
                      data-page="next"><a class="page-link"
                      href="/portfoli/admin/report/list?pageNumber=${endPage + 1}">Next</a>
                    </li>
                  </ul>
                </nav>

                <!-- pagination -->
              </div>
            </div>
            <!-- /options and pagination -->

      </div>
  </section>
</div>