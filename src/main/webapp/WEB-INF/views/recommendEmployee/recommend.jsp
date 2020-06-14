<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- div =  container > highContetns , rowContents > highcon > high  -->

<div class="container" style="height:1000px; padding: 30px 0px;">
	<div style="font-weight:bold; text-align:left; font-size:1.8rem; margin-left:1rem; margin-bottom:2rem;">
	  <strong>Employment Recommendation</strong>
	</div>
<div class="row">
    <div style="z-index:1;" class="col-3 col-lg-3">
			<!-------------------------------------------경력--------------------------------------------------->
				<div style="z-index:1;" class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div style="z-index:1; height:300px;"  class="card-body">

						<h5 class="card-title">경력</h5>

						<div style="z-index:1;margin-left:0!important" class="input-group mb-3 ml-1">
							<!------------------------------------------경력신입체크---------------------------------------------->
					<div style="width:100%; margin-bottom:1rem;">		
            <a id="toggleCareer" style="width:100%; height:40px;" href="#!" class="btn btn-primary btn-soft btn-toggle btn-sm">
						  <span class="group-icon">
						    <i>신입</i>
						    <i>경력</i>
						  </span>		
						</a>
					</div>
							<br> <br>
							<!-----------------------------------------/경력신입체크---------------------------------------------->

								<div style="z-index:2;width:100%;margin-left:0!important;" class="overLessYear form-label-group mb-3 ml-1">
									<select style="z-index:2;" id="overYear"
										class="bs-select form-label-group form-control-clean col-md-15 mt--5"
										name='overYear'>
										<option value=0>최소경력</option>
										<option value=1>1년 이상</option>
										<option value=2>2년 이상</option>
										<option value=3>3년 이상</option>
										<option value=4>4년 이상</option>
										<option value=5>5년 이상</option>
										<option value=6>6년 이상</option>
										<option value=7>7년 이상</option>
										<option value=8>8년 이상</option>
										<option value=9>9년 이상</option>
									</select>
								</div>

								<div style="z-index:1;width:100%;margin-left:0!important;" class="overLessYear form-label-group mb-3 ml-1">
									<select id="lessYear"
										class="bs-select form-label-group form-control-clean col-md-15 mt--5"
										name='overYear'>
										<option value=0>최대경력</option>
										<option value=1>1년 이하</option>
										<option value=2>2년 이하</option>
										<option value=3>3년 이하</option>
										<option value=4>4년 이하</option>
										<option value=5>5년 이하</option>
										<option value=6>6년 이하</option>
										<option value=7>7년 이하</option>
										<option value=8>8년 이하</option>
										<option value=9>9년 이하</option>
									</select>
								</div>


						</div>
					</div>
				</div>
				</div>


			<!------------------------------------------/경력--------------------------------------------------->
			<!------------------------------------------지역---------------------------------------------------->
    <div class="col-3 col-lg-3" style="z-index:1;">
				<div style="z-index:1;"
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div style="height:300px; z-index:1;"  class="card-body">
						<h5 class="card-title">지역</h5>
						
							<select
                style="z-index:100;"
                class="bs-select form-control form-label-group form-control-clean col-md-12 mt--5"
                data-ajax-target="#district_category"
                id="city_category" name="city_category"
                data-ajax-callback-function="selectedCity">
                <option value="0">지역전체</option>
                <c:forEach items="${citys}" var="city">
                  <option value="${city.name}">${city.name}</option>
                </c:forEach>
              </select>
              
               <select
                class="bs-select form-control form-label-group form-control-clean col-md-12 mt--5"
                id="district_category" name="district_category"
                data-ajax-url="../district/list2"
                data-ajax-method="GET"
                data-ajax-callback-function="selectedDistrict">
                <c:forEach items="${districts}" var="district">
                  <option value="${district.districtNumber}">${district.name}</option>
                </c:forEach>
              </select>
							
					</div>
				</div>
				</div>


			<!-----------------------------------------/지역---------------------------------------------------->
			<!-----------------------------------------학력----------------------------------------------------->
<div class="col-3 col-lg-3" style="z-index:1;">
				<div style="z-index:1;"
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div style="height:300px;z-index:1;"  class="card-body">
						<h5 class="card-title">학력</h5>
						<div class="input-group mb-3 ml-1" style="z-index:1; margin-left:0!important">
							<select
								class="bs-select form-label-group form-control-clean col-md-12 mt--5"
								id="selectEducation" name="generalMember.number">
								<option value="0">학력전체</option>
								<c:forEach items="${educations}" var="education">
									<option value="${education.educationNumber}">${education.category}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
</div>

		
			<!----------------------------------------/학력----------------------------------------------------->
			<!---------------------------------------기술,툴----------------------------------------------------->
<div class="col-3 col-lg-3" style="z-index:1;">
				<div style="z-index:1;"
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div style="height:300px;z-index:1; "  class="card-body">
						<h5 class="card-title">기술/툴</h5>
						
						
							<select
                class="bs-select form-control form-label-group form-control-clean col-md-12 mt--5"
                data-ajax-target="#skill_category"
                id="field_category" name="field_category"
                data-ajax-callback-function="selectedField">
                <option value="0">분야전체</option>
                <c:forEach items="${fields}" var="field">
                  <option value="${field.name}">${field.name}</option>
                </c:forEach>
              </select>
              
                <select
                class="bs-select form-control form-label-group form-control-clean col-md-12 mt--5"
                id="skill_category" name="skill_category"
                data-ajax-url="../skill/list2"
                data-ajax-method="GET"
                data-ajax-callback-function="selectedSkill">
                <option value="0">기술전체</option>
                <c:forEach items="${skills}" var="skill">
                  <option value="${skill.skillNumber}">${skill.name}</option>
                </c:forEach>
              </select> 
						
					</div>
				</div>
</div>


			<!--------------------------------------/기술,툴----------------------------------------------------->
        </div>
<hr>

		<div class="row" style="z-index:0;">
      <div style="z-index:0;" class="col-2 col-lg-2">
        <div style="z-index:0;" class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-danger bl-0 br-0 bb-0 bw--2">
          <div style="z-index:0; height:150px;" id="searchCount" class="card-body">
            <p>조회수</p>
          </div>
        </div>
      </div>
      
      <div class="col-10 col-lg-10" style="z-index:0;">
        <div id="filterField" style="z-index:0;" class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-danger bl-0 br-0 bb-0 bw--2">
          <div id="filterList" class="card-body" style="height:150px; z-index:0;">
            <p>Filter</p>
          </div>
        </div>
      </div>
    </div>
<hr>


  <!-- 테이블 출력 부분 -->
  <div class="row">
    <div class="col-12 col-lg-12">
      <div class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-primary bl-0 br-0 bb-0 bw--2">
        <div id="searchTable" class="card-body">
        
			    <div style="display:inline-block" class="dataTables_length" id="rand_yjK_length">
			      <label>
			        <select id="orderCount" name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm">
			          <option id="viewCareer" class="count">경력순</option>        
			          <option id="viewEducation" class="count">학력순</option>
			        </select>
			      </label>
			    </div>
        
          <table id="viewPeople" class="table table-striped table-hover">
            <thead>
			        <th>이름</th>
			        <th>경력구분</th>
			        <th>학력구분</th>
			        <th>포트폴리오</th>
			        <th>관심지역</th>
			        <th>보유기술</th>
			        <th>재직여부</th>
            </thead>
            <tbody>
              <!-- 비동기 데이터 입력부분 -->			        
            </tbody>
          </table>        
        </div>
      </div>
    </div>
  </div>
<!-- 테이블 출력 부분 -->


</div>

<style>
	.bs-select.form-label-group.form-control-clean.col-md-12.mt--5.js-bselectified{
		z-index:1;
	}
	.dropdown.bootstrap-select.bs-select.form-label-group.form-control-clean.col-md-15.mt--5 {
		width:100%;
	}
	th {vertical-align:middle;}
	td {vertical-align:middle;}
</style>


<script>
var toggle = 1;

var filter = function() {
    console.log("Filter()");
    let data = {};
    
    data.careerNew = $("#filterList .careerNew").text();
    data.careerStart = $("#filterList .careerStart").text(); 
    data.careerEnd = $("#filterList .careerEnd").text();
    data.selectEducation = $("#filterList .selectEdu").text();
    data.viewOrder = $("#orderCount option:selected").text();
    
    data.skillList = [];
    let selectSkillList = $("#filterList .selectSkill");
    for(let skill of selectSkillList) {
    	data.skillList.push($(skill).text());
    }
    
    data.districtList = [];
    let selectDistrictList = $("#filterList .selectDistrict");
    for(let district of selectDistrictList) {
        data.districtList.push($(district).text());
    }
    

    var convertedData = JSON.stringify(data);
    
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
        if (xhr.readyState == 4) {
          if (xhr.status == 200) {
        	    var sCount = 0;
              let obj = JSON.parse(xhr.responseText);
              
              $("#viewPeople > tbody > tr").remove();
              for(let item of obj) {
                let makeHtml = "";
                
                let havePortfolio = "";
                for(let portfolio of item.portfolios) {
                	havePortfolio += `<span style="cursor:pointer; margin:2px;" 
											                		data-href="../portfolio/detail?number=` + portfolio.boardNumber + `" 
											                    data-ajax-modal-size="modal-xl" 
											                    data-ajax-modal-centered="true" 
											                    data-ajax-modal-callback-function=""
											                    class="js-ajax-modal card-title havePortfolios badge badge-pill badge-secondary">` 
											                    + portfolio.boardNumber + `</span>`
                }
                
                let interestDistrict = "";
                for(let district of item.districts) {
                	interestDistrict += `<span style="margin:2px;" class="interestDistrict badge badge-pill badge-secondary">` + district.name + `</span>`
                }
                
                let haveSkill = "";
                for(let skill of item.skills) {
                	haveSkill += `<span style="margin:2px;" class="haveSkills badge badge-pill badge-secondary">` + skill.name + `</span>`
                }
                
                let flag = item.seekingFlag == 1 ? "구직중" : "재직중";
                
                makeHtml += `<tr>
                              <td>` + item.name + `</td>
							                <td>` + item.career + `년차</td>
							                
							                
							                
							                <td>` + item.educationName + `</td>
							                <td>` + havePortfolio + `</td>
							                <td>` + interestDistrict + `</td>
 							                <td>` + haveSkill + `</td>
 							                <td>` + flag + `</td>
                             </tr>`                  
							                	
                $("#viewPeople > tbody").append(makeHtml);
                sCount++;
              }
              $("#searchCount > h5").remove();
              $("#searchCount").append(`<h5>` + sCount + `건 검색</h5>`);
            }
        }
    };
    xhr.open('POST', 'listByFilter');
    xhr.setRequestHeader('Content-Type', 'application/json'); 
    xhr.send(convertedData);    
};

window.onload = function() {
	$(".overLessYear").hide();
};

$("#toggleCareer").click(function() {
	if(toggle = (1 - toggle)) {
	  $(".overLessYear").hide();	
	  
	  item = $("#toggleCareer i").text();
	  if(item.substring(0, 2) == $("#filterList .careerNew").text()) {
		  return;
	  }
	  
	  $("#filterField #filterList").append(
		      `<span style="cursor:pointer; margin:2px;" class="careerNew badge badge-pill badge-secondary">` + item.substring(0, 2) + `</span>`
		      );
	  $("#filterList .careerStart").remove();
	  $("#filterList .careerEnd").remove();
	  filter();
	} else {
	  $(".overLessYear").show();
	  $("#filterList .careerNew").remove();
	}
});

$("#overYear").change(function(){
	let startIdx = $("#overYear option").index($("#overYear option:selected"));
	
	if($("#overYear option:selected").val() == 0) {
		return;
	}
	
	let compare = document.querySelectorAll("#filterList .careerEnd");
	if($(compare).length > 0 && $("#overYear option:selected").text().charAt(0) > $(compare).text().charAt(0)) {
		return;
	}
	
	let current = document.querySelectorAll("#filterList .careerStart");
	if(current.length) {
		$(current).remove();
	}	
	
	let item = $("#overYear option:selected").text();
	$("#filterField #filterList").append(
			`<span style="cursor:pointer; margin:2px;" class="careerStart badge badge-pill badge-secondary">` + item + `</span>`
			);
	filter();
});

$("#lessYear").change(function(){
  let startIdx = $("#lessYear option").index($("#lessYear option:selected"));
  
  if($("#lessYear option:selected").val() == 0) {
    return;
  }
  
  let compare = document.querySelectorAll("#filterList .careerStart");
  if($(compare).length > 0 && $("#lessYear option:selected").text().charAt(0) < $(compare).text().charAt(0)) {
    return;
  }
  
  let current = document.querySelectorAll("#filterList .careerEnd");
  if(current.length) {
    $(current).remove();
  } 
  
  let item = $("#lessYear option:selected").text();
  $("#filterField #filterList").append(
      `<span style="cursor:pointer; margin:2px;" class="careerEnd badge badge-pill badge-secondary">` + item + `</span>`
      );
  filter();
});
	
$("#selectEducation").change(function(){
  let startIdx = $("#selectEducation option").index($("#selectEducation option:selected"));
  
  if($("#selectEducation option:selected").val() == 0) {
    return;
  }
  
  let current = document.querySelectorAll("#filterList .selectEdu");
  if(current.length) {
    $(current).remove();
  } 
  
  let item = $("#selectEducation option:selected").text();
  $("#filterField #filterList").append(
      `<span style="cursor:pointer; margin:2px;" class="selectEdu badge badge-pill badge-secondary">` + item + `</span>`
      );
  filter();
});

$("#district_category").change(function(){
		// 도시번호 입력 (district단위)
		inputValue = $("#district_category").val();
		// 도시이름 입력 (district단위)
		inputText = $("#district_category option:selected").html();
    let startIdx = $("#district_category option").index($("#district_category option:selected"));
    
    if($("#district_category option:selected").val() == 0) {
      return;
    }
    
    let current = document.querySelectorAll("#filterList .selectDistrict");    
    for(let item of current) {
    	if($(item).text() == $("#district_category option:selected").text()) {
    		return;
    	}
    }
    
    let item = $("#district_category option:selected").text();
    
    var sibling = $("#district_category option:selected").siblings("option:not(:selected)");
    var arrays = {};
    for(var s of sibling) {
    	arrays[s.value] = s.innerHTML;
    }

    // 선택값이 '전체'로 끝나지 않는 경우 +
    // 이미 '전체'가 filterList에 있는 경우 : 값이 들어가지 않도록
   	if(!$("#district_category option:selected").text().endsWith('전체')) {
	    for(var filteredElement of $("#filterField #filterList span")) {
	    	if(filteredElement.getAttribute("value").endsWith("000") &&
	    		filteredElement.getAttribute("value").substr(0,3) == $("#district_category").val().substr(0,3)) {
	    		console.log("전체값이 있다.");
	    		return;
	    	}
	    }
   	}
    
    // value 값에 도시번호, innerHTML에 도시이름 입력
    var newChild = `<span style="cursor:pointer; margin:2px;" value=` + inputValue + ` class="selectDistrict badge badge-pill badge-secondary">` + item + `</span>`;
    $("#filterField #filterList").append(newChild);
    
    // 선택값이 '전체'로 끝나는 경우
    // 이하 도시로 들어가있는 span태그 모두 삭제
   	if($("#district_category option:selected").text().endsWith('전체')) {
	    for(var filteredElement of $("#filterField #filterList span")) {
	    	for(var arr in arrays) {
	    		// 도시전체로 할 경우, sibling의 도시번호를 찾아서 삭제
	    		if(filteredElement.getAttribute("value") == arr) {
	    		  document.querySelector('#filterList').removeChild(filteredElement);
	    		}
	    	}
	    }
   	}
   	filter();
  });

$("#skill_category").change(function(){
    // 기술번호 입력 (district단위)
    inputValue = $('#skill_category').val();
    // 기술이름 입력 (district단위)
    inputText = $("#skill_category option:selected").html();

    let startIdx = $("#skill_category option").index($("#skill_category option:selected"));
    
    if($("#skill_category option:selected").val() == 0) {
      return;
    }
    
    let current = document.querySelectorAll("#filterList .selectSkill");
    
    for(let item of current) {
    	if($(item).text() == $("#skill_category option:selected").text()) {
    		return;
    	}
    }
    
    if(current.length) {
    } 
    
    let item = $("#skill_category option:selected").text();
    $("#filterField #filterList").append(
      `<span style="cursor:pointer; margin:2px;" value=` + inputValue + ` class="selectSkill badge badge-pill badge-secondary">` + item + `</span>`
    );
    filter();
  });

$("#filterField").on("click", "#filterList .badge", function(){
	  $(this).remove();
	  filter();
});

$("#orderCount").change(function(){
	filter();
});

function selectedCity(el, value, label) {
	<%-----city로 작업할경우 코드 들어갈 곳 도시번호------%>  
	  //console.log(value, label)
	<%-----city로 작업할경우 코드 들어갈 곳 도시번호------%>
	}

	function selectedDistrict(el, value, label) {
	<%-----district로 작업할경우 코드 들어갈 곳 도시번호------%>
	  
	  //console.log(value, label)
	<%-----district로 작업할경우 코드 들어갈 곳 도시번호------%>
	}

	  function selectedField(el, value, label) {
	      <%-----Field로 작업할경우 코드 들어갈 곳 ------%>  
	        //console.log(value, label)
	      <%-----Field로 작업할경우 코드 들어갈 곳 ------%>
	      }

	  function selectedSkill(el, value, label) {
	  <%-----Skill로 작업할경우 코드 들어갈 곳------%>
	    
	    //console.log(value, label)
	  <%-----Skill로 작업할경우 코드 들어갈 곳------%>
	  }
	$.SOW.core.ajax_select.init('#city_category');
	$.SOW.core.ajax_select.init('#district_category');
	 $.SOW.core.ajax_select.init('#field_category');
	  $.SOW.core.ajax_select.init('#skill_category');
</script>