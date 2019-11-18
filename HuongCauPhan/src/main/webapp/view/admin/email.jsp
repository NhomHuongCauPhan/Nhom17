<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-email"/>
<c:url var="WebURL" value="/trang-chu"/>
<c:url var="Adminurl" value="/quan-tri/mail"/>
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
			<h2>Mail</h2>
			<div class="toolbox" style="background:#ffff">
				<a id="btn_send" class="ubtn save">Gửi</a>
			</div>
		</div>
		<div class="load_progress"></div>
		<table border="0" style="width: 100%; border-collapse: collapse"
			class="ucp_tbl form">
			<tbody>
				<tr>
					<td></td>
					<td id="msg" colspan="5" style="color: blue"></td>
				</tr>
				<tr>
					<td style="width: 110px">Email người nhận</td>
					<td style="width: 400px"><input type="text" name="Reciever"
						id="Reciever" style="width: 380px"
						value="">
					</td>
					
				</tr>
				<tr><td>------</td></tr>
				
				<tr>
					<td style="width: 110px">Tiêu đề</td>
					<td style="width: 400px"><input type="text" name="Header"
						id="Header" style="width: 380px"
						value="">
					</td>
				</tr>
				<tr><td>------</td></tr>
				<tr>
					<td style="vertical-align: top">Nội dung</td>
					<td colspan="3"><textarea name="Description" id="Description"
							style="height: 285px; width: 580px"><c:out
								value=""></c:out></textarea>
				</tr>
			</tbody>
		</table>
	</div>


	<script type="text/javascript">
		$("#btn_send").click(function () {
			$("#msg").html('<img src="<c:url value='/template/adimgs/loading1.gif'/>">Đang xử lý');
			var reciever = $("#Reciever").val().trim();
			var header = $("#Header").val().trim();
			var content = $("#Description").val().trim();
			var mess = "";

			if (reciever == "") {
				mess += "Email người nhận không được để trống. \n";
			}
			if (header == "") {
				mess += "Tiêu đề không được để trống. \n";
			}
			if (content == "") {
				mess += "Nội dung không được để trống. \n";
			}
			
			if (mess != "") {
				$("#msg").html("<div class=\"alert alert-danger\" role=\"alert\">"+mess+"</div>");
				return;
			}
			
			var data = {
				reciever : reciever,
				header : header,
				content : content
			};
			
			
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
					window.location.href = "${Adminurl}?error=sendmessagefailure";
				}
			});
		});

		
		
	</script>
</body>
</html>