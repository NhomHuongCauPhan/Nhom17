<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Phả đồ</title>
<script type="text/javascript" src="<c:url value='/template/adjs/jquery.min.1.7.1.js'/>"></script>
<link href="<c:url value='/template/adcss/layout.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/template/adcss/common.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/template/adcss/ucp.css'/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/template/adjs/ucp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/template/adcss/editor.css'/>" />
<link rel="stylesheet" href="<c:url value='/template/adcss/bootstrap.css'/>"/>
<link rel="stylesheet" href="<c:url value='/template/adcss/bootstrap-theme.min.css'/>"/>
<script src="<c:url value='/template/ckeditor/ckeditor.js' />"></script>


<link href="<c:url value='/template/adcss/fileinput.css'/>" media="all" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" type="text/css"/>
<!--<script src="<c:url value='/template/adjs/jquery-3.2.1.min.js'/>" ></script>-->
<%-- <script src="<c:url value='/template/adjs/bootstrap.bundle.min.js'/>" ></script> --%>
<script src="<c:url value='/template/adjs/fileinput.js'/>" type="text/javascript"></script>
<script src="<c:url value='/template/adjs/theme.js'/>" type="text/javascript"></script>

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
						<td class="subleft"><a href="<c:url value='/trang-chu'/>">TRANG CHỦ</a></td>
						<td class="subcen">
							<c:if test="${not empty ParentageModel}">
								<c:out value="${ParentageModel.parentageName}"></c:out>
							</c:if>
							<c:if test="${empty ParentageModel}">
								Hãy tạo thông tin dòng họ
							</c:if>
						</td>
						<td class="subright">Người tạo: <c:out value="${model.accountName}"></c:out>

						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div style="clear: both"></div>
		</div>
		<div class="ucp_def_body">
			<jsp:include page="/common/admin/menu-left.jsp"></jsp:include>
			<dec:body />	
		</div>
		<!-- Footer -->
		<%@include file="/common/web/footer.jsp"%>
		<span style="float: left; padding-left: 20px; color: red" id="frm_msg"></span>
	</div>
</body>
</html>