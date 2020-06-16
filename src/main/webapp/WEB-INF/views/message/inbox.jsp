<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
  <div class="row">

<!--------------------------------------- nav bar ----------------------------------------------->
<jsp:include page="sideBar.jsp"></jsp:include>
<!--------------------------------------------- /nav bar ------------------------------------------------>

  <div class="col-lg-8 mt--20">
      <div id="middle" class="flex-fill">
        <div class="page-title bg-transparent b-0">
          <h1 class="h3 mt-3 mb-3 px-3 font-weight-normal myfont myfont-md">받은 쪽지함</h1>
        </div>
      </div>

      <!-- inbox list -->
      <div class="col-12 col-lg-9 col-xl-10 position-relative" style="max-width:100%;">

        <!-- portlet -->
        <div class="portlet">

          <!-- portlet : header -->
          <div class="portlet-header border-bottom">
            <span class="d-block text-muted text-truncate font-weight-medium pt-1"> 받은 쪽지함 </span>
          </div>
          <!-- /portlet : header -->

          <!-- portlet : body -->
          <div class="portlet-body pt-0" style="min-height: 450px;">

            <!-- 
          <form novalidate class="bs-validate" method="post" action="#!">
                      IMPORTANT
                      The "action" hidden input is updated by javascript according to button params/action:
                        data-js-form-advanced-hidden-action-id="#action"
                        data-js-form-advanced-hidden-action-value="delete"

                      In your backend, should process data like this (PHP example):

                        if($_POST['action'] === 'delete') {

                          foreach($_POST['item_id'] as $item_id) {
                            // ... delete $item_id from database
                          }

                        }
            <input type="hidden" id="action" name="action" value="">
                    -->
            <!-- value populated by js -->

            <div id="inbox" class="table-responsive">
              <table class="table table-align-middle border-bottom mb-6">

                <thead <c:if test="${empty inbox}">style="visibility:hidden;"</c:if>>
                  <tr class="text-muted fs--13">
                    <th class="w--30 hidden-lg-down"><label
                      class="form-checkbox form-checkbox-primary float-start">
                        <input class="checkall" data-checkall-container="#item_list"
                        type="checkbox" name="checkbox"> <i></i>
                    </label></th>
                    <th><span class="px-2 p-0-xs"> 제목 </span></th>
                    <th class="w--200 hidden-lg-down">보낸 사람</th>
                    <th class="w--200 hidden-lg-down">날짜</th>
                    <th class="w--100">&nbsp;</th>
                  </tr>
                </thead>

                <tbody id="item_list">

                  <!-- message -->
                  <c:if test="${empty inbox}"> <div class="pt-3 ml-3">받은 쪽지가 없습니다.</div></c:if>
                  <c:forEach items="${inbox}" var="message">
                    <tr id="message_id_${message.number}" class="text-dark">
                      <td class="hidden-lg-down"><label
                        class="form-checkbox form-checkbox-secondary float-start">
                          <input type="checkbox" name="item_id[]" value="1">
                          <i></i>
                      </label></td>

                      <td><a href="/portfoli/app/message/inbox/detail?number=${message.number}"
                      class="font-weight-medium text-muted mx-2 m-0-xs"> ${message.title} </a>
                      </td>
                      <td class="hidden-lg-down"><span
                        class="d-block text-muted"> ${message.member.id} </span></td>
                      <td class="hidden-lg-down"><span class="d-block text-muted">
                      <fmt:formatDate var="sendDate" value="${message.sendDate}" pattern="yyyy.MM.dd HH:mm:ss"/>
                        ${sendDate}</span></td>
                      <td class="text-align-end">
                        <div class="dropdown">
                          <a href="#" class="btn btn-sm btn-light rounded-circle"
                            data-toggle="dropdown" aria-expanded="false"
                            aria-haspopup="true"> <span class="group-icon">
                              <i class="fi fi-dots-vertical-full"></i> <i
                              class="fi fi-close"></i>
                          </span>
                          </a>

                          <div class="dropdown-menu dropdown-menu-clean dropdown-click-ignore max-w-220">
                            <a href="form?receiverNumber=${message.member.number}"
                              class="js-ajax-modal dropdown-item text-truncate"
                              data-href="form?receiverNumber=${message.member.number}"
                              data-ajax-modal-size="modal-md"
                              data-ajax-modal-centered="true"
                              data-ajax-modal-backdrop="static"> <i
                              class="fi fi-arrow-right-3"></i> 답장하기
                            </a> <a href="#!"
                              class="js-ajax-confirm dropdown-item text-truncate"
                              data-href="/portfoli/app/message/inbox/delete?number=${message.number}"
                              data-ajax-confirm-title="쪽지 삭제"
                              data-ajax-confirm-body="쪽지를 삭제하시겠습니까?"
                              data-ajax-confirm-mode="ajax"
                              data-ajax-confirm-method="GET"
                              data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
                              data-ajax-confirm-btn-yes-text="삭제"
                              data-ajax-confirm-btn-yes-icon="fi fi-check"
                              data-ajax-confirm-btn-no-class="btn-sm btn-light"
                              data-ajax-confirm-btn-no-text="닫기"
                              data-ajax-confirm-btn-no-icon="fi fi-close"
                              data-ajax-confirm-success-target="#message_id_${message.number}"
                              data-ajax-confirm-success-target-action="remove"> <i
                              class="fi fi-thrash text-danger"></i> 삭제
                            </a>

                          </div>
                        </div>
                      </td>
                    </tr>
                  </c:forEach>
                  <!-- /message -->
                </tbody>

              </table>
            </div>

            <!-- options and pagination -->
            <div class="row text-center-xs">
              <div class="hidden-lg-down col-12 col-xl-6" <c:if test="${empty inbox}">style="visibility:hidden;"</c:if>>

                <!-- SELECTED ITEMS -->
                <div class="dropup">

                  <a href="#" class="btn btn-sm btn-pill btn-light"
                    data-toggle="dropdown" aria-expanded="false"
                    aria-haspopup="true"> <span class="group-icon"> <i
                      class="fi fi-dots-vertical-full"></i> <i class="fi fi-close"></i>
                  </span> <span> 쪽지 선택하기 </span>
                  </a>

                  <div
                    class="dropdown-menu dropdown-menu-clean dropdown-click-ignore max-w-250">

                    <a href="#"
                      class="dropdown-item text-truncate js-form-advanced-bulk"
                      data-js-form-advanced-bulk-hidden-action-id="#action"
                      data-js-form-advanced-bulk-hidden-action-value="delete"
                      data-js-form-advanced-bulk-container-items="#item_list"
                      data-js-form-advanced-bulk-required-selected="true"
                      data-js-form-advanced-bulk-required-txt-error="No Items Selected!"
                      data-js-form-advanced-bulk-required-txt-position="top-center"
                      data-js-form-advanced-bulk-required-custom-modal=""
                      data-js-form-advanced-bulk-required-custom-modal-content-ajax=""
                      data-js-form-advanced-bulk-required-modal-type="danger"
                      data-js-form-advanced-bulk-required-modal-size="modal-md"
                      data-js-form-advanced-bulk-required-modal-txt-title="Please Confirm"
                      data-js-form-advanced-bulk-required-modal-txt-subtitle="Selected Items: {{no_selected}}"
                      data-js-form-advanced-bulk-required-modal-txt-body-txt="Are you sure? Delete {{no_selected}} selected items?"
                      data-js-form-advanced-bulk-required-modal-txt-body-info="Please note: this is a permanent action!"
                      data-js-form-advanced-bulk-required-modal-btn-text-yes="Delete"
                      data-js-form-advanced-bulk-required-modal-btn-text-no="Cancel"
                      data-js-form-advanced-bulk-submit-without-confirmation="false"
                      data-js-form-advanced-form-id="#form_id"> <i
                      class="fi fi-thrash text-danger"></i> 삭제
                    </a>

                  </div>
                </div>
                <!-- /SELECTED ITEMS -->
              </div>

              <!-- pagination -->
              <div class="col-12 col-xl-6">
                <nav aria-label="pagination">
                  <ul class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end"
                  <c:if test="${empty inbox}">style="visibility:hidden;"</c:if>>

                    <c:if test="${page != startPage}">
                      <li
                        <c:if test="${pageNumber <= pageSize}"> class="page-item disabled btn-pill"</c:if>
                        <c:if test="${pageNumber != '1'}"> class="page-item"</c:if>
                        data-page="prev"><a class="page-link"
                        href="/portfoli/app/message/inbox?pageNumber=${startPage - 1}"
                        tabindex="-1" aria-disabled="true">Prev</a></li>
                    </c:if>

                    <c:forEach begin="${startPage}" end="${endPage}" var="page">
                      <li
                        <c:if test="${page == pageNumber}"> class="page-item active"</c:if>
                        data-page="${page}"><a class="page-link"
                        href="/portfoli/app/message/inbox?pageNumber=${page}">${page}</a>
                      </li>
                    </c:forEach>

                    <li
                      <c:if test="${endPage == totalPage}"> class="page-item disabled btn-pill"</c:if>
                      <c:if test="${endPage < totalPage}"> class="page-item"</c:if>
                      data-page="next"><a class="page-link"
                      href="/portfoli/app/message/inbox?pageNumber=${endPage + 1}">Next</a>
                    </li>
                  </ul>
                </nav>

                <!-- pagination -->
              </div>
            </div>
            <!-- /options and pagination -->

          </div>
          <!-- /portlet : body -->

        </div>
        <!-- /portlet -->

      </div>
      <!-- /inbox list -->

      </div>
    </div>
  </div>
  
  <style>
  .myfont{
  	font-weight:bold!important;
  	text-align:left; 
  	margin-left:1rem;
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
  
  <script>
  $('.inbox').addClass('active');
  </script>