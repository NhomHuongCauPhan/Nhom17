<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Album ảnh - Gia phả Việt Nam</title>
</head>
<body>
<!-- Body Album -->

	<div class="container my-4">
	    <form class="multi-img" enctype="multipart/form-data" style="margin: -17px 0px 0 20px; width: 1275px;">
	        <div class="file-loading">
	            <input id="file-0a" class="file" type="file" multiple data-min-file-count="1" data-theme="fas">
	        </div>
	        <br>
	        <button type="submit" class="btn btn-primary">Submit</button>
	        <button type="reset" class="btn btn-outline-secondary">Reset</button>
	    </form>
	</div>

<!-- End Body Album -->


</body>
</html>
