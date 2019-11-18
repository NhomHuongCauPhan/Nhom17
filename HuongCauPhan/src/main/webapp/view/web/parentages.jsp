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
    <link rel="stylesheet" href="<c:url value='/template/adcss/bootstrap.min.css'/>"/>
<%--<style>
    .prInfo td{
        text-align: center !important;
    }
</style>--%>

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
                                <li><a href="<c:url value='/trang-chu'/>">Trang chủ</a></li>
                                <li><a href="<c:url value='/thong-bao' />">Thông báo</a></li>
                                <li><a class="active" href="<c:url value='/cac-dong-ho' />">Gia phả Việt Nam</a></li>
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
                            <table cellpadding="5" cellspacing="0" border="0" style="width: 100%; border-collapse: collapse" id="gpvn">
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
                                    <c:forEach var="item" items="${ParentageModel.listResult}" varStatus="size"></c:forEach>
                                        <tr class="prInfo">
                                            <td>${size.index + 1}</td>
                                            <td><a href="#" style="cursor: pointer">${item.parentageName}</a></td>
                                            <td>${item.address}</td>
                                            <td>${item.head_of_parentage_name}</td>
                                            <td>${item.culturalSpringDay}</td>
                                            <td>${item.totalMember}</td>
                                        </tr>
                                    </c:forEach>
                                    <%-- <tr id="list">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/common/web/footer.jsp" %>
</form>
<a href="javascript:void(0)" id="toTop">to Top</a>


<script>
    function headers(list, selector) {
        var columns = [];
        for (var i = 0; i < list.length; i++) {
            var row = list[i];
            for (var k in row) {
                if ($.inArray(k, columns) == -1) {
                    columns.push(k);
                }
            }
        }
        return columns;
    }

    function constructTable(list, selector) {
        //lấy tên columns
        var cols = headers(list, selector);
        $('#formData').html("");
        //truyền dữ liệu json
        for (var i = 0; i < list.length; i++) {
            var num=i+1;
            var row = $('<tr/>');
            for (var colIndex = 0; colIndex < 1; colIndex++) {
                var val = list[i][cols[1]];
                var val1 = list[i][cols[3]];
                var val2 = list[i][cols[2]];
                var val3 = list[i][cols[4]];
                var val4 = list[i][cols[12]];
                if (val == null && val1 == null && val2 == null && val3 == null && val4 == null) val = val1 = val2 = val3 = val4 = "";
                row.append($('<td/>').html(num));
                row.append($('<td/>').append("<a href=\"${PrtUrl}\">"+val+"</a>"));
                row.append($('<td/>').html(val1));
                row.append($('<td/>').html(val2));
                row.append($('<td/>').html(val3));

                row.append($('<td/>').html("${totalMember}"));
            }

            $(selector).append(row);
        }
    }

    /*$(document).ready(function () { //load parentages infomation
        $.ajax({
            url: '${PrtUrl}',
            type: 'GET',
            contentType:'application/json',
            dataType: 'json',
            success: function (list) {

                constructTable(list,"#gpvn");
            },
            error: function () {
                alert('There\'s something wrong!');
            }
        });
    });*/

    $('#btnSearch').click(function(e) { //tìm kiếm thông tin dòng họ
        var searchData=$('#search').val();
        e.preventDefault();
        $.ajax({
            url: '${PrtUrl}',
            type: 'POST',
            contentType:'application/text',
            dataType: 'json',
            data: searchData.trim(),
            success: function (list) {
                constructTable(list, '#gpvn');

            },
            error: function () {
                alert('There\'s something wrong!');
            }
        });
    });
</script>
</body>
</html>