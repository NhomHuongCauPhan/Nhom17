<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-individual"/>
<c:url var="WebURL" value="/trang-chu"/>
<c:url var="Adminurl" value="/quan-tri/pha-do"/>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý phả đồ - Gia phả Việt Nam</title>
</head>
<body>
	

			<!-- content -->
			<div class="page_title" style="margin-bottom: 15px">
				<h2 style="padding-right: 860px">Phả Đồ</h2>
				<select>
					<option value="0">Từ đời 1</option>
					<%
						int doi;
						if(request.getAttribute("prlife")!=null){
							doi = (int) request.getAttribute("prlife");
						}else{
							doi=0;
						}
					%>
				</select> <select id="life">
					<option value="0">Đến đời</option>
					<%
						for (int i = 1; i <= doi; i++) {
							out.print("<option value=" + i + ">" + i + "</option>");
						}
					%>
				</select>
				<div class="toolbox">
					<a href="javascript:loadPhaHe()" id="btn_save" class="ubtn save">Hiển
						thị</a>
				</div>
			</div>
			<div class="ucp_def_right" id="gp_phahe">
				${FamilyTree}
			</div>

	<script type="text/javascript">
		$(document).ready(function() {
			
		});

		
		function del(id, name) {
			var mess = "Bạn có thực sự muốn xóa "+name+" khỏi dòng họ!";
			if (window.confirm(mess)) {
				var data = {
						individualId:id,
						fullName :"",
						gender:1,
						dateOfBirth: "1300-1-1",
						dateOfDeath:"1300-1-1" ,
						father:1,
						branch:"" ,
						parentageId:1, 
						avatar:"" 
					};
				
				if(id!=null){
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
							alert(name+" vẫn còn hậu duệ!");
						}
					});
				}
			}
		}
		function openedit(id) {
			window.location.href = "<c:url value='/quan-tri/sua-gia-pha?id="+id+"'/>";
		}
		function logout() {
			var mess = "Bạn có thực sự muốn đăng xuất khỏi hệ thống";
			if (window.confirm(mess)) {
				window.location.href = "<c:url value='trang-chu?action=logout'/>";
			}
		}
	</script>
</body>
</html>