<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<div id="middle" class="flex-fill">

  <section class="rounded mb-3">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
      <strong>배너 관리</strong>
    </div>

      <!-- Search form -->
      <form novalidate class="bs-validate js-ajax"
        action="/portfoli/admin/banner/add" method="post"
        enctype="multipart/form-data" data-modal-autoclose-on-success="true"
        data-modal-autoclose-on-success-delay="200"
        data-ajax-update-url="false" data-ajax-show-loading-icon="true"
        data-success-toast-text="<i class='fi fi-check float-start'></i> 배너 등록이 완료되었습니다."
        data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> 빈 칸을 모두 입력해주세요."
        data-error-toast-delay="3000"
        data-error-toast-position="bottom-center"
        data-error-scroll-ignore="true"
        data-ajax-callback-function="redirect">
        <input type="hidden" name="companyNumber">
        <div class="table-responsive" style="overflow: visible;">
          <table class="table table-sm">
            <tr>
              <th scope="row">기업명</th>
              <td><input type="text" id="searchInput"
                class="form-control form-control-clean col-12-sm mt-2 mb-2"
                placeholder="기업명 검색"></td>
            </tr>
            <tr>
              <th scope="row">제목</th>
              <td><input type="text" name="title" id="title"
                class="form-control form-control-clean col-12-sm mt-2 mb-2"
                placeholder="제목"></td>
            </tr>
            <tr>
              <th scope="row">배너이미지</th>
              <td><label
                class="rounded text-center position-relative d-block cursor-pointer border border-secondary border-dashed w--600 h--120">
                  <!-- remove button --> <a href="#"
                  class="js-file-input-showcase-remove hide position-absolute absolute-top text-align-start z-index-3">
                    <span
                    class="d-inline-block btn btn-sm bg-secondary text-white pt--4 pb--4 pl--10 pr--10 m--1 mt-2 mb-2"
                    title="remove image" data-tooltip="tooltip"> <i
                      class="fi fi-close m-0"></i>
                  </span>
                </a> <span
                  class="z-index-2 js-file-input-showcase-container d-block absolute-full z-index-1 hide-empty">
                    <!-- image container -->
                </span> <input name="image" type="file" data-file-ext="jpg, jpeg, png"
                  data-file-max-size-kb-per-file="10240"
                  data-file-ext-err-msg="Allowed:"
                  data-file-size-err-item-msg="File too large!"
                  data-file-size-err-total-msg="Total allowed size exceeded!"
                  data-file-toast-position="top-center"
                  data-file-preview-container=".js-file-input-showcase-container"
                  data-file-preview-show-info="false"
                  data-file-preview-class="m-0 p-0 rounded"
                  data-file-preview-img-height="auto"
                  data-file-btn-clear="a.js-file-input-showcase-remove"
                  data-file-preview-img-cover="true"
                  class="custom-file-input absolute-full mt-2 mb-2">

                  <div class="absolute-full">
                    <div class="d-table">
                      <div class="d-table-cell align-middle text-center">

                        <i class="fi fi-image fs--30 text-muted"></i> <small
                          class="d-block text-muted"> <b>이미지를 등록해주세요. </b> <span
                          class="d-block mt-1"> 1160*220px의 이미지 파일을 지원합니다. </span>
                        </small>

                      </div>
                    </div>
                  </div> <!-- ratio maintained using a `blank` image --> <img
                  class="w--600 h--120"
                  src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                  alt="...">

              </label></td>
            </tr>
            <tr>
              <th scope="row">링크 URL</th>
              <td><input required type="text" name="url"
                class="form-control form-control-sm col-12-sm mt-2 mb-2"
                placeholder="http://"></td>
            </tr>
            <tr>
              <th scope="row">기간</th>
              <td><div class="form-label-group col-12-sm mt-2 mb-2">
                  <input autocomplete="off" type="text"
                    class="form-control rangepicker"
                    data-single-datepicker="true" data-timepicker="true"
                    data-timepicker-24h="true"
                    data-disable-auto-update-input="false"
                    data-date-format="YYYY-MM-DD HH:mm"
                    data-quick-locale='{
                        "lang_apply"  : "Apply",
                        "lang_cancel" : "Cancel",
                        "lang_months"  : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        "lang_weekdays" : ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
                      }'
                    placeholder="시작일" name="startDate" id="startDate"> <label for="startDate">시작일</label>
                </div>
                <div class="form-label-group mt-2 mb-2">
                  <input required autocomplete="off" type="text"
                    class="form-control rangepicker"
                    data-single-datepicker="true" data-timepicker="true"
                    data-timepicker-24h="true"
                    data-disable-auto-update-input="true"
                    data-date-format="YYYY-MM-DD HH:mm"
                    data-quick-locale='{
                        "lang_apply"  : "Apply",
                        "lang_cancel" : "Cancel",
                        "lang_months"  : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        "lang_weekdays" : ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
                      }'
                    placeholder="마감일" name="endDate" id="endDate"> <label for="endDate">마감일</label>
                </div></td>
            </tr>
            <tr>
              <th scope="row">게시 여부</th>
              <td>
                <div
                  class="custom-control custom-radio custom-control-inline mt-2 mb-2">
                  <input type="radio" value="0" id="customRadioInline1"
                    name="activateYN" class="custom-control-input" checked>
                  <label class="custom-control-label" for="customRadioInline1">숨기기</label>
                </div>
                <div
                  class="custom-control custom-radio custom-control-inline mt-2 mb-2">
                  <input type="radio" value="1" id="customRadioInline2"
                    name="activateYN" class="custom-control-input"> <label
                    class="custom-control-label" for="customRadioInline2">보이기</label>
                </div>
              </td>
            </tr>
          </table>
        </div>
        <div class="text-center">
          <button type="submit"
            class="btn btn-sm btn-outline-success btn-pill mb-1">
            <i class="fi fi-check"></i> 등록
          </button>
          <button type="button"
            class="btn btn-sm btn-outline-secondary btn-pill mb-1"
            onClick='location.href="/portfoli/admin/banner/list"'>뒤로
          </button>
        </div>
      </form>
  </section>
</div>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
  $("#searchInput").autocomplete({
    source : function(request, response) {
      $.ajax({
        type : "post",
        data : {
          term : request.term
        },
        dataType : "json",
        url : "/portfoli/admin/banner/json",
        success : function(data) {
          console.log("success" + JSON.stringify(data));
          response($.map(data, function(item) {
            return {
              label : item.name,
              value : item.name,
              companyNo : item.number
            }
          }));
        }
      });
    },
    select : function(event, ui) {
      $("input[name=companyNumber]").val(ui.item.companyNo);
      console.log(ui);
    },
    focus : function(event, ui) {
      return false;
    },
    minLength : 1,
    autoFocus : true,
    close : function(event) {
      console.log(event);
    }
  });
});

function redirect() {
  location.href = "/portfoli/admin/banner/list";
}
</script>