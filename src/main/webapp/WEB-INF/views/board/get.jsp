<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Board Read</h1>
	<p class="mb-4"></p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Board Read</h6>
		</div>
		<div class="card-body">

			<div class="form-group row">
				<div class="col-sm-12">
					<div>
						<c:out value="${board.bno}" />
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-12">
					<input type="text" class="form-control " name="title"
						value='<c:out value="${board.title}"/>' readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<textarea name="content" rows="5" class="form-control "
					readonly="readonly"><c:out value="${board.content}" />
	          </textarea>
			</div>
			<div class="form-group row">
				<div class="col-sm-12">
					<input type="text" name="writer" class="form-control "
						value='<c:out value="${board.writer}"/>' readonly="readonly">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-12">
					<button type="button" class="btn btn-secondary btnMod">Modify</button>
					<button type="button" class="btn btn-primary btnList">List</button>
					
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->
	
	<form id='operForm' action="/board/modify" method='get'>
		<input type='hidden' name='bno' value='${board.bno}'>
		<input type='hidden' name='pageNum' value='${cri.pageNum}'>
		<input type='hidden' name='amount' value='${cri.amount}'>
		<input type='hidden' name='keyword' value='${cri.keyword}'>
		<input type='hidden' name='type' value='${cri.type}'>
	</form>
	
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		var operForm = $("#operForm");
		
		$(".btnList").on("click", function(){
			operForm.attr("action","/board/list");
			operForm.submit();
		});
		
		$(".btnMod").on("click", function(){
			operForm.attr("action","/board/modify");
			operForm.submit();
		});
		
		
	});
	
	</script>

	<%@include file="../includes/footer.jsp"%>