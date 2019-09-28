<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Album ảnh - Gia phả Việt Nam</title>

</head>
<body>

				<div class="page_title" style="margin-bottom: 15px">
					<h2>Ảnh của dòng họ</h2>
					<div class="toolbox">
						<form id="album" method="post"
							action="/home/image/ae"
							enctype="multipart/form-data">
							<input id="img-format" name="img-format" type="file"
								onchange="changeimg(event)" accept=".png, .jpg,.jpeg" 
								style="color:white;cursor:pointer;"/>
							<button class="btn" type="submit" style="color:white;border:1px solid white">Lưu</button>
						</form>
					</div>

				</div>
				<div class="load_progress"></div>


				<div class="container">
					<div class="row" id="ctn"></div>
				</div>


	
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#ctn").html('hhh');
			loadimg();
		});

		function loadimg() {
			var url = "/home/album";
			var request;

			if (window.XMLHttpRequest) {
				request = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			}

			try {
				request.onreadystatechange = getInfo;
				request.open("GET", url, true);
				request.send();
			} catch (e) {
				alert("Unable to connect to server");
			}

			function getInfo() {
				if (request.readyState == 4) {
					var val = request.responseText;
					$("#ctn").html(val);
				}
			}
		}

		function changeimg(evt) {
			evt.stopPropagation();
			evt.preventDefault();
			var files = evt.target.files;
			var file = files[0];
			var fileReader = new FileReader();

			fileReader.onload = function(progressEvent) {
				var url = fileReader.result;
				var myImg = document.getElementById("img0");
				myImg.src = url;
			}
			fileReader.readAsDataURL(file);
		}
		
		function del_img(){
			$("#del_img").submit();
		}
	</script>
</body>
</html>
