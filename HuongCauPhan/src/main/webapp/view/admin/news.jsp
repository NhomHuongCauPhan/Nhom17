<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-news"/>
<c:url var="WebURL" value="/trang-chu"/>
<c:url var="Adminurl" value="/quan-tri/bai-viet"/>

<!doctype html>
<html>
<head>
<title>Thông tin dòng họ</title>
</head>
<body>

	<!--Content-->
	<div class="ucp_def_right">
		<div class="load_progress"></div>
		<div class="htree" id="htree"></div>
		<div id="float_panel"></div>
		<div class="page_title" style="margin-bottom: 15px">
			<h2>Thông tin dòng họ</h2>
			<div class="toolbox" style="background:#ffff">
				<a id="btn_save" class="ubtn save">Lưu lại</a>
			</div>
		</div>
		<div class="load_progress"></div>
		<table border="0" style="width: 100%; border-collapse: collapse"
			class="ucp_tbl form">
			<tbody>
				<tr>
					<td style="vertical-align: top">Lời giới thiệu</td>
					<td colspan="3"><textarea name="Description" id="Description1"
							style="height: 30px; width: 580px"></textarea>
				</tr>
			</tbody>
		</table>
	</div>


	<script type="text/javascript">
		
		var editor1 = '';
		$(document).ready(function() {
			editor1 = CKEDITOR.replace( 'Description1');
		});
		var parentageid = "<c:out value='${ParentageModel.parentageId}'></c:out>";

		function logout() {
			var mess = "Bạn có thực sự muốn đăng xuất khỏi hệ thống";
			if (window.confirm(mess)) {
				window.location.href = "/home/view?action=logout";
			}
		}
		$("#btn_save").click(function () {
			$("#msg").html('<img src="<c:url value='/template/adimgs/loading1.gif'/>">Đang xử lý');
			var data = {
				newsID : null,
				content : editor1.getData(),
				parentage_id : parentageid,
				create_date : new Date(),
				views : 0
			};
			
			if(parentageid!=null){
				$.ajax({
					url: '${APIurl}',
					type: 'put',
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
				

		});

	</script>
</body>
</html>