<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-news" />
<c:url var="WebURL" value="/trang-chu" />
<c:url var="Adminurl" value="/quan-tri/quan-ly-tin" />

<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
  <script type="text/javascript" src="<c:url value='/template/adjs/jquery.min.3.2.1.js'/>"></script>
	 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>



<title>Thông tin dòng họ</title>
</head>
<body>

	<!--Content-->
	<div class="ucp_def_right">
		<div class="load_progress"></div>
		<div class="htree" id="htree"></div>
		<div id="float_panel"></div>
		<div class="page_title" style="margin-bottom: 15px">
			<h2>Quản Lý tin dòng họ</h2>
			<div class="toolbox" style="background: #ffff">
				<a id="btn_save" class="ubtn save">Lưu lại</a>
			</div>
		</div>
		<div class="load_progress"></div>
		<div class="col-12  my-5">
			<div class="container-fluid">
				<h3 class="font-weight-bold my-3">Quản Lý tin dòng họ</h3>
				<table class="table laptop table-striped table-hover" id="users" style="width: 100%;">
					<thead class="thead-light">
						<tr>
							<th scope="col" class="sticky ">Tiêu đề bài viết</th>
							<th scope="col" class="sticky ">Ngày tạo</th>
							<th scope="col" class="sticky ">Hành Động</th>
						</tr>
					</thead>
					<tbody>
					<tr></tr>
						 <c:forEach var="item" items="${newsParent }">
							<tr>
								<td>${item.title }</td>
								<td>${item.create_date }</td>
								<td><a id="btn_update" class="btn btn-outline-danger" href="sua-tin?newID=${item.newsID }">Sửa</a>
									<a id="btn_delete" onclick="deleteNews(${item.newsID })" class="btn btn-outline-danger">Xóa</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row dark-mode  justify-content-center mt-5">
        <ul class="pagination">
            <c:choose>
                <c:when test="${requestScope.page == 1}">
                    <li class="page-item disabled "><a class="page-link">Trang trước</a></li>
                    </c:when>
                    <c:otherwise>
                    <li class="page-item"><a class="page-link" href="quan-ly-tin?page=${requestScope.page - 1}">Trang trước</a></li>
                    </c:otherwise>
                </c:choose>
                <c:forEach var="page" begin="${requestScope.min}" end="${requestScope.max}" step="1">
                    <c:choose>
                        <c:when test="${requestScope.page == pageScope.page}">
                        <li class="page-item active"><a class="page-link" href="quan-ly-tin?page=${pageScope.page}">${pageScope.page}</a></li>
                        </c:when>
                        <c:otherwise>
                        <li class="page-item "><a class="page-link" href="quan-ly-tin?page=${pageScope.page}">${pageScope.page}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${requestScope.page == requestScope.lastPage}">
                    <li class="page-item disabled "><a class="page-link">Trang sau</a></li>
                    </c:when>
                    <c:otherwise>
                    <li class="page-item"><a class="page-link" href="quan-ly-tin?page=${requestScope.page + 1}">Trang sau</a></li>
                    </c:otherwise>
                </c:choose>         
        </ul>
    </div>
			</div>
		</div>
	</div>
<!-- DataTables -->

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
	<script type="text/javascript">

		var parentageid = "<c:out value='${ParentageModel.parentageId}'></c:out>";

		function logout() {
			var mess = "Bạn có thực sự muốn đăng xuất khỏi hệ thống";
			if (window.confirm(mess)) {
				window.location.href = "/home/view?action=logout";
			}
		}
		function deleteNews(item){
			var data = {
					newsID : item,
					content : null,
					parentage_id : parentageid,
					create_date : null,
					title : $("#titleNews").val(),
					views : 0
				};
			var mess = "Bạn có thực sự muốn xóa tin đã tạo không";
			if (window.confirm(mess)) {
				$.ajax({
					url: '${APIurl}',
					type: 'delete',
					contentType: 'application/json',
					data: JSON.stringify(data),
					dataType: 'json',
					success: function(result){
						window.location.href = "${Adminurl}";
					},
					error: function(error){
						window.location.href = "${Adminurl}?error=updatefailure";
					}
				});
			}
		};
		$("#btn_delete").click(function(){
			var data = {
					newsID : null,
					content : editor1.getData(),
					parentage_id : parentageid,
					create_date : new Date(),
					title : $("#titleNews").val(),
					views : 0
				};
		});
		$("#btn_save").click(function() {
							$("#msg")
									.html(
											'<img src="<c:url value='/template/adimgs/loading1.gif'/>">Đang xử lý');
							var data = {
								newsID : null,
								content : editor1.getData(),
								parentage_id : parentageid,
								create_date : new Date(),
								title : $("#titleNews").val(),
								views : 0
							};

							if (parentageid != null) {
								$
										.ajax({
											url : '${APIurl}',
											type : 'put',
											contentType : 'application/json',
											data : JSON.stringify(data),
											dataType : 'json',
											success : function(result) {
												window.location.href = "${Adminurl}";
											},
											error : function(error) {
												window.location.href = "${Adminurl}?error=updatefailure";
											}
										});
							}

						});
	</script>
</body>
</html>