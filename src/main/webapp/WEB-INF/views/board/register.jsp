<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Board Register</h1>
	<p class="mb-4"></p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Board Register</h6>
		</div>
		<div class="card-body">
			<form class="user" action="/board/register" method="post">
				<div class="form-group row">
					<div class="col-sm-12">
						<input type="text" class="form-control " name="title"
							placeholder="Title">
					</div>
				</div>
				<div class="form-group">
					<textarea name="content" rows="5" class="form-control "
						placeholder="Content"></textarea>
				</div>
				<div class="form-group row">
					<div class="col-sm-12">
						<input type="text" name="writer" class="form-control "
							placeholder="Writer">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-secondary">Reset</button>
					</div>
				</div>
				<hr>

			</form>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../includes/footer.jsp"%>