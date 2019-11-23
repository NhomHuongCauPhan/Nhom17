<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<c:url var="APISearchurl" value="/api-search"/>
<c:url var="APIIndividual" value="/api-individual"/>
<c:url var="PrtUrl" value="/api-parentage"/>
<c:url var="WebURL" value="/trang-chu"/>
<c:url var="PrtInfo" value="/thong-tin-dong-ho"/>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Quản lý phả đồ - Gia phả Việt Nam</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=9"/>
	<link rel="shortcut icon" href="template/adimgs/favicon.ico" type="image/x-icon"/>
	<script type="text/javascript" src="<c:url value='/template/adjs/jquery.min.1.7.1.js'/>"></script>
	<link href="<c:url value='/template/adcss/layout.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/template/adcss/ucp.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/template/adcss/common.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/template/adcss/default.css'/>" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="<c:url value='/template/adcss/bootstrap.min.css'/>"/>
</head>
<body>
<div class="wrapper">
	<a href="<c:url value="/trang-chu" />" title="Bấm vào đây đề về Trang chủ">
		<div class="banner ovh txtC">
			<img src="<c:url value='/template/adimgs/cen_bn.jpg'/>" style="height:150px"/>
		</div>
	</a>

	<div class="wrappage">
		<div class="ovh mainpage clb">
			<%--<input type="hidden" id="prtId" name="parentageId" />--%>
			<div class="dhbn ovh">
				<div class="dhbnhead"></div>
				<div class="dhbnbody" id="dhname">Gia phả dòng họ: ${prname}</div>
				<div class="dhbnend"></div>
			</div>

			<div class="main-left1 fll">
				<div class="box ovh txtC menu">
					<h3 class="bhead">PHẢ KÝ</h3>
					<div class="grb">
						<ul id="dh_menu">
							<li id="dhinfo" class="active">Thông tin chung</li>
							<li id="dhnews" onclick="openad()">Tin tức dòng họ</li>
							<li id="dhtree">Phả đồ</li>
							<li id="dhalbum" onclick="openalbum()">Album ảnh dòng họ</li>
						</ul>
					</div>
				</div>
				<div class="box ovh txtC menu">
					<h3 class="bhead">TÁC GIẢ</h3>
					<div class="grb ftcreator">
						<img id="cravatar" alt="Ảnh đại diện" src="<c:url value='/template/adimgs/default.png'/>">
						<p>
							Họ tên: <span id="cre_fn">${prhead}</span>
						</p>
						<p>
							Email: <span id="cre_email">${premail}</span>
						</p>
						<p>
							Điện thoại: <span id="cre_phone">${prnumber}</span>
						</p>
						<p>
							Địa chỉ: <span id="cre_addr">${prheadadr}</span>
						</p>
					</div>
				</div>
			</div>

			<div class="main-right1 flr">

				<div class="box ovh txtC">
					<div id="prtif">
						<h3 class="crbhead" id="dhfrmtit">THÔNG TIN DÒNG HỌ</h3>
						<div class="grb" id="ft_ct">
							<p class="dhtitle">
								<span>Tên dòng họ</span><b>:</b><span id="prtName"></span>
							</p>
							<p class="dhtitle">
								<span>Thủy tổ</span><b>:</b><span id="prtAncestor"></span>
							</p>
							<p class="dhtitle">
								<span>Quê gốc</span><b>:</b><span id="prtAdd"></span>
							</p>
							<p class="dhtitle">
								<span>Ngày giỗ họ</span><b>:</b><span>15/1</span>
							</p>
							<p class="dhtitle">
								<span>Số thành viên</span><b>:</b><span>${prnumber_individual}(<a
									href="#" class="treelink">Xem Phả đồ tại đây</a>)
									</span>
							</p>
							<p class="dhtitle">
								<span>Ngày lập gia phả</span><b>:</b><span>17/05/2019</span>
							</p>
							<p class="dhtitle">
								<span>Người lâp gia phả</span><b>:</b><span id="prtHead"></span>
							</p>
							<h3>LỜI HAY Ý ĐẸP</h3>
							<div id="lhyd"></div>
							<h3>GIỚI THIỆU VỀ DÒNG HỌ</h3>
							<div id="prtIntro"></div>
						</div>
					</div>
					<div id="prtimg">
						<h3 class="crbhead" id="dhfrmtit">Album Ảnh</h3>
						<div class="grb" id="ft_ct">
							<div class="row" style="height: 400px; overflow: scroll">
								<c:forEach items="${list_imgs}" var="item">
									<img alt="" src="<c:url value="/template/adimgs/${item.url}"/>"
										 style="max-height: 200px;">
								</c:forEach>
							</div>
						</div>
					</div>
					<div id="prtfmtree">
						<h3 class="crbhead">Phả Đồ</h3>
						<div class="grb" id="ft_ct" style="height: 100px; overflow: scroll">
							<div id="gp_phahe"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="/common/web/footer.jsp"%>

</div>
<a href="javascript:void(0)" id="toTop">to Top</a>
<!-- content -->


<script type="text/javascript">
	var url = document.location.href;
	var params = "oneprt-"+url.split('?')[1].split('=')[1];

	function headers(list) {
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

	function constructTable(list) {
		//lấy tên columns
		var cols = headers(list);
		//truyền dữ liệu json
		for (var i = 0; i < list.length; i++) {
			for (var colIndex = 0; colIndex < 1; colIndex++) {
				var prtName = list[i][cols[1]]; //tên dòng họ
				var prtAdd = list[i][cols[3]]; //quê gốc
				var prtHead = list[i][cols[2]]; //trưởng họ
				var prtAncestor = list[i][cols[8]]; //thủy tổ
				var prtIntro = list[i][cols[9]]; //giới thiệu
				if (prtName == null && prtAdd == null && prtHead == null && prtAncestor == null && prtIntro)
					prtName = prtAdd = prtHead = prtAncestor = prtIntro = "";
			}
			document.getElementById("prtName").innerHTML=prtName;
			document.getElementById("prtAdd").innerHTML=prtAdd;
			document.getElementById("prtHead").innerHTML=prtHead;
			document.getElementById("prtAncestor").innerHTML=prtAncestor;
			document.getElementById("prtIntro").innerHTML=prtIntro;
		}
	}

	function prtInfo(){
		$.ajax({
			url: '${PrtUrl}',
			type: 'POST',
			contentType:'application/text',
			dataType: 'json',
			data: params,
			success: function (list) {
				constructTable(list)
			},
			error: function () {
				window.location.href=document.location.href;
			}
		});
	}

	$(document).ready(function () {

		/*var prtId = $('#prtId').val(params);*/

		$("#prtimg").css("display", "none");
		$("#prtfmtree").css("display", "none");

		prtInfo();
	});

	$('#dhinfo').click(function () {
		window.location.href = document.location.href;
	});

	$('#dhtree').click(function () {
		$('#gp_phahe').html("");
		$.ajax({
			url: '${APIIndividual}',
			type: 'POST',
			contentType:'application/text',
			dataType: 'json',
			data: params,
			success: function (result) {

				for (var i in result) {
					var obj = result[i];
					for (var j in obj) {
						var tmp = "<div class=\"rcontent-item item3\" >";
						/*if (j == "branch") {
							var doi = obj[j].split(".").length;
							for (var i = 0; i < doi; i++) {
								tmp += "&nbsp;&nbsp;&nbsp;&nbsp;";
								break;
							}
						}*/
						if (j == "fullName") {
							$('#gp_phahe').append(tmp
									+ "<img align=\"absmiddle\" src=\"/HuongCauPhan/template/adimgs/plus4.gif\" style=\"padding: 0px; margin: 0px; width: 18px; height: 18px;\" id=\"img0\" onclick=\"img1()\">"
									+ "<img src=\"/HuongCauPhan/template/adimgs/m.jpg\" align=\"absmiddle\" style=\"width: 18px; height: 18px;\" id=\"img1\">"
									+ "<button class=\"tree\">" + obj[j] + "</button>"
									+ "</br>"
									+ "</div>");
						}
					}
				}
			},
			error: function () {
				window.location.href = document.location.href;
			}
		});
	});

	/*$("#btn_load").click(function(){
		var age = $("#cbxAge option:selected").text();
		var gender = $('input[name=gender]:checked').val();
		var name = $('#indname').val();
		if(gender==undefined){
			gender =  2;
		}
		var data = {
			individualId:1,
			fullName :name,
			gender:gender,
			dateOfBirth: "1300-1-1",
			dateOfDeath:"1300-1-1" ,
			father:1,
			branch:age ,
			parentageId:"${prid}",
			avatar:""
		};
		$.ajax({
			url: '${APISearchurl}',
			type: 'post',
			contentType: 'application/json',
			data: JSON.stringify(data),
			dataType: 'json',
			success: function(result){
				$('#gp_phahe').html(".");
				for (var i in result) {
					var obj = result[i];
					for (var j in obj) {
						if(age!="Chọn đời"){
							if(j=="branch"){
								if(age != obj[j].split("\.").length){break;}
							}
						}

						if(j=="fullName"){
							$('#gp_phahe').append("<div class=\"rcontent-item item3\">"
									+"<img align=\"absmiddle\" src=\"/HuongCauPhan/template/adimgs/plus4.gif\" style=\"padding: 0px; margin: 0px; width: 18px; height: 18px;\" id=\"img0\" onclick=\"img1()\">"
									+"<img src=\"/HuongCauPhan/template/adimgs/m.jpg\" align=\"absmiddle\" style=\"width: 18px; height: 18px;\" id=\"img1\">"
									+"<button class=\"tree\">"+ obj[j] +"</button>"
									+"</br>"
									+"</div>");
						}
					}
				}
			},
			error: function(error){

			}
		});

	});*/


	function openad() {
		$("#prtfmtree").css("display", "none");
		$("#prtimg").css("display", " none");
		$("#prtif").html("<h3 class=\"crbhead\" id=\"dhfrmtit\">TIN TỨC DÒNG HỌ</h3><div class=\"grb\" id=\"ft_ct\">${pradvertisment}</div>");
	}

	function openalbum() {
		$("#prtfmtree").css("display", "none");
		$("#prtif").html('');
		$("#prtimg").css("display", "block");
	}

	$('#dhtree').click(function () {
		$("#prtif").css("display", "none");
		$("#prtfmtree").css("display", "block");
		$("#prtimg").css("display", "none");
	});
</script>
</body>
</html>