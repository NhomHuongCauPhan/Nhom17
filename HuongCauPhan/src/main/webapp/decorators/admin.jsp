<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
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
<link rel="stylesheet" href="<c:url value='/template/adcss/bootstrap.css'/>"/>

<title>Quản Lý Phả Đồ</title>
<style>
#lgr a {
	color: #19191a;
}
</style>
</head>
<body>
	<div>
		<input type="hidden" name="state" id="state"
			value="<c:out value="${state}"></c:out>"/> <input
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
						<td class="subleft"><a href="<c:url value='/template/view'/>">TRANG CHỦ</a></td>
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

<!-- Page Content -->
	<dec:body />
			
	</div>

	<!-- Footer -->
	<%@include file="/common/web/footer.jsp"%>
	<span style="float: left; padding-left: 20px; color: red" id="frm_msg"></span>

	</div>
</body>
</html>