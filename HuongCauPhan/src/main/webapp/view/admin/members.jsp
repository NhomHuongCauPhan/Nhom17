<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Phả đồ</title>
<script type="text/javascript"
	src="<c:url value='/template/adjs/jquery.min.1.7.1.js'/>"></script>
<link href="<c:url value='/template/adcss/layout.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/template/adcss/common.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/template/adcss/ucp.css'/>" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<c:url value='/template/adjs/ucp.js'/>">
	
</script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/template/adcss/editor.css'/>" />
<link href="<c:url value='/template/adcss/bootstrap.css'/>" rel="stylesheet"
	type="text/css" />

<title>Quản lý phả đồ</title>
<style>
#lgr a {
	color: #19191a;
}
</style>

</head>
<body>
	<div>
		<input type="hidden" name="state" id="state"
			value="<c:out value="${state}"></c:out>"> <input
			type="hidden" name="idpr" id="idpr"
			value="<c:out value="${prt.parentage_id}"></c:out>">
	</div>

	<div class="main_frame">
		<div class="ucp_def_header">


			<div class="banner txtC">
				<img src="<c:url value='/template/adimgs/cen_bn.jpg'/>" style="height: 80px" />
			</div>
			<table width="100%" cellspacing="0" cellpadding="0" border="0"
				class="ucp_info">
				<tbody>
					<tr>
						<td></td>
						<td class="subleft"><a href="<c:url value='/view'/>">TRANG CHỦ</a></td>
						<td class="subcen"><c:out value="${prname}"></c:out></td>
						<td class="subright">Người tạo: <c:out value="${pracname}"></c:out>

						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div style="clear: both"></div>
		</div>
		<div class="ucp_def_body">
			<jsp:include page="/common/admin/menu-left.jsp"></jsp:include>

			<!-- content -->
			<div class="ucp_def_right" id="gp_phahe"></div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="/common/web/footer.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			loadPhaHe();
		});

		function loadPhaHe() {

			var request;
			var url = "/home/individual/view";

			if (window.XMLHttpRequest) {
				request = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			}

			try {
				request.onreadystatechange = getInfo;
				request.open("GET", url, true);
				request.send();
			} catch (e) {
				alert("Unable to connect to server");
			}

			function getInfo() {
				if (request.readyState == 4) {
					var data = request.responseText;
					$("#gp_phahe").html(data);
				}
			}
		}
		function del(id) {
			var mess = "Bạn có thực sự muốn xóa thành viên";
			if (window.confirm(mess)) {
				var request;
				var url = "/home/individual/ae?action=del&id=" + id;

				if (window.XMLHttpRequest) {
					request = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					request = new ActiveXObject("Microsoft.XMLHTTP");
				}

				try {
					request.onreadystatechange = getInfo;
					request.open("POST", url, true);
					request.send();
				} catch (e) {
					alert("Unable to connect to server");
				}

				function getInfo() {
					if (request.readyState == 4) {
						var data = request.responseText;
						alert(data);
						location.href = location.href
					}
				}
			}
		}
		function openedit(id) {
			window.location.href = "/home/individual/ae?id=" + id;
		}
		
	</script>
</body>
</html>