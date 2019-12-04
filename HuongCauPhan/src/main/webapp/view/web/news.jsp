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

			<c:set var="titleNew" value="${onlyOne.title }"> </c:set>
					<div class="main-center fll" style="padding:20px 20px; font-size:16px;background: url(<c:url value='/template/adimgs/ct_bg.png'/>) repeat !important;">
							<h1 style="text-align: center;"><strong>${onlyOne.title }</strong> </h1>
							<br>
							<br>
							<div>
								${onlyOne.content}
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

	
</script>
</body>
</html>
