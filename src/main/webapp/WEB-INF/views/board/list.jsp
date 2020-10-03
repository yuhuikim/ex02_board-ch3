<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Tables</h1>
	<p class="mb-4">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>.
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<span class="m-0 font-weight-bold text-primary">DataTables
				Example</span>
			<button id="regBtn" type="button"
				class="btn btn-primary btn-sm float-right">Register New
				Board</button>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.bno}" /></td>
								<%-- <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td> --%>

								<td><a class='move' href='<c:out value="${board.bno}"/>'>
										<c:out value="${board.title}" />
								</a></td>

								<td><c:out value="${board.writer}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.regdate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.updateDate}" /></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

			<div>
				<form id="searchForm"
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group mb-3 float-right">

						<select class="form-control" name='type'>
							<option value="">-----</option>
							<option value="T">제목</option>
							<option value="C">내용</option>
							<option value="W">작성자</option>
							<option value="TC">제목 or 내용</option>
							<option value="TW">제목 or 작성자</option>
							<option value="TWC">제목 or 내용 or 작성자</option>
						</select> <input type="text" class="form-control" name="keyword"> <input
							type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
						<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>

						<button class='btn btn-primary'>Search</button>
					</div>
				</form>
			</div>

			<!--  start Pagination -->
			<div class='float-right'>
				<ul class="pagination">

					<c:if test="${pageMaker.prev}">
						<li class="page-item"><a class="page-link"
							href="${pageMaker.startPage -1}">Previous</a></li>
					</c:if>



					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="page-item  ${pageMaker.cri.pageNum == num ? "active":""} "><a
							class="page-link" href="${num}">${num}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="page-item "><a class="page-link"
							href="${pageMaker.endPage +1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
			
			<!--  end Pagination -->
			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
				<input type='hidden' name='type' value='${pageMaker.cri.type}'>
			</form>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<div class="modal" id="myModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>작업이 완료되었습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {
							self.location = "/board/register";
						});

						var actionForm = $("#actionForm");

						$(".page-item a").on(
								"click",
								function(e) {

									e.preventDefault();

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));

									actionForm.submit();

								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");

											console.log(actionForm);
											actionForm.submit();
										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");

									e.preventDefault();

									searchForm.submit();

								});

						var searchType = '<c:out value="${pageMaker.cri.type}"/>';
						var keyword = '<c:out value="${pageMaker.cri.keyword}"/>';

						$('select option[value="' + searchType + '"]').attr(
								'selected', 'selected');
						$("input[name='keyword']").val(keyword);

					});
</script>


<%@include file="../includes/footer.jsp"%>