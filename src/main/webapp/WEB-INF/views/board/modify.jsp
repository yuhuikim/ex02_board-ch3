<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Board Modify</h1>
	<p class="mb-4"> 
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Board Modify</h6>
		</div>
		<div class="card-body">
		    <form class="user" action="/board/modify" method="post">
		    	<input type='hidden' name='bno' value='<c:out value="${board.bno}"/>'>
		    	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		    	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
		    	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
		    	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
          
                <div class="form-group row">
                  <div class="col-sm-12">
                    <input type="text" class="form-control " name="title" value='<c:out value="${board.title}"/>'>
                  </div>
                </div>
                <div class="form-group">
                  <textarea name="content" rows="5" class="form-control "><c:out value="${board.content}"/></textarea>
                </div>
                <div class="form-group row">
                  <div class="col-sm-12">
                    <input type="text" name="writer" class="form-control " value='<c:out value="${board.writer}"/>'>
                  </div>
                </div>
                <div class="form-group row">
                	<div class="col-sm-12">
                		<button type="button" data-oper="modify" class="btn btn-primary">Modify</button>
                		<button type="button" data-oper="remove" class="btn btn-danger">Remove</button>
						<button type="button" data-oper="list" class="btn btn-secondary">List</button>
					</div>
				</div>
                <hr>
            </form>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<script type="text/javascript">
$(document).ready(function() {
	
	var formObj = $("form");
	
	$("button").on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'remove'){
			
			formObj.attr("action", "/board/remove");
			
		}else if(operation ===  'list'){
			
			formObj.attr("action", "/board/list").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag)
				.append(amountTag)
				.append(keywordTag)
				.append(typeTag);
		}else if(operation  === 'modify'){	
		}
		formObj.submit();
	});
});
</script>

<%@include file="../includes/footer.jsp"%>