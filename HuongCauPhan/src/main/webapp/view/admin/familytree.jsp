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
			</div>
			<div class="ucp_def_right" id="gp_phahe" style="background:#eeee; width:45%; float:left">
				${FamilyTree}
			</div>
			<div class="ucp_def_right" id="gp_phahe" style="background:#dddd; width:42%;float:left">
				<div class="container-fluid">
					<div class="row" style="padding-bottom:20px;">
						<div class="col-md-offset-4 col-md-3">Đời</div>
						<div class="col-md-4">
							<select id="cbxAge" style="width:130px; background:#dddd ; height:30px !important">
								<%
									int doi;
									if(request.getAttribute("prlife")!=null){
										doi = (int) request.getAttribute("prlife");
									}else{
										doi=0;
									}
									
									for (int i = 1; i <= doi; i++) {
										out.print("<option value=" + i + ">" + i + "</option>");
									}
								%>
							</select>
						</div>
						<div class="col-md-offset-2 col-md-3">
							<div class="toolbox" style="cursor: pointer;">
								<a id="btn_load" class="ubtn save" style="background:#007bff;color:white">Hiển thị</a>
							</div>
						</div>
					</div>
					<div class="row" style="padding-bottom:20px;">
						<div class="col-md-offset-4 col-md-3">Giới tính</div>
						<div class="col-md-4">
							<input type="radio" name="gender" value="1" />Nam
							<input type="radio" name="gender" value="0" />Nữ
						</div>
					</div>
					<div class="row" style="padding-bottom:20px;">
						<div class="col-md-offset-4 col-md-3">Tên thành viên</div>
						<div class="col-md-4">
							<input type="text" style="background:#ffff; padding:14px 5px;" placeholder="Tên thành viên" />
						</div>
						
					</div>
					
					<div class="row" style="padding-bottom:20px;">
						<div class="col-md-offset-4 col-md-3">Tên thành viên</div>
						<div class="col-md-4">
							<input type="text" style="background:#ffff; padding:14px 5px;" placeholder="Tên bố mẹ" />
						</div>
					</div>	
					
				</div>
								
				
				
				
				
				
			</div>
			

	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		
		$("#btn_load").click(function(){
			var age = $("#cbxAge option:selected").text();
			var gender = $('input[name=gender]:checked').val();

			alert(gender);
		})

		
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
							if(result=="true"){
								window.location.href = "${Adminurl}";
							}else{
								alert(name+" vẫn còn hậu duệ!");
							}
						},
						error: function(error){
							
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