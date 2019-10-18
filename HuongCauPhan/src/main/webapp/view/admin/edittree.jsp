<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-individual"/>
<c:url var="WebURL" value="/trang-chu"/>
<c:url var="Adminurl" value="/quan-tri/sua-gia-pha"/>
<!doctype html>
<html>
<head>
<title>Quản Lý Phả Đồ</title>

</head>
<body>
	


			<div class="dlg_title">
				Thành viên:
				<c:out value="${IndividualModel.fullName}"></c:out>
				<input type="button" id="btn_back" value="Trở lại" onclick="back()"
					style="float: right">
			</div>
			<!-- edit -->
			<div class="ucp_def_right " id="dlg_tmform"
				style="width: 43.4%; float: left">
				<div class="dlg_title">Hậu duệ</div>
				<div class="dlg_content">
					<div class="frm_loadstatus" style="display: none"></div>
					<div class="tabct">
						<div class="ctab" id="tab1">
							<table border="0" style="width: 100%" class="frm_data">
								<tbody>
									<tr>
										<td><input type="hidden" value="68097" id="hdpr"></td>
										<td colspan="3" id="update_msg"></td>
									</tr>
									<tr>
										<td style="width: 85px">Họ và tên</td>
										<td><input type="text" style="width: 270px"
											name="FullName" id="FullName"></td>
										<td rowspan="4" style="width: 110px; vertical-align: top">
											<form id="frm1" method="POST" action="<c:url value='/api-admin-image?id=${IndividualModel.individualId}'/>" enctype="multipart/form-data">
												<img id="avatar" name="avatar" style="width: 100%; border: 1px solid #ccc; max-height: 130px" src="<c:if test='${empty image1}'><c:url value='/template/adimgs/default.png' /></c:if><c:if test='${not empty image1 }'><c:url value='/template/adimgs/${image1}'/></c:if>" /> 
												<input type="file" onchange="changeimg(event)" id="real" name="real" accept=".png, .jpg, .jpeghidden " hidden="hidden">
												<input type="text" name="addchild" value="1" hidden="hidden" />
											</form>
										</td>
										<td rowspan="4" style="vertical-align: top"><a
											href="javascript:choseimgs()" id="btn_changeimg"
											class="aubtn browse">Chọn ảnh</a></td>
									</tr>
									<tr>
										<td>Tên Vợ/Chồng</td>
										<td><input type="text" name="PartnerName"
											id="PartnerName" style="width: 270px"></td>
									</tr>
									<tr>
										<td>Ngày sinh</td>
										<td><input type="date" style="width: 100px"
											name="BirdDate" id="BirdDate"></td>
									</tr>
									<tr>
										<td>Con thứ</td>
										<td><select id="cboOrderInFamily"
											style="width: 105px; height: 25px"><option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option></select> <span class="legend">(Thứ
												tự trong gia đình)</span></td>
									</tr>
									<tr>
										<td>Giới tính</td>
										<td><select id="cboGender"
											style="width: 105px; height: 25px">
												<option value="0">Nữ</option>
												<option value="1" selected="selected">Nam</option>
										</select></td>
									</tr>
									<tr>
										<td>Trạng thái</td>
										<td style="width: 280px"><select id="cboLiveStatus"
											onchange="change()"
											style="width: 105px; height: 25px; float: left">
												<option selected="selected" value="1">Còn sống</option>
												<option value="2">Đã mất</option>
										</select>
									</tr>
									<tr>
									    <td></td>
										<td>
										<div id="rip_box" class="rip_box"
												style="padding-left: 10px; float: left; display: none">
												Ngày mất:        <input type="date" style="width: 120px"
													name="RipDate" id="RipDate">
											</div></td>
									</tr>
									<tr>
										<td></td>
										<td colspan="3"
											style="padding-top: 15px !important; vertical-align: top">
											<input type="button" id="btn_save" onclick="addind()"
											value="Thêm mới" style="float: left">
										</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>

			<!-- info -->

			<div class="ucp_def_right " id="dlg_tmform"
				style="width: 43%; float: left">
				<div class="dlg_title">Thông tin thành viên</div>
				<div class="dlg_content">
					<div class="frm_loadstatus" style="display: none"></div>
					<div class="tabct">
						<div class="ctab" id="tab1">
							<table border="0" style="width: 100%" class="frm_data">
								<tbody>
									<tr>
										<td><input type="hidden" value="68097" id="hdpr"></td>
										<td colspan="3" id="update_msg"></td>
									</tr>
									<tr>
										<td style="width: 85px">Họ và tên</td>
										<td><input type="text" style="width: 270px"
											name="FullName2" id="FullName2"
											value="<c:out value='${indname}'/>"></td>
										<td rowspan="4" style="width: 110px; vertical-align: top">
											<form id="frm" method="POST" action="<c:url value='/api-admin-image?flag=1&id=${IndividualModel.individualId}'/>" enctype="multipart/form-data" >
												<img id="avatar1" name="avatar1" style="width: 100%; border: 1px solid #ccc; max-height: 130px" src="<c:if test='${empty image}'>${IndividualModel.avatar }</c:if><c:if test='${not empty image }'><c:url value='/template/adimgs/${image}'/></c:if>" /> 
												<input type="file" onchange="changeimg1(event)" id="real1" name="real1" accept=".png, .jpg, .jpeg" hidden="hidden" />
											</form>
										</td>
										<td rowspan="4" style="vertical-align: top"><a
											onclick="choseimgs1()" id="btn_changeimg1"
											class="aubtn browse">Chọn ảnh</a> </td>
									</tr>
									<tr>
										<td>Tên Vợ/Chồng</td>
										<td>
											<input type="text" name="PartnerName2" id="PartnerName2" value="<c:out value='${indpartnername}'/>" style="width: 270px" />
										</td>
									</tr>
									<tr>
										<td>Ngày sinh</td>
										<td><input type="date" style="width: 100px"
											name="BirdDate2" id="BirdDate2"
											value="<c:out value="${IndividualModel.dateOfBirth}"/>"></td>
									</tr>
									<tr>
										<td>Ngày mất</td>
										<td><input type="date" style="width: 100px"
											name="DeathDate2" id="DeathDate2"
											value="<c:out value="${IndividualModel.dateOfDeath}"/>"></td>
									</tr>
									<tr>
										<td>Giới tính</td>
										<td><select id="cboGender2"
											style="width: 105px; height: 25px">
												<option value="0">Nữ</option>
												<option value="1" selected="selected">Nam</option>
										</select></td>
									</tr>
									<tr>
										<td>Bố & Mẹ:</td>
										<td><c:out value="${parent.fullName}" /></td>
									</tr>
									<tr>
										<td>Anh chị em:</td>
										<td>
											<c:forEach items="${brother}" var="item">
												<c:out value="${item.fullName}" />
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td>Con:</td>
										<td>
											<c:forEach items="${children}" var="item">
												<c:out value="${item.fullName}" /> // 
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td>Đời thứ:</td>
										<td><c:out value="${indorder}" /></td>
									</tr>
									<tr>
										<td></td>
										<td colspan="3"
											style="padding-top: 15px !important; vertical-align: top">
											<input type="button" onclick="updateind()" value="Cập nhật"
											style="float: left">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div style="" id="frm_msg"></div>
		


	<script type="text/javascript">
		$(document).ready(function() {
			$("#cboGender2 option").each(function() {
				if ($(this).val() == "<c:out value="${IndividualModel.gender}"/>")
					$(this).attr("selected", "selected");
			});
		});

		//chọn ảnh

		function choseimgs1() {
			var real1 = document.getElementById("real1");
			real1.click();
		}

		function changeimg1(evt) {

			evt.stopPropagation();
			evt.preventDefault();
			var files = evt.target.files;
			var file = files[0];
			var fileReader = new FileReader();

			fileReader.onload = function(progressEvent) {
				var url = fileReader.result;
				var myImg = document.getElementById("avatar1");
				myImg.src = url;
			}
			fileReader.readAsDataURL(file);
			
			var form = document.getElementById("frm");
			form.submit();
		}

		function choseimgs() {
			var real = document.getElementById("real");
			real.click();
		}

		function changeimg(evt) {
			evt.stopPropagation();
			evt.preventDefault();
			var files = evt.target.files;
			var file = files[0];
			var fileReader = new FileReader();

			fileReader.onload = function(progressEvent) {
				var url = fileReader.result;
				var myImg = document.getElementById("avatar");
				myImg.src = url;
			}
			fileReader.readAsDataURL(file);
			var form = document.getElementById("frm1");
			form.submit();
		}

		function updateind() {
			$("#frm_msg").html('<img src="<c:url value='/template/adimgs/loading1.gif'/>">Đang xử lý..');
			var fuln;
			if ($("#PartnerName2").val() != "") {
				fuln = ($("#FullName2").val()) + " & "
						+ ($("#PartnerName2").val());
			} else {
				fuln = $("#FullName2").val();
			}
			if (fuln == "") {
				alert("Tên thành viên không được để trống");
				$("#frm_msg").html('');
				return;
			}

			var data = {
					individualId : "${IndividualModel.individualId}",
					fullName : fuln,
					gender : $("#cboGender2").val(),
					dateOfBirth : $("#BirdDate2").val(),
					dateOfDeath : $("#DeathDate2").val(),
					father : "",
					branch : "",
					parentageId : "",
					avatar : document.getElementById("avatar1").src
					
				};
			
			$.ajax({
				url: '${APIurl}',
				type: 'post',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function(result){
					window.location.href = "${Adminurl}?id=${IndividualModel.individualId}";
				},
				error: function(error){
					window.location.href = "${Adminurl}?id=${IndividualModel.individualId}&error=updatefailure";
				}
			});

				

		}
		
		function addind() {
			$("#frm_msg").html(
					'<img src="<c:url value='/template/adimgs/loading1.gif'/>">');
			if ($("#FullName").val() == "") {
				$("#frm_msg").html('');
				alert("Tên thành viên không được để trống");
				return;
			}			
			var fuln;
			if ($("#PartnerName").val() != "") {
				fuln = ($("#FullName").val()) + " & "
						+ ($("#PartnerName").val());
			} else {
				fuln = $("#FullName").val();
			}

			var data = {
					individualId : "",
					fullName : fuln,
					gender : $("#cboGender").val(),
					dateOfBirth : $("#BirdDate").val(),
					dateOfDeath : $("#RipDate").val(),
					father : "<c:out value='${IndividualModel.individualId}'/>",
					branch : "<c:out value='${IndividualModel.branch}'/>."
						+ $("#cboOrderInFamily option:selected").val(),
					parentageId : "<c:out value='${IndividualModel.parentageId}'/>",
					avatar : document.getElementById("avatar").src
				};
				
			$.ajax({
				url: '${APIurl}',
				type: 'put',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function(result){
					if(result=="true"){
						window.location.href = "${Adminurl}?id=${IndividualModel.individualId}";
						alert("Đã thêm "+fuln);
					}else{
						alert("trùng thứ tự trong gia đình!");
						$("#frm_msg").html('');
					}
				},
				error: function(error){
					window.location.href = "${Adminurl}?id=${IndividualModel.individualId}&error=createfailure";
				}
			});
		}

		function change() {
			var rip = document.getElementsByClassName("rip_box");
			if (($("#cboLiveStatus option:selected").val()) === "2") {
				rip[0].style = "";
			} else {
				rip[0].style = "display:none";
			}
		}
		

		function back() {
			window.location.href = "<c:url value='/quan-tri/pha-do'/>";
		}
	</script>
</body>
</html>