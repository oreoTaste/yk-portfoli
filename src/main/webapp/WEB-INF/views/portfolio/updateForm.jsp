<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <div class="container-fluid">

    <div class="row">
<!--------------------------------------- nav bar ----------------------------------------------->
  <jsp:include page="../member/sidebar.jsp"/>
<!--------------------------------------- nav bar ----------------------------------------------->

<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->
      <section style="padding: 50px 0px; width: 55%;">
        <div class="container">

          <div class="row">

            <div class="col-12 col-lg-12">
        <h3 class="d-none d-lg-block m--3" style="margin-bottom: 1.4rem!important;">내 포트폴리오 수정</h3>

               <form id="update" action="update" method="post" enctype="multipart/form-data">
               <input name="number" type="hidden" value="${portfolio.getNumber()}"/>
                
          <span class="text-gray-900">제목 : </span> 
          <input id="title"
                 type="text"  placeholder="제목을 적어주세요"
                 class="form-label-group form-control-clean col-md-11 mt--5"
                 name="title" value="${portfolio.title}">

          <br>
          <p class="text-gray-900 mt-3" style="display: inline-block;">기술 : </p>
          <select multiple
                  name="skills"
                  class="bs-select form-label-group form-control-clean col-md-11 mt--5" 
                  title="
		      <%--스킬나열 --%>
		      <c:forEach items="${portfolio.skill}" var="skill" varStatus="status">
		                  ${skill.name}<c:if test="${!status.last}">,</c:if>
		      </c:forEach>
		      <c:if test="${empty portfolio.skill}">
		                              기술을 적어주세요
		      </c:if>
                  "
          >
            <c:forEach items="${myskills}" var="item">
            <option class="options" value="${item.skillNumber}" data-subtext="${item.fieldName}">${item.name}</option>
            </c:forEach>
          </select>



          <p class="text-gray-900 mt-3">내용 :</p>
          <textarea class="summernote-editor"
            name="content" 
            data-placeholder="내용을 적어주세요."
            data-min-height="300" 
            data-max-height="1000" 
            data-focus="true" 
            data-lang="en-US"
            data-toolbar='[
                ["style", ["style"]],
                ["font", ["bold", "italic", "underline", "clear"]],
                ["fontname", ["fontname"]],
                ["color", ["color"]],
                ["para", ["ul", "ol", "paragraph"]],
                ["height", ["height"]],
                ["table", ["table"]],
                ["insert", ["link", "hr"]],
                ["view", ["fullscreen", "codeview"]],
                ["help", ["help"]]
              ]'>${portfolio.content}</textarea>
                        
          <span class="text-gray-900">홈페이지 : </span>
          <textarea class="form-control" placeholder="홈페이지를 적어주세요" rows="1" name='homepage' style='resize: none; width:100%;'>${portfolio.homepage}</textarea>
          
            
          <div class='photoDiv' style="min-height: 200px;">
            <p class="text-gray-900 mt-3" style="margin-bottom: 0px">썸네일 :</p>
              <div class="form-control" align="center" >
                    <input type="file" id="thumb" name="thumb" accept=".gif, .jpg, .jpeg, .png" class="files"/><br>
              </div>
            
            <%-- filePar : 첨부파일 개수 늘리는 부분 --%>
              <p class="text-gray-900 mt-3" style="margin-bottom: 0px">첨부파일 :</p>
              <div class="form-control" align="center" id="filePar" style="height:auto;">
              <input type="file" name="files" class="files" onclick="plus(event)"/><br>
              </div>
          </div>
          
            <label
              class="form-switch form-switch-pill form-switch-primary d-block mt-3  ml-3">
              <input type="checkbox" id="readable" name="readable">
              <i data-on="OK" data-off="NO"></i> <span class="h6">포트폴리오 공개 여부</span>
            </label>

          <div align="right" class="container-fluid">
            <button id="register"
                    type="button"
                    class="btn btn-outline-secondary btn-pill btn-sm mt-3">등록하기
            </button>
          </div>

                </form>
                

              </div>

            </div>
          </div>


      </section>
      <!-- /FAQ -->
</div>
</div>
  <style>
    .btn.dropdown-toggle.select-form-control.border-gray-400.form-control-clean{
    background: lightblue;
    }
    .lightGray{width: 100%; border:2px lightGray solid;}
    .darkerGray{color:#313335;}
    .firstTR{border-bottom:1px darkGray dashed; padding:0px 5px;}
    .padding{padding:10px; border-right: 2px solid lightGray;}
    .smallPadding{padding:5px 5px; border-right: 2px solid lightGray;}
    .optPadding{height: 30px; padding: 0px 5px;}
    .pinkPadding{resize:none; border-color:pink; width: 75%; height: 100%}
    .photoTD{padding:10px; border-top:1px darkGray dashed; border-bottom:1px darkGray dashed; background: lightGray; height: 150px;}
    .photoInside{text-align: center}
    .buttonTD{text-align: center}
    .textAR{resize:none; border-color:pink}
  </style>

  <script src="${pageContext.getServletContext().getContextPath()}/node_modules/sweetalert2/dist/sweetalert2.all.js"></script>
  <script>
  $('#register').on('click', function() {
	  
	    // 제목과 내용이 비어있는지 체크 (bootstrap으로 required 구문 안먹음)
      if($('#title').val() == "" || $('.note-editable.card-block').html() == "" || $('.note-editable.card-block').html() == "<br>") {
          Swal.fire({
              icon: 'error',
              title: '잠깐!...',
              text: '제목, 내용을 넣어주세요.',
            })
    }
	    
      console.log($('#readable').val());
	    
	    // 비공개설정인 경우 : 조건없이 통과
	    if($('#readable').val() == 0 || $('#readable').val() != 'on') {
	    	$('#readable').val(0);
	          console.log($('#readable').val());
	      $('#update').submit();
	    } else {
	        // 공개설정인 경우 : 썸네일 값이 있는지 체크
	        if($('#thumb').val() == null) {
	          Swal.fire({
	            icon: 'error',
	            title: '잠깐!...',
	            text: '썸네일을 넣어주세요.',
	          })
	        } else {
	            $('#readable').val(1);
	          console.log($('#readable').val());
	            $('#update').submit();
	        }
	    }
	  });
  
  
  // 기존 skill title에 노출시키기
  var skills = $('.bs-select.form-label-group.form-control-clean.col-md-11.mt--5').attr("title");
  $('.btn.dropdown-toggle.select-form-control.border-gray-400.form-control-clean').attr("title", skills);
  
  var td = document.querySelector("#filePar");
  console.log(td);
  
  td.addEventListener("click", function(e) {
      
      var br = document.createElement("br");
      
      var newNode = document.createElement("input");
      newNode.type="file";
      newNode.name="files";
      newNode.setAttribute("class", "files");
      newNode.setAttribute("onclick", "plus(event)");
      
      // input file 할때 확장자를 선택할 경우
      // newNode.setAttribute("accept", ".gif, .jpg, .jpeg, .png");
      
      document.querySelector("#filePar");
      console.log(filePar);
      console.log(newNode);
      filePar.appendChild(newNode);
      filePar.appendChild(br);
      
      e.stopImmediatePropagation();
      
  });
  
    function plus(e) {
      e.stopImmediatePropagation();
    }
    
    function move(e) {
        e.preventDefault();
        location.href = "list";
      }
  </script>
