<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-news"/>
<c:url var="WebURL" value="/trang-chu"/>
<c:url var="Adminurl" value="/quan-tri/quan-ly-tin"/>

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
			<h2>Viết bài</h2>
			<div class="toolbox" style="background:#ffff">
				<a id="btn_save" class="ubtn save">Lưu lại</a>
			</div>
		</div>
		<div class="load_progress"></div>
		<table border="0" style="width: 100%; border-collapse: collapse"
			class="ucp_tbl form">
			<tbody>
			<tr> 
				<td style="vertical-align: top">Nhập tiêu đề</td>
				<td><input type="text" name="titleNews" id="titleNews" style="width: 700px !important;" value="${onlyOne.title }"></td>
			</tr>
				<tr>
					<td style="vertical-align: top">Nhập nội dung</td>
					<td colspan="3"><textarea name="Description" id="Description1" 
							style="height: 30px; width: 580px" >
							${onlyOne.content }
							</textarea>
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
		
		$("#btn_save").click(function () {
			$("#msg").html('<img src="<c:url value='/template/adimgs/loading1.gif'/>">Đang xử lý');
			var data = {
				newsID : ${onlyOne.newsID },
				content : editor1.getData(),
				parentage_id : parentageid,
				create_date : new Date(),
				title : $("#titleNews").val(),
				views : 0
			};
			
			if(parentageid!=null){
				$.ajax({
					url: '${APIurl}',
					type: 'post',
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