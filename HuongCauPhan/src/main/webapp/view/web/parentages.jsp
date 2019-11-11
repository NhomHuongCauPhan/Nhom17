<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="PrtUrl" value="/api-parentage"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=9"/>
    <link rel="shortcut icon" href="template/adimgs/favicon.ico" type="image/x-icon"/>
    <title>Gia phả Việt Nam - Gia phả Việt Nam</title>
    <script type="text/javascript" src="<c:url value='/template/adjs/jquery.min.1.7.1.js'/>"></script>
    <link href="<c:url value='/template/adcss/layout.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/template/adcss/common.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/template/adcss/default.css'/>" rel="stylesheet" type="text/css"/>
<style>
    .prInfo td{
        text-align: center !important;
    }
</style>

</head>
<body>
<form name="form1" method="post" action="" id="form1">
    <div class="wrapper">
        <a href="/trang-chu" title="Bấm vào đây đề về Trang chủ">
            <div class="banner ovh txtC">
                <img src="<c:url value='/template/adimgs/cen_bn.jpg'/>" style="height:150px"/>
            </div>
        </a>
        <div class="wrappage">
            <div class="ovh mainpage clb">
                <div class="main-left1 fll">
                    <div class="box ovh txtC menu">
                        <h3 class="bhead">DANH MỤC</h3>
                        <div class="grb">
                            <ul id="menu">
                                <li><a class="active" href="<c:url value='/trang-chu'/>">Trang chủ</a></li>
                                <li><a href="<c:url value='/thong-bao' />">Thông báo</a></li>
                                <li><a href="<c:url value='/cac-dong-ho' />">Gia phả Việt Nam</a></li>
                                <li><a href="#">Giới thiệu</a></li>
                                <li><a href="#">Liên hệ - Góp ý</a></li>
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
                    </div>
                </div>
                <div class="main-right1 flr">
                    <div class="box ovh txtC">
                        <h3 class="crbhead" id="dhfrmtit">GIA PHẢ VIỆT NAM</h3>
                        <div class="grb gpvn">
                            <div class="gpvn_search_box">
                                <input type="text" name="Keyword" id="search" placeholder="Tên dòng họ, Địa chỉ"/>
                                <%--<a href="#" id="gpvn_search_btn">Tìm kiếm</a>--%>
                                <%--<input type="button" class="btn btn-red" value="Tìm kiếm" id="btnSearch"/>--%>
                                <button class="btn btn-secondary" type="submit" id="btnSearch">Tìm kiếm</button>
                            </div>
                            <table cellpadding="5" cellspacing="0" border="0"
                                   style="width: 100%; border-collapse: collapse" id="gpvn">
                                <thead>
                                    <tr>
                                        <td style="width: 30px">STT</td>
                                        <td>Tên dòng họ</td>
                                        <td>Nguyên quán</td>
                                        <td>Trưởng họ</td>
                                        <td>Ngày lập</td>
                                        <td>Số thành viên</td>
                                    </tr>
                                </thead>
                                <tbody id="formData">
                                    <%--<c:forEach var="item" items="${ParentageModel.listResult}" varStatus="size"></c:forEach>
                                        <tr class="prInfo">
                                            <td>${size.index + 1}</td>
                                            <td>${item.parentageName}</td>
                                            <td>${item.address}</td>
                                            <td>${item.head_of_parentage_name}</td>
                                            <td>${item.culturalSpringDay}</td>
                                            <td>${item.totalMember}</td>
                                        </tr>--%>
                                    <tr id="list">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
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

<script>
    $(document).ready(function () { //load parentages infomation
        $.ajax({
            url: '${PrtUrl}',
            type: 'GET',
            contentType:'application/json',
            dataType: 'json',
            success: function (result) {
                console.log("GET: "+result);
            },
            error: function () {
                alert('There\'s something wrong!');
            }
        });
    });

    function checkDataExist(data){
        var prt=[];
        if(data!=null){
            //var data1=JSON.stringify(data);
            prt.push(data)
            console.log(data);
            console.log("rr: "+prt);
        }else{
            alert("Không có dữ liệu.");
        }
    }

    $('#btnSearch').click(function(e) {
        var searchData=$('#search').val();
        e.preventDefault();
        $.ajax({
            url: '${PrtUrl}',
            type: 'POST',
            contentType:'application/text',
            dataType: 'json',
            data: searchData.trim(),
            success: function (data) {
                checkDataExist(data);
            },
            error: function () {
                alert('There\'s something wrong!');
            }
        });
    });
</script>
</body>
</html>