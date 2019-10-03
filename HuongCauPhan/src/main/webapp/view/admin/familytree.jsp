<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
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
				<%out.print(request.getAttribute("mess")); %>
			</div>

	<script type="text/javascript">
		$(document).ready(function() {
			//loadPhaHe();
		});

		function loadPhaHe() {
			var life;
			if ($("#life").val() == '0') {
				if (parseInt("${prlife}") < 5) {
					life = Math.floor(parseInt("${prlife}") / 2);
					if (life == 0) {
						life = 1;
					}
				} else {
					life = 5;
				}

			} else {
				life = $("#life").val();
			}
			var request;
			var url = "/home/individual/view?life=" + life;

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
		function logout() {
			var mess = "Bạn có thực sự muốn đăng xuất khỏi hệ thống";
			if (window.confirm(mess)) {
				window.location.href = "/home/view?action=logout";
			}
		}
	</script>
</body>
</html>