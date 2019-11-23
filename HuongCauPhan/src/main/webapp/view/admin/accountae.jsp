<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Đổi mật khẩu - Gia phả Việt Nam</title>
</head>
<body>
		
<div class="ucp_def_right">
<div class="page_title" style="margin-bottom: 15px">
    <h2>Thông tin tài khoản</h2>
</div>
<div class="frm_loadstatus" style="display: none;"></div>
<table border="0" style="width: 100%; border-collapse: collapse" class="ucp_tbl_acc">
    <tbody><tr>
        <td colspan="2" id="frm_msg"></td>
    </tr>
    <tr>
        <td style="width: 100px">Họ và tên</td>
        <td><input type="text" name="FullName" value="${account.accountName}" readonly style="width: 200px"></td>
    </tr>
    <tr>
        <td>Email</td>
        <td><input type="text" name="Email" value="${ParentageModel.headOfParentageEmail}" readonly style="width: 200px"></td>
    </tr>
    <tr>
        <td>Điện thoại</td>
        <td><input type="text" name="Phone" value="${ParentageModel.headOfParentageNumber}" readonly style="width: 200px"></td>
    </tr>
    <tr>
        <td>Địa chỉ</td>
        <td><input type="text" name="Address" value="${ParentageModel.address}" readonly style="width: 500px"></td>
    </tr>
     
</tbody></table>
        </div>
</body>
</html>
