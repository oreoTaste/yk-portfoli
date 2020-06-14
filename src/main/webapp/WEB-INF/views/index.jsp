<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
  errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Portfoli</title>
<meta name="description" content="...">

<meta name="viewport"
  content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>

<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
<link rel="dns-prefetch" href="https://fonts.gstatic.com/">
<link rel="preconnect" href="https://fonts.googleapis.com/">
<link rel="preconnect" href="https://fonts.gstatic.com/">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preload"
  href="${pageContext.request.getContextPath()}/resources/assets/fonts/flaticon/Flaticon.woff2"
  as="font" type="font/woff2" crossorigin>

<link rel="stylesheet"
  href="${pageContext.request.getContextPath()}/resources/assets/css/core.min.css">
<link rel="stylesheet"
  href="${pageContext.request.getContextPath()}/resources/assets/css/vendor_bundle.min.css">
<link rel="stylesheet"
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

<!-- favicon -->
<link rel="shortcut icon"
  href="${pageContext.request.getContextPath()}/favicon.ico">
<link rel="apple-touch-icon"
  href="${pageContext.request.getContextPath()}/resources/demo.files/logo/icon_512x512.png">
<link rel="manifest"
  href="${pageContext.request.getContextPath()}/resources/assets/images/manifest/manifest.json">

<link rel="stylesheet"
  href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<meta name="theme-color" content="#377dff">

</head>

<body class="header-over header-sticky">
  <div id="wrapper">

    <!-- HEADER -->
    <header id="header" class="shadow-xs z-index-1000">

      <div class="container position-relative">
        <nav
          class="navbar navbar-expand-lg navbar-light justify-content-lg-between justify-content-md-inherit">

          <div class="align-items-start">

            <a class="navbar-brand" href="/portfoli"> <img
              src="${pageContext.request.getContextPath()}/resources/assets/images/logo/logo.png"
              width="150" height="20" alt="..."> <img
              src="${pageContext.request.getContextPath()}/resources/assets/images/logo/logo2.png"
              width="150" height="20" alt="...">
            </a>

          </div>
          <!-- Menu -->
          <div class="collapse navbar-collapse justify-content-end"
            id="navbarMainNav">

            <!-- NAVIGATION -->
            <ul class="navbar-nav fs--14">
              <!-- Menu -->

              <!-- documentation -->
              <c:if test="${loginUser.type=='1' or loginUser.type == null}">
                <li class="nav-item"><a
                  href="/portfoli/app/portfolio/listWithBanner" id="portfolio"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;"> <span
                    style="font-size: 1.1rem;">포트폴리오</span></a></li>
                <li class="nav-item"><a
                  href="/portfoli/app/jobposting/list" id="info"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;"> <span
                    style="font-size: 1.1rem;">채용정보</span></a></li>
                <li class="nav-item"><a
                  href="/portfoli/app/recommendEmployer/list" id="recommendInfo"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;"> <span
                    style="font-size: 1.1rem;">추천채용정보</span></a></li>
                <li class="nav-item"><a href="/portfoli/app/rank/list "
                  id="ranking"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;"> <span
                    style="font-size: 1.1rem;">랭킹</span></a></li>
              </c:if>

              <c:if test="${loginUser.type=='2'}">
                <li class="nav-item"><a
                  href="/portfoli/app/portfolio/listWithBanner" id="portfolio"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;"> <span
                    style="font-size: 1.1rem;">포트폴리오</span></a></li>
                <li class="nav-item"><a
                  href="/portfoli/app/jobposting/list" id="info"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;"> <span
                    style="font-size: 1.1rem;">채용정보</span></a></li>
                <li class="nav-item"><a
                  href="/portfoli/app/recommendEmployee/recommend"
                  id="recommendInfoForCom"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;"> <span
                    style="font-size: 1.1rem;">인재추천정보</span></a></li>
                <li class="nav-item"><a href="/portfoli/app/rank/list"
                  id="ranking"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;"> <span
                    style="font-size: 1.1rem;">랭킹</span></a></li>
              </c:if>
              <!-- /NAVIGATION -->

              <!-- 로그인 전 -->
              <c:if test="${empty loginUser}">
                <li class="nav-item"><a class="nav-link text-secondary"
                  href="/portfoli/app/member/generalJoin"
                  style="text-decoration: none; font-size: 1.1rem;">회원가입</a></li>

                <li
                  class="list-inline-item ml--6 mr--6 float-start d-none d-lg-inline-block">
                  <a target="_blank" href="/portfoli/app/auth/loginForm"
                  class="nav-link text-secondary" style="font-size: 1.1rem;">로그인</a>
                </li>
              </c:if>

              <!-- 일반 회원 로그인 후 -->
              <c:if test="${loginUser.type == '1'}">

                <li class="list-inline-item ml--6 mr--6 dropdown"><a
                  href="#" id="dropdownMessageOptions"
                  class="btn btn-sm rounded-circle btn-light dropdown-toggle mt-3"
                  data-toggle="dropdown" aria-expanded="false"
                  aria-haspopup="true"> <!-- badge --> <span
                    class="badge badge-danger shadow-danger-md animate-pulse fs--10 p--3 mt--n3 position-absolute end-0"
                    id="count"></span> <span class="group-icon"> <i
                      class="fi fi-envelope-2"></i> <i class="fi fi-close"></i>
                  </span>
                </a>

                  <div aria-labelledby="dropdownMessageOptions"
                    class="dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                    <div class="dropdown-divider"></div>
                    <div class="max-h-75vh">
                      <c:forEach items="${inbox}" var="recentMessage">
                        <a
                          href="/portfoli/app/message/inboxModal?number=${recentMessage.number}"
                          class="js-ajax-modal clearfix dropdown-item font-weight-medium px-3 border-bottom border-light overflow-hidden shadow-md-hover bg-theme-color-light"
                          data-href="/portfoli/app/message/inboxModal?number=${recentMessage.number}"
                          data-ajax-modal-size="modal-md"
                          data-ajax-modal-centered="true" data-ajax-modal-backdrop="">
                          <span
                          class="badge badge-soft badge-warning float-end font-weight-normal mt-1"
                          <c:if test="${not empty recentMessage.receiveDate}"> style="visibility:hidden;"</c:if>>new</span>

                          <!-- image --> <c:choose>
                            <c:when test="${empty recentMessage.member.photoFilePath}">
                              <div
                                class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                                style="background-image:url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                            </c:when>
                            <c:when
                              test="${not empty recentMessage.member.photoFilePath}">
                              <div
                                class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                                style="background-image:url('${pageContext.request.getContextPath()}/upload/member/${recentMessage.member.photoFilePath}')"></div>
                            </c:when>
                          </c:choose> <!-- sender --> <strong class="d-block text-truncate">${recentMessage.member.id}</strong>
                          <!-- title -->
                          <p class="fs--14 m-0 text-truncate font-weight-normal">
                            ${recentMessage.title}</p> <!-- date --> <small
                          class="d-block fs--11 text-muted"> <fmt:formatDate
                              var="sendDate" value="${recentMessage.sendDate}"
                              pattern="yyyy.MM.dd HH:mm:ss" /> ${sendDate}
                        </small>
                        </a>
                      </c:forEach>

                      <div class="dropdown-divider mb-0"></div>
                      <a href="/portfoli/app/message/inbox"
                        class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
                        <i class="fi fi-arrow-end fs--11"></i> <span
                        class="d-inline-block pl-2 pr-2">받은 쪽지함으로 이동</span>
                      </a>
                    </div>
                  </div></li>

                <li class="list-inline-item dropdown-menu-hover mt-3"><a
                  href="#" id="dropdownAccountOptions"
                  class="btn btn-sm btn-light dropdown-toggle btn-pill pl--12 pr--12"
                  data-toggle="dropdown" aria-expanded="false"
                  aria-haspopup="true"> <span
                    class="badge badge-danger shadow-danger-md animate-pulse fs--10 p--3 mt--n3 position-absolute end-0"
                    id="showAlarm"></span> <span class="group-icon m-0"> <i
                      class="fi w--15 fi-user-male"></i> <i
                      class="fi w--15 fi-close"></i>
                  </span> <span
                    class="fs--14 d-none d-sm-inline-block font-weight-medium">[일반]&nbsp;&nbsp;${loginUser.name}
                  </span>
                </a>

                  <div aria-labelledby="dropdownAccountOptions"
                    class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                    <div class="dropdown-header fs--14 py-4">

                      <!-- profile image -->
                      <c:set var="photo" value="${loginUser.photoFilePath}" />
                      <c:choose>
                        <c:when test="${empty photo}">
                          <div
                            class="w--60 h--60 rounded-circle bg-light bg-cover float-start"
                            style="background-image: url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                        </c:when>
                        <c:when
                          test="${fn:startsWith(photo, 'https://avatars3.githubusercontent.com/')}">
                          <div
                            class="w--60 h--60 rounded-circle bg-cover bg-light float-start"
                            style="background-image:url('${photo}')"></div>
                        </c:when>
                        <c:when test="${not empty photo}">
                          <div
                            class="w--60 h--60 rounded-circle bg-cover bg-light float-start"
                            style="background-image: url('${pageContext.request.getContextPath()}/upload/member/${photo}')"></div>
                        </c:when>
                      </c:choose>
                      <!-- initials - no image -->
                      <!--
                    <div data-initials=${loginUser.name} data-assign-color="true" class="sow-util-initials bg-light rounded h5 w--60 h--60 d-inline-flex justify-content-center align-items-center rounded-circle float-start">
                      <i class="fi fi-circle-spin fi-spin"></i>
                    </div>
                    -->

                      <!-- user detail -->
                      <span class="d-block font-weight-medium text-truncate fs--16"><a
                        href="/portfoli/app/member/generalMypage" class="text-muted">${loginUser.name}</a>
                      </span> <span
                        class="d-block text-muted font-weight-medium text-truncate">${loginUser.email}</span>

                    </div>

                    <div class="dropdown-divider" style="z-index: 200;"></div>

                    <a href="/portfoli/app/member/generalMypage"
                      class="dropdown-item text-truncate font-weight-medium">
                      마이페이지 <small class="d-block text-muted">profile,
                        password and more...</small>
                    </a> <a href="/portfoli/app/portfolio/mylist"
                      class="dropdown-item text-truncate font-weight-medium"> 내
                      포트폴리오 <small class="d-block text-muted">my portfolio</small>
                    </a> <a href="/portfoli/app/calendar/calendar"
                      class="dropdown-item text-truncate font-weight-medium"> <span
                      id="alarm"
                      class="badge badge-success float-end font-weight-normal mt-1"></span>
                      일정 <small class="d-block text-muted">calendar</small>
                    </a>

                    <div class="dropdown-divider mb-0"></div>

                    <a href="/portfoli/app/auth/logout"
                      class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
                      <i class="fi fi-power float-start"></i> Log Out
                    </a>
                  </div>
          </div>
          </li>
          </c:if>

          <!-- 기업 회원 로그인 후 -->

          <c:if test="${loginUser.type == '2'}">
            <li class="list-inline-item ml--6 mr--6 dropdown mt-3"><a
              href="#" id="dropdownMessageOptions"
              class="btn btn-sm rounded-circle btn-light dropdown-toggle"
              data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">

                <!-- badge --> <span
                class="badge badge-danger shadow-danger-md animate-pulse fs--10 p--3 mt--n3 position-absolute end-0"
                id="count"></span> <span class="group-icon"> <i
                  class="fi fi-envelope-2"></i> <i class="fi fi-close"></i>
              </span>
            </a>

              <div aria-labelledby="dropdownMessageOptions"
                class="dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                <div class="dropdown-divider"></div>
                <div class="max-h-75vh">
                  <c:forEach items="${inbox}" var="recentMessage">
                    <a
                      href="/portfoli/app/message/inboxModal?number=${recentMessage.number}"
                      class="js-ajax-modal clearfix dropdown-item font-weight-medium px-3 border-bottom border-light overflow-hidden shadow-md-hover bg-theme-color-light"
                      data-href="/portfoli/app/message/inboxModal?number=${recentMessage.number}"
                      data-ajax-modal-size="modal-md"
                      data-ajax-modal-centered="true" data-ajax-modal-backdrop="">
                      <span
                      class="badge badge-soft badge-warning float-end font-weight-normal mt-1"
                      <c:if test="${not empty recentMessage.receiveDate}"> style="visibility:hidden;"</c:if>>new</span>

                      <!-- image --> <c:choose>
                        <c:when test="${empty recentMessage.member.photoFilePath}">
                          <div
                            class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                            style="background-image:url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                        </c:when>
                        <c:when
                          test="${not empty recentMessage.member.photoFilePath}">
                          <div
                            class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                            style="background-image:url('${pageContext.request.getContextPath()}/upload/member/${recentMessage.member.photoFilePath}')"></div>
                        </c:when>
                      </c:choose> <!-- sender --> <strong class="d-block text-truncate">${recentMessage.member.id}</strong>
                      <!-- title -->
                      <p class="fs--14 m-0 text-truncate font-weight-normal">
                        ${recentMessage.title}</p> <!-- date --> <small
                      class="d-block fs--11 text-muted"> <fmt:formatDate
                          var="sendDate" value="${recentMessage.sendDate}"
                          pattern="yyyy.MM.dd HH:mm:ss" /> ${sendDate}
                    </small>
                    </a>
                  </c:forEach>

                  <div class="dropdown-divider mb-0"></div>
                  <a href="/portfoli/app/message/inbox"
                    class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
                    <i class="fi fi-arrow-end fs--11"></i> <span
                    class="d-inline-block pl-2 pr-2">받은 쪽지함으로 이동</span>
                  </a>
                </div>
                <li
                  class="list-inline-item ml--6 mr--6 dropdown-menu-hover mt-3"><a
                  href="#" id="dropdownAccountOptions"
                  class="btn btn-sm btn-light dropdown-toggle btn-pill pl--12 pr--12"
                  data-toggle="dropdown" aria-expanded="false"
                  aria-haspopup="true"> <span class="group-icon m-0">
                      <i class="fi w--15 fi-user-male"></i> <i
                      class="fi w--15 fi-close"></i>
                  </span> <span
                    class="fs--14 d-none d-sm-inline-block font-weight-medium">[기업]&nbsp;&nbsp;${loginUser.name}</span>
                </a>


                  <div aria-labelledby="dropdownAccountOptions"
                    class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                    <div class="dropdown-header fs--14 py-4">

                      <!-- profile image -->
                      <div
                        class="w--60 h--60 rounded-circle bg-light bg-cover float-start"
                        <c:if test="${empty loginUser.photoFilePath}">
                        style="background-image: url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                        </c:if>
                        <c:if test="${not empty loginUser.photoFilePath}">
                        style="background-image: url('${pageContext.request.getContextPath()}/upload/member/${loginUser.photoFilePath}')"></div>
                        </c:if>
                        <!-- initials - no image -->
                        <!--
                    <div data-initials="John Doe" data-assign-color="true" class="sow-util-initials bg-light rounded h5 w--60 h--60 d-inline-flex justify-content-center align-items-center rounded-circle float-start">
                      <i class="fi fi-circle-spin fi-spin"></i>
                    </div>
                    -->
                        <!-- user detail -->
                        <span
                          class="d-block font-weight-medium text-truncate fs--16"><a
                          href="/portfoli/app/member/companyMypage"
                          class="text-muted">${loginUser.name}</a></span> <span
                          class="d-block text-muted font-weight-medium text-truncate">${loginUser.email}</span>
                      </div>

                      <div class="dropdown-divider"></div>

                      <a href="/portfoli/app/member/companyMypage"
                        class="dropdown-item text-truncate font-weight-medium">
                        마이페이지 <small class="d-block text-muted">profile,
                          password and more...</small>
                      </a> <a href="/portfoli/app/jobposting/mylist" target="_blank"
                        class="dropdown-item text-truncate font-weight-medium">
                        채용 공고 관리 <small class="d-block text-muted">job
                          posting management</small>
                      </a> <a href="/portfoli/app/payment/introduction"
                        class="dropdown-item text-truncate font-weight-medium">
                        채용 상품 안내 <small class="d-block text-muted">recruitment
                          product information</small>
                      </a>

                      <div class="dropdown-divider mb-0"></div>
                      <a href="/portfoli/app/auth/logout"
                        class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
                        <i class="fi fi-power float-start"></i> Log Out
                      </a>
                    </div></li>
          </c:if>
          </ul>
      </div>

      </nav>
  </div>
  <!-- /NAVBAR -->

  </header>
  <!-- /HEADER -->

  <section
    class="sow-util-slideshow d-middle justify-content-start overlay-dark overlay-opacity-4 z-index: 1;"
    data-sow-slideshow-interval="4000"
    data-sow-slideshow-fade-delay="5000"
    data-sow-slideshow="${pageContext.request.getContextPath()}/resources/assets/images/best_sigak_portfolio.jpg,
        ${pageContext.request.getContextPath()}/resources/assets/images/best_front_portfolio.jpg,
        ${pageContext.request.getContextPath()}/resources/assets/images/best_video_portfolio.jpg">
    <div class="container">

      <div
        class="text-center-md text-center-xs d-middle justify-content-start">

        <div class="text-white py-7" data-aos="fade-in" data-aos-delay="0"
          data-aos-offset="0">

          <!-- main title -->
          <h1 class="h1-xs display-4 mb-0 font-weight-medium">
            2020년 6월<span class="text-brown-200">Best Portfolio</span>
          </h1>

          <!-- slogan -->
          <p class="h2 h5-xs font-weight-normal mb-0 text-brown-100">
            Svelte application</p>
          <small>by Joanna Kosinska</small>

        </div>

      </div>
    </div>
  </section>
  <!-- COUNTER -->
  <section class="pt-5 pb-0 mt-1">
    <div class="container">
      <div class="row col-border text-center text-blue-gray-800">
        <div class="col-6 col-md-3 mb-5">
          <div class="h1">
            <span data-toggle="count" data-count-from="0"
              data-count-to="${memberCount}" data-count-duration="2500"
              data-count-decimals="0">0</span>
          </div>
          <h3 class="h6 m-0">회원수</h3>
        </div>

        <div class="col-6 col-md-3 mb-5">
          <div class="h1">
            <span data-toggle="count" data-count-from="0"
              data-count-to="${portfolioCount}" data-count-duration="2500"
              data-count-decimals="0">0</span>
          </div>
          <h3 class="h6 m-0">이달의 포트폴리오</h3>
        </div>

        <div class="col-6 col-md-3 mb-5">
          <div class="h1">
            <span data-toggle="count" data-count-from="0"
              data-count-to="${sumViewCount}" data-count-duration="2500"
              data-count-decimals="0">0</span>
          </div>
          <h3 class="h6 m-0">포트폴리오 총 조회수</h3>
        </div>

        <div class="col-6 col-md-3 mb-5">
          <div class="h1">
            <span data-toggle="count" data-count-from="0"
              data-count-to="${jobPostingCount}" data-count-duration="2500"
              data-count-decimals="0">0</span>
          </div>
          <h3 class="h6 m-0">진행중인 공고</h3>
        </div>

      </div>
    </div>
  </section>
  <!-- /COUNTER -->

  <div class="container">
    <div class="font-weight-bold fs--25 pl-3 mt-3 mb-3"
      style="color: #37474F;">
      지금 <span class="typed" data-typed-source="#typed_id"
        data-typed-speed-forward="40" data-typed-speed-back="80"
        data-typed-back-delay="700" data-typed-loop-times="infinite"
        data-typed-smart-backspace="true" data-typed-shuffle="false"
        data-typed-cursor="|"></span>
      <div id="typed_id">
        <p>접수 가능합니다!</p>
      </div>
    </div>
  </div>

  <div
    class="swiper-container swiper-preloader swiper-btn-group swiper-btn-group-end text-white h--220"
    style="width: 1160px;"
    data-swiper='{
    "slidesPerView": 1,
    "spaceBetween": 0,
    "autoplay": false,
    "loop": true,
    "pagination": { "type": "bullets" }
  }'>


    <c:if test="${not empty bannerList}">
      <div class="swiper-wrapper">
        <c:forEach items="${bannerList}" var="banner">
          <div onclick="location.href='${banner.url}';"
            class="swiper-slide d-middle bg-white overlay-dark overlay-opacity-1 bg-cover"
            style="background:url('${pageContext.servletContext.contextPath}/upload/banner/${banner.filePath}')"></div>
        </c:forEach>
      </div>
    </c:if>
    <c:if test="${empty bannerList}">
      <div class="swiper-wrapper">
        <div onclick="location.href='/portfoli';"
          class="swiper-slide d-middle bg-white overlay-dark overlay-opacity-1 bg-cover"
          style="background:url('${pageContext.servletContext.contextPath}/resources/assets/images/defaultbanner.png')"></div>
      </div>
    </c:if>

    <div class="swiper-button-next swiper-button-white"></div>
    <div class="swiper-button-prev swiper-button-white"></div>

    <div class="swiper-pagination"></div>
  </div>

  <!-- footer -->
  <footer id="footer" class="footer-light position-relative">
    <div class="container">

      <div class="row">

        <div class="col-12 col-md-6 col-lg-4 text-center-xs p-0 py-5 px-3">

          <!-- logo -->
          <span class="d-inline-flex align-items-center"> <img
            src="${pageContext.request.getContextPath()}/resources/assets/images/logo/logo.png"
            width="70" height="32" alt="...">
          </span>

          <p class="lead" style="font-size: medium;">
            대표자: 1d2f<br> 주소: 서울특별시 서초구 서초동 서초대로74길 33<br> 사업자 등록번호:
            123-45-678910<br> 개인정보보호 책임자: 1d2f
          </p>

          <div class="mt-4">
            <a href="#!"
              class="btn btn-sm btn-facebook transition-hover-top mb-2 rounded-circle"
              rel="noopener" aria-label="facebook page"> <i
              class="fi fi-social-facebook"></i>
            </a> <a href="#!"
              class="btn btn-sm btn-twitter transition-hover-top mb-2 rounded-circle"
              rel="noopener" aria-label="twitter page"> <i
              class="fi fi-social-twitter"></i>
            </a> <a href="#!"
              class="btn btn-sm btn-linkedin transition-hover-top mb-2 rounded-circle"
              rel="noopener" aria-label="linkedin page"> <i
              class="fi fi-social-linkedin"></i>
            </a> <a href="#!"
              class="btn btn-sm btn-youtube transition-hover-top mb-2 rounded-circle"
              rel="noopener" aria-label="youtube page"> <i
              class="fi fi-social-youtube"></i>
            </a>
          </div>
        </div>

        <div class="col-12 col-md-6 col-lg-5 py-5 text-center-xs">
          <h4 class="h5">Support</h4>
          <div class="row">
            <div class="col-12 col-lg-6">
              <ul class="mt-4 mb-0 list-unstyled p-0 block-xs">
                <li><a href="contact-1.html">Contact</a></li>
                <li><a href="about-us-1.html">About Us</a></li>
                <li><a href="page-terms-and-conditions.html">이용약관</a></li>
              </ul>
            </div>

            <div class="col-12 col-lg-6">

              <ul class="mt-4 mb-0 list-unstyled p-0 block-xs">
                <li><a href="/portfoli/app/faq/list">FAQ</a></li>
                <li><a href="/portfoli/app/qna/list">QNA</a></li>
                <li><a href="/portfoli/app/notice/list">고객센터</a></li>
              </ul>

            </div>
          </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3 py-5 text-center-xs">
          <h4 class="h5">Contact</h4>
          <div class="mt-4">
            <ul class="list-unstyled m-0">
              <li class="list-item py-2"><a href="tel:+01-555-5555"
                class="clearfix py-1 h3 mb-0 d-inline-block font-weight-medium text-info">
                  <i class="float-start fi fi-phone h4"></i> 1577-1677
              </a></li>

              <li class="list-item py-2">
                <a href="mailto:info@mycomany.com"
                class="clearfix py-1 h5 d-inline-block font-weight-medium text-warning">
                  <i class="float-start fi fi-envelope h4 mt--n5"></i>
                  portfoli@portfoli.com </a>
              </li>
            </ul>
          </div>
        </div>


      </div>

    </div>

    <div class="bg-distinct py-3 clearfix">

      <div class="container clearfix font-weight-light text-center-xs">

        <div class="fs--14 py-2 float-start float-none-xs m-0-xs">
          &copy; Portfoli Inc.</div>

        <ul class="list-inline mb-0 mt-2 float-end float-none-xs m-0-xs">
          <li class="list-inline-item m-0"><img width="38" height="24"
            class="lazy"
            data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/visa.svg"
            src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
            alt="visa credit card icon"></li>

          <li class="list-inline-item m-0"><img width="38" height="24"
            class="lazy"
            data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/mastercard.svg"
            src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
            alt="mastercard credit card icon"></li>

          <li class="list-inline-item m-0"><img width="38" height="24"
            class="lazy"
            data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/discover.svg"
            src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
            alt="discover credit card icon"></li>

          <li class="list-inline-item m-0"><img width="38" height="24"
            class="lazy"
            data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/amazon.svg"
            src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
            alt="amazon credit card icon"></li>

          <li class="list-inline-item m-0"><img width="38" height="24"
            class="lazy"
            data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/paypal.svg"
            src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
            alt="paypal credit card icon"></li>

          <li class="list-inline-item m-0"><img width="38" height="24"
            class="lazy"
            data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/skrill.svg"
            src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
            alt="skrill credit card icon"></li>

          <!-- more vendors on assets/images/credit_card/ -->

        </ul>

      </div>
    </div>

  </footer>
  <!-- /Footer -->


  </div>
  <!-- /#wrapper -->

  <script src="${pageContext.request.getContextPath()}/resources/assets/js/core.min.js"></script>
  <script>
// 오늘 스케쥴 개수만큼 마이페이지 우측상단에 표기
function checkSchedule() {
    console.log('trying socket connection2');
    var wsUri2 = "ws://" + window.location.host
        + "/portfoli/app/calendar/alert";
    if (wsUri2 == "ws://localhost:9999/portfoli/app/calendar/alert") {
      websocket2 = new WebSocket(wsUri2);
    } else {
      wsUri2 = "ws://121.132.195.172:8080/portfoli/app/calendar/alert";
      websocket2 = new WebSocket(wsUri2);
    }
    websocket2.onopen = function(evt2) {
      console.log('connection opened2');
      onOpen(websocket2, evt2);
    };
    websocket2.onmessage = function(evt2) {
      console.log("received message2 : " + evt2.data);
      onMessage2(evt2);
    };
    websocket2.onerror = function(evt2) {
      console.log('error2 : ' + err);
      onError(websocket2, evt2);
    };
    websocket2.onclose = function(evt2) {
      console.log("WebSocket is closed now2");
    };
}

// 받은 쪽지 개수만큼 쪽지 우측상단에 표기
function sendMessage() {
  console.log('trying socket connection');
  var wsUri = "ws://" + window.location.host
      + "/portfoli/app/message/alert";
  if (wsUri == "ws://localhost:9999/portfoli/app/message/alert") {
    websocket = new WebSocket(wsUri);
  } else {
    wsUri = "ws://121.132.195.172:8080/portfoli/app/message/alert";
    websocket = new WebSocket(wsUri);
  }
  websocket.onopen = function(evt) {
    console.log('connection opened');
    onOpen(websocket, evt);
  };
  websocket.onmessage = function(evt) {
    console.log("received message : " + evt.data);
    onMessage(evt);
  };
  websocket.onerror = function(evt) {
    console.log('error : ' + err);
    onError(websocket, evt);
  };
  websocket.onclose = function(evt) {
    console.log("WebSocket is closed now.");
  };
}
function onOpen(websocket, evt) {
  console.log("send 처리함");
  websocket.send("${loginUser.number}");
}
function onMessage(evt) {
    $('#count').append(evt.data);
}
function onMessage2(evt) {
    $('#showAlarm').append(evt.data);
    $('#alarm').append(evt.data + " new");
}
function onError(evt) {
}
$(document).ready(function() {
  sendMessage();
  checkSchedule();
});
</script>
</body>
</html>