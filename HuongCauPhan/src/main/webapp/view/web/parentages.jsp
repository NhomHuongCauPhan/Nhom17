<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<link rel="shortcut icon" href="img/utils/favicon.ico" type="image/x-icon" />
<link rel="icon" href="<c:url value='/template/adimgs/favicon.ico'/>" type="image/x-icon" />
<title>Gia phả Việt Nam - Gia phả Việt Nam</title>
<script type = "text/javascript" src = "<c:url value='/template/adjs/jquery.min.1.7.1.js'/>" ></script>
<link href="<c:url value='/template/adcss/layout.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/template/adcss/common.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/template/adcss/default.css'/>" rel="stylesheet" type="text/css" />


</head>
<body>
	 <form name="form1" method="post" action="" id="form1">    
        
<div class = "wrapper">
    
<a href="default.aspx" title="Bấm vào đây đề về Trang chủ">
<div class="banner ovh txtC">
    <img src="<c:url value='/template/adimgs/cen_bn.jpg'/>" style="height:150px"  />
</div></a>
    
    <div class="wrappage">

        <div class="ovh mainpage clb">

            
            
            <div class="main-left1 fll">

<div class="box ovh txtC menu">
    <h3 class="bhead">DANH MỤC</h3>
    <div class="grb"><ul id="menu">
    <li><a class="active" href="<c:url value='/trang-chu' />">Trang chủ</a></li>
	<li><a href="<c:url value='/thong-bao' />">Thông báo</a></li>
	<li><a href="<c:url value='/cac-dong-ho' />">Gia phả Việt Nam</a></li>
    <li><a  href="#">Giới thiệu</a></li>
    <li><a  href="#">Liên hệ - Góp ý</a></li>
    </ul>
    </div>
</div>

<div class="box ovh txtC menu">
    <h3 class="bhead">HỖ TRỢ</h3>
    <div class="grb">

<div class="spitem">
<p>Gmail</p>

<p>msluudiecphi@gmail.com</p>
</div>


</div>
</div></div>

            <div class="main-right1 flr">

<div class="box ovh txtC">
    <h3 class="crbhead" id="dhfrmtit">GIA PHẢ VIỆT NAM</h3>
    <div class="grb gpvn">
        <div class="gpvn_search_box"><input type="text" name="Keyword" placeholder="Tên dòng họ, Địa chỉ" /><a href="#" id="gpvn_search_btn">Tìm kiếm</a></div>
        <table cellpadding="5" cellspacing="0" border="0" style="width: 100%; border-collapse: collapse" id="gpvn">
            <thead>
                <tr>
                    <td style="width: 30px">STT</td>
                    <td>Tên dòng họ</td>
                    <td>Nguyên quán</td>
                    <td style="width: 65px">Ngày lập</td>
                    <td style="width: 50px">Số thành viên</td>
                </tr>
            </thead>
            <tbody>
            
            </tbody>
        </table>
        <div id = "pager"><input type="hidden" name="ctl06$right_ctrl0$hft" id="ctl06_right_ctrl0_hft" /></div>
    </div>
</div></div>

        </div>
    </div>

    <div class="footer txtC w100">
<div class="clb ovh fw100 navBottom fonts ul-none">
    <ul>
        <li><a class="active" href="<c:url value='/trang-chu' />">Trang chủ</a></li>
		<li><a href="<c:url value='/thong-bao' />">Thông báo</a></li>
		<li><a href="<c:url value='/cac-dong-ho' />">Gia phả Việt Nam</a></li>
        <li><a href="#">GIỚI THIỆU</a></li>
        <li><a href="#">LIÊN HỆ - GÓP Ý</a></li>
    </ul>
</div>
<p>&copy; </p></div>

</div>
    </form>
    <a href="javascript:void(0)" id="toTop">to Top</a>
</body>
</html>