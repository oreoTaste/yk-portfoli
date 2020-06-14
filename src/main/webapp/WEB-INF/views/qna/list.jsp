<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">
	<div class="row">
		<!--------------------------------------- nav bar ----------------------------------------------->

		<div class="col-lg-3 mb-5 h--600 border-right ml--20 mr-5 mt--20">
			<!-- CATEGORIES -->
			<nav class="nav-deep nav-deep-light mb-2">
				<!-- mobile only -->
				<button
					class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
					data-target="#nav_responsive"
					data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
					<span class="group-icon px-2 py-2 float-start"> <i
						class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
					</span> <span class="h5 py-2 m-0 float-start"> Customer Center </span>
				</button>

				<!-- desktop only -->
				<h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3">Customer
					Center</h3>
				<!-- navigation -->
				<ul id="nav_responsive"
					class="nav flex-column d-none d-lg-block font-weight-bold">

					<li class="nav-item mb-2"><a class="nav-link"
						href="/portfoli/app/notice/list"> <span
							class="px-2 d-inline-block"> 공지사항 </span>
					</a></li>

					<li class="nav-item mb-2"><a class="nav-link"
						href="/portfoli/app/faq/list"> <span
							class="px-2 d-inline-block"> FAQ </span>
					</a></li>

					<li class="nav-item active mb-2"><a class="nav-link"
						href="/portfoli/app/qna/list"> <span
							class="px-2 d-inline-block"> Q&A </span>
					</a></li>

					<li class="nav-item mb-2"><a class="nav-link"
						href="/portfoli/app/report/list"> <span
							class="px-2 d-inline-block"> 신고 </span>
					</a></li>

				</ul>
			</nav>
			<!-- /CATEGORIES -->
		</div>

		<!--------------------------------------------- /nav bar ------------------------------------------------>

		<!-------------------------------------------- contents -------------------------------------------------->
		<div class="portlet mt--20" style="width: 60%;box-shadow: none;">

			<div class="portlet-header">
				<h1 class="d-none d-lg-block m--3 myfont myfont-lg">Q&A</h1>
				<c:if test="${!empty sessionScope.loginUser.number}">
				<div align="right">
					<a href="/portfoli/app/qna/add"><button type="button"
							class="btn btn-outline-secondary btn-pill btn-sm">글쓰기(+)</button></a>
				</div>
				</c:if>
			</div>

			<div class="table-responsive rounded" style="min-height: 500px;">
				<table class="table m-0">
					<thead style="font-size: large">
						<tr>
							<th class="b-0 w--200">카테고리</th>
							<th class="b-0">제목</th>
							<th class="b-0 w--100">작성자</th>
							<th class="b-0 w--150">등록일</th>
							<th class="b-0 w--100">조회수</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${qnas}" var="qna">
							<tr>
								<td>${qna.category.name}</td>
									<td><a href="/portfoli/app/qna/detail?no=${qna.number}" class="text-gray-900">${qna.title}
								<c:if test="${!empty qna.answerDate}">
									<small>(답변완료)</small>
								</c:if>
								<c:if test="${qna.readable == 0}">
									<i class="fa fa-lock ml-3"></i>
								</c:if>
								</td>
								<td>${qna.writer}</td>
								<td>${qna.registeredDate}</td>
								<td>${qna.viewCount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<div class="col-12 col-xl-7">
				<nav aria-label="pagination">
					<ul
						class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

						<c:if test="${page != startPage}">
							<li
								<c:if test="${pageNumber <= pageSize}"> class="page-item disabled btn-pill"</c:if>
								<c:if test="${pageNumber != '1'}"> class="page-item"</c:if>
								data-page="prev"><a class="page-link"
								href="/portfoli/app/qna/list?pageNumber=${startPage - 1}"
								tabindex="-1" aria-disabled="true">Prev</a></li>
						</c:if>

						<c:forEach begin="${startPage}" end="${endPage}" var="page">
							<li
								<c:if test="${page == pageNumber}"> class="page-item active"</c:if>
								data-page="${page}"><a class="page-link"
								href="/portfoli/app/qna/list?pageNumber=${page}">${page}</a></li>
						</c:forEach>

						<li
							<c:if test="${endPage == totalPage}"> class="page-item disabled btn-pill"</c:if>
							<c:if test="${endPage < totalPage}"> class="page-item"</c:if>
							data-page="next"><a class="page-link"
							href="/portfoli/app/qna/list?pageNumber=${endPage + 1}">Next</a>
						</li>

					</ul>
				</nav>
			</div>
			<!-------------------------------------------- /contents -------------------------------------------------->
		</div>
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