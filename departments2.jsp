<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="partials/head.jsp" />
<body class="cssjockey-ui ">
<div id="ajax-loading-image" style="display:none;">
    <div class="cj-overlay-content">
        <figure class="cj-image cj-is-128x128">
            <img src="/ATS/images/AjaxLoading.gif"/>
        </figure>
    </div>
</div>
<div id="admin-panel">
	<jsp:include page="partials/left_menu.jsp" />
<div class="admin-content">
    <jsp:include page="partials/header.jsp" />
    <nav class="cj-breadcrumb" aria-label="breadcrumbs"> 
        <ul>
            <li><a href="/ATS/admin/home">Home</a></li>
            <li><a href="/ATS/admin/departments">Departments</a></li>
  			<li class="cj-is-active"><a href="javascript:void(0);" aria-current="page">All Departments</a></li>
        </ul>
        <div class="cj-is-float-right cj-mt-4">
            <div class="cj-buttons">
            	<a href="/ATS/admin/departments/create" class="cj-button cj-is-small cj-is-success">Add New</a>
        		<a href="#" class="cj-button cj-is-small cj-is-warning">View Deleted</a>
            </div>
        </div>
    </nav>
    <div class="admin-content-panel cj-p-15">
          <div class="cj-box">
    <table class="cj-table cj-width-100" id="data-table">
      <thead>
        <tr>
          <th width="40px">ID</th>
          <th>Name</th>
          <th>Registered</th>
          <th width="80px">Action</th>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
        </tr>
      </tfoot>
    </table>
  </div>
    </div>
</div>        
    </div>

<!-- Scripts -->
<script src="/ATS/js/jquery/jquery.js"></script>
<script src="/ATS/js/jquery/moment.js"></script>
<script src="/ATS/js/jquery/jquery-ui.js"></script>
<script src="/ATS/js/jquery/select2.full.min.js"></script>
<script src="/ATS/js/jquery/selectize.js"></script>
<script src="/ATS/js/admin.js" defer></script>

<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$.fn.dataTable.ext.classes.sPageButton = 'cj-pagination-previous';
		var data =eval('${departmentList}');
		
		data.forEach(function(element) {
			var ss = "<a href='/ATS/admin/departments/edit/"+element.id+"' class='fa fa-edit'/>&nbsp;&nbsp;&nbsp;<a href='/ATS/admin/departments/delete/"+element.id+"' class='fa fa-trash'/>";
			//alert(element.action);
			element.action=ss;
		});
		var table = $('#data-table').DataTable( {
			"aaData": data,
			"aoColumns": [
				{ "mData": "id"},
				{ "mData": "name"},
				{ "mData": "created_at"},
				{ "mData": "action"}
			]
		});
	});
	
	/* $(document).ready(function() {
	    $('#data-table').dataTable( {
	        "processing": true,
	        "serverSide": true,
	        "ajax": {
	            "url": "admin/departments-data",
	            "type": "POST"
	        },
	        "columns": [
	            { "data": "id" },
	            { "data": "name" },
	            { "data": "created_at" },
	            { "data": "active" }
	        ]
	    });
	}); */
</script>
</body>
</html>
