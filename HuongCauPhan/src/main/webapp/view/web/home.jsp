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
<title>Gia Phả Việt Nam</title>

</head>
<body>
	<form name="form1" id="form1">

		<div class="wrapper">
			<a href="<c:url value='/trang-chu'/>" title="Bấm vào đây đề về Trang chủ" >
				<div class="banner txtC" id="heading-page">
					<img src="<c:url value='/template/adimgs/cen_bn.jpg'></c:url>" style="height: 150px" >
				</div>
			</a>
			<div class="wrappage">
				<div class="clb ovh top_news">
					<div id="dvgss"
						style="background: url(<c:url value='/template/adimgs/tnbd.png'></c:url>) no-repeat !important;">
						<div id="myCarousel" class="carousel slide border"
							data-ride="carousel"
							style="width: 440px; height: 240px; margin: 0 auto; padding-top: 9px">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img class="d-block w-100" src="<c:url value='/template/adimgs/sl1.jpeg'></c:url>" alt="Panther">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" src="<c:url value='/template/adimgs/sl2.jpg'></c:url>" alt="Black Cat">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" src="<c:url value='/template/adimgs/sl3.jpg'></c:url>" alt="Lion">
								</div>
							</div>
						</div>

						
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
						<script src="<c:url value='/template/adjs/bootstrap.min.js'></c:url>"></script>

					</div>
					<div class="ss_vlist">
						<ul>
							<li><a href="#">Lộc biếc, mai vàng, xuân hạnh phúc Đời vui, sức khoẻ, tết an khang</a></li>
							<li><a href="#">Văn vô sơn thủy phi kỳ khí. Nhân bất phong sương vị lão tài</a></li>
							<li><a href="#">Tu nhân tích đức do tiên tổ. Ẩm thủy tư nguyên phận tử tôn</a></li>
							<li><a href="#">Đức thụ tài bồi thiên tải thịnh. Tử tôn kế thế vạn niên trường</a></li>
							<li><a href="#">Tổ công tông đức thiên niên thịnh. Tử hiếu tôn hiền vạn đại vinh.</a></li>
						</ul>
					</div>
				</div>
				<div class="mid"></div>

				<div class="ovh mainpage clb">

					<div class="main-left fll">

						<div class="box ovh txtC menu">
							<h3 class="bhead">DANH MỤC</h3>
							<div class="grb">
								<ul id="menu">
									<li><a class="active" href="<c:url value='/trang-chu' />">Trang chủ</a></li>
									<li><a href="<c:url value='/thong-bao' />">Thông báo</a></li>
									<li><a href="<c:url value='/cac-dong-ho' />">Gia phả Việt Nam</a></li>
									<li><a href="#">Giới thiệu</a></li>
									<li><a href="#">Liên hệ - Góp ý</a></li>
								</ul>
							</div>
						</div>



						
					</div>

					<div class="main-center fll">

						<div class="intro ovh">
							<h3 class="intro_head">Lời nói đầu</h3>
							<div class="intro_content mCustomScrollbar"
								style="overflow: scroll;">
								<p>Xin trân trọng cảm ơn quý khách đã ghé thăm website:
									giaphavietnam - Nơi lưu giữ, nối kết và tôn vinh
									những giá trị truyền thống.</p>
								<p style="text-align: justify">Đây là một công trình nhằm
									phục vụ cho việc học tập môn phát triển phần mềm hướng cấu phần, Website là thành quả của sự hướng dẫn nhiệt tình của thầy 
									Nguyễn Thái Cường cùng bên cung cấp giao diện là anh Toàn, anh Quyết và nếu không có được điều đó thì
									nhóm em khó có thể hoàn thành được.</p>	
								<p style="text-align: justify">Vì không thể tránh khỏi những thiếu sót và hạn chế nên chúng em mong được nhận
									những phản hồi để cải thiện sản phảm này tốt hơn</p>							

								<p style="text-align: justify">Trân trọng cảm ơn!</p>
							</div>
						</div>


						
<div class="box ovh">
							<h3 class="cbhead txtC">TIN TỨC DÒNG HỌ</h3>
							<div class="grb cencol">
								<div class="fnews fll" id="TopNews">
									<h4></h4>
							<c:forEach items="${arrNewsTop}" var="item">
							<div style="height: 100px;box-shadow: 1px 2px 3px;">
							<p class="headline" style="height: 45px; overflow: hidden;text-align: center;" >
							<c:url value='/tin-hot' var='urlNews'>
							<c:param name='newID' value='${item.newsID }'/> 
							</c:url>
							<a href="${urlNews}" style="text-align: center;">${item.title}</a></p>
							<span class="source" style="padding-left: 10px;font-style: italic;">Lượt xem: ${item.views }</span>
						<span style="color: red;padding-left:50px; ">Đăng ngày: ${item.create_date}</span>
						</div>
						</c:forEach> 
							
								</div>
								<div class="ofnews flr">
									<ul>
									<c:forEach items="${arrNewDate}" var="item">
										<li>
										<c:url value='/tin-hot' var='urlNews'>
											<c:param name='newID' value='${item.newsID }'/> 
										</c:url>
											<a href="${urlNews}">${item.title}<span>- <i>${item.create_date}</i></span></a>
											<p class="source">Tin dòng họ:</p>
										</li>
									</c:forEach> 
									</ul>
								</div>
							</div>
						</div>


					</div>

					<div class="main-right flr">

						<div class="box rb ovh txtC login">
							<h3 class="bhead">THÀNH VIÊN</h3>
							
							<div class="grb ovh" id="member_area">
							
							<c:if test="${not empty model}">
								<div class="member">
								<img src="<c:url value='/template/adimgs/default.png'/>"/>
								<p>Xin chào:</p><p class="memname">${model.accountName}</p>
								</div>
								<div class="memfunc">
								<p><a href="<c:url value='/quan-tri'/>" tabindex="1" >Quản lý</a></p>
								<p><a href="javascript:logout()">Đăng xuất</a></p>
								</div>
							</c:if>
							
							<c:if test="${empty model}">
								<form id="formlogin">
										
								<p><input type="text" id="accountName" name="accountName" class="txt usrn" placeholder="Tên đăng nhập" /></p>
										
								<p><input type="password" id="password" name="password" class="txt pwd" placeholder="Mật khẩu" /></p>
								
								<p class="pdr"><input type="button" id="btnLogin" value="Đăng nhập" tabindex="1" style="height: 25px" /></p>
								<p style="padding-top: 5px"><a href="javascript:open_register()" id="lnk_regnew" style="text-decoration: underline">Đăng ký mới miễn phí</a></p>
								</form>
							</c:if>
							</div>
						</div>
						
						<div class="box rb ovh txtC menu">
							<h3 class="bhead">WEB CÁC DÒNG HỌ</h3>
							<div class="grb">
								<ul id="weblink">
									<li><a target="_blank"
										href="http://www.hophamvietnam.org/">Họ Phạm Việt Nam</a></li>
									<li><a target="_blank"
										href="http://hohoanghuynhvietnam.vn/">Họ Hoàng - Huỳnh</a></li>
									<li><a target="_blank"
										href="http://hovuvovietnam.com/Dong-ho-Vu-Vo-Viet-Nam_t_304.html">Họ
											Vũ - Võ Việt</a></li>
									<li><a target="_blank" href="http://honinh.vn/">Họ
											Ninh Việt Nam</a></li>
									<li><a target="_blank" href="http://hodovietnam.vn/">Họ
											Đỗ Việt Nam</a></li>
									<li><a target="_blank"
										href="http://www.phantocvietnam.org/">Họ Phan Việt Nam</a></li>
									<li><a target="_blank" href="http://hovanvietnam.com/">Họ
											Văn Việt Nam</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<a href="#heading-page" id="toTop">to Top</a>

	<div class="dialog modal" id="dlg_register"
		style="width: 550px; height: 280px; margin: 100px auto;">
		<div class="dlg_title" style="">ĐĂNG KÝ THÀNH VIÊN MỚI</div>
		<div class="dlg_content">
			<div class="frm_loadstatus" style="display: none"></div>
			<form name="frm_dk" id="frm_dk">
				<table border="0" style="width: 100%" class="frm_data">
					<tr>
						<td>Tên đăng nhập</td>
						<td><input type="text" name="UserName" id="UserName"
							style="width: 200px" /> <span class="legend">(Viết liền,
								không dấu, tối đa 20 ký tự)</span></td>
					</tr>
					<tr>
						<td>Mật khẩu</td>
						<td><input type="password" style="width: 200px"
							name="Password" id="Password" /> <span class="legend">(Tối
								thiểu 6 ký tự, tối đa 12 ký tự)</span></td>
					</tr>
					<tr>
						<td>Xác nhận<br />Mật khẩu
						</td>
						<td><input type="password" style="width: 200px"
							name="ConfirmPassword" id="ConfirmPassword" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" id="captConfirm"
							style="width: 75px; height: 21px; float: left; margin-right: 10px"
							placeholder="Mã bảo mật" title="Nhập mã trong ảnh bên" /> <img
							id="imgSec" src="<c:url value='/template/adimgs/CapGenerator.jpg'/>" class="imgCaptcha"
							alt="Loading..." style="width: 80px; height: 30px"/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td style="padding-top: 15px !important; vertical-align: top"><input
							type="button" onclick="register()" id="btn_register"
							value="Đăng ký" style="float: left; height: 25px;" /></td>
					</tr>
					<tr>
						<td></td>
						<td id="update_msg"></td>
					</tr>
				</table>
			</form>
		</div>
		<input type="hidden" value="0" id="hdpr" name="hdpr" /> 
		<a class="close-modal" style="margin-top: 5.5px; height: 3px;">Close</a>
	</div>

<script>

	function logout() {
		var mess = "Bạn có thực sự muốn đăng xuất khỏi hệ thống";
		if (window.confirm(mess)) {
			window.location.href = "${WebURL}?action=logout";
		}
	}

	function open_register() {
		$('#dlg_register').modal('show'); // show bootstrap modal
	}

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