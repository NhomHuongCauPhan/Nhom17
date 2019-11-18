<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-account"/>
<c:url var="WebURL" value="/trang-chu"/>
<c:url var="Adminurl" value="/quan-tri"/>
<c:url var="Adminurl" value="/quan-tri"/> 
<c:url var="TopViews" value="/api-admin-news"/>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<link rel="shortcut icon" href="template/http://www.giaphavietnam.vn/img/utils/favicon.ico" type="image/x-icon" />

	<script type="text/javascript" src="<c:url value='/template/adjs/jquery.min.1.7.1.js'/>"></script>
	<link href="<c:url value='/template/adcss/layout.css'/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/template/adcss/common.css'/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/template/adcss/default.css'/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/template/adcss/dvgss.css'/>" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<c:url value='/template/adjs/jquery.modal.min.js'/>"></script>
	<link href="<c:url value='/template/adcss/jquery.modal.css'/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/template/adcss/jquery.mCustomScrollbar.css'/>" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/template/adcss/bootstrap.min.css'/>">
	<title>Gia Phả Việt Nam</title>
	<%--<style>
		.ss_vlist li{width:62px;}
		.intro{width:670px;}
	</style>--%>
</head>
<body>
	<!-- Page Content -->
	<dec:body />

	<!-- Footer -->
	<%@include file="/common/web/footer.jsp" %>
	<script type="text/javascript">
	$('#btnLogin').click(function (e) {
		e.preventDefault();
		var username = $("#accountName").val().trim();
		var password = $("#password").val().trim();
		var data = {
			accountName: username,
			password: password,
			id: 0,
			role: 0,
			status: 0
		};
		var tmp = "";
		if (username.length == 0) {
			tmp += "Tên tài khoản không được để trống";
		}
		if (password.length == 0) {
			tmp += "Mật khẩu không được để trống\n";
		}
		if (tmp != "") {
			alert(tmp);
			return;
		}

		/* var formdata = $('#formlogin').serializeArray();
		$.each(formdata, function(i, v){
			data[""+v.name+""] = v.value;
		}); */


		$.ajax({
			url: '${APIurl}',
			type: 'post',
			contentType: 'application/json',
			data: JSON.stringify(data),
			dataType: 'json',
			success: function (result) {
				window.location.href = "${WebURL}";
			},

			error: function (error) {
				window.location.href = "${WebURL}?error=notlogin";
			}
		});
	});
	
	
	
	function logout() {
		var mess = "Bạn có thực sự muốn đăng xuất khỏi hệ thống";
		if (window.confirm(mess)) {
			window.location.href = "${WebURL}?action=logout";
		}
	}

	function open_register() {
		$('#dlg_register').modal('show'); // show bootstrap modal
	}

	

	function register() {

		var username = $("#UserName").val().trim();
		var password = $("#Password").val().trim();
		var cfpassword = $("#ConfirmPassword").val().trim();
		var capcf = $("#captConfirm").val().trim();
		var tmp = "";
		if (username.length == 0) {
			tmp += "Tên tài khoản không được để trống; ";
		}
		if (password.length == 0) {
			tmp += "Mật khẩu không được để trống; ";
		}
		if (password != cfpassword) {
			tmp += "Kiểm tra lại mật khẩu; ";
			$("#ConfirmPassword").val("");
			$("#Password").focus();
		}
		if (tmp != "") {
			tmp = "<div class=\"error\">" + tmp + "</div>";
			$("#update_msg").html(tmp);
			return;
		}

		var request;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {

			var data = {
				accountname: username,
				accountpass: password,
				role: "1"
			};

			var datastr = JSON.stringify(data);
			var url = "/HuongCauPhan/view?data="
					+ encodeURIComponent(datastr);

			request.onreadystatechange = function () {
				if (this.readyState == 4 && this.status == 200) {
					var tmp1 = "<div class=\"success\">"
							+ request.responseText + "</div>";
					$("#update_msg").html(tmp1);

				}
			};

			request.open("POST", url, true);
			request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
			request.send(datastr);
		} catch (e) {
			alert("Unable connect to server");
		}
	}
	</script>
</body>
</html>