<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIIndividualurl" value="/api-admin-individual"/>
<c:url var="APIurl" value="/api-admin-parentage"/>
<c:url var="WebURL" value="/trang-chu"/>
<c:url var="Adminurl" value="/quan-tri"/>
<!doctype html>
<html>
<head>
<title>Thông tin dòng họ</title>
</head>
<body>

	<!--Content-->
	<div class="ucp_def_right">
		<div class="load_progress"></div>
		<div class="htree" id="htree"></div>
		<div id="float_panel"></div>
		<div class="page_title" style="margin-bottom: 15px">
			<h2>Thông tin dòng họ</h2>
			<div class="toolbox" style="background:#ffff; cursor: pointer;">
				<a id="btn_save" class="ubtn save">Lưu lại</a>
			</div>
		</div>
		<div class="load_progress"></div>
		<table border="0" style="width: 100%; border-collapse: collapse"
			class="ucp_tbl form">
			<tbody>
				<tr>
					<td></td>
					<td id="msg" colspan="5" style="color: blue"></td>
				</tr>
				<tr>
					<td style="width: 110px">Tên dòng họ</td>
					<td style="width: 400px"><input type="text" name="FamilyName"
						id="FamilyName" style="width: 380px"
						value='<c:out value="${ParentageModel.parentageName}"></c:out>'></td>
					<td style="width: 120px">Tên thủy tổ</td>
					<td style="width: 180px"><input type="text" name="Ancestor"
						id="Ancestor"
						value='<c:out value="${ParentageModel.ancestor}"></c:out>'></td>
					<td>Truy cập gần đây:</td>
					<td id="recently"></td>
				</tr>
				<tr>
					<td style="width: 110px">Ngày tế thu (âm lịch)</td>
					<td style="width: 200px"><input type="date" name="AutumnAnniversary"
						id="AutumnAnniversary"
						value='<c:out value="${ParentageModel.culturalAutumnDay}"></c:out>'></td>
					<td style="width: 120px">Ngày tế xuân (âm lịch)</td>
					<td style="width: 160px"><input type="date" name="SpringAnniversary"
						id="SpringAnniversary"
						value='<c:out value="${ParentageModel.culturalSpringDay}"></c:out>'></td>
					<td style="width: 120px">Số thành viên:</td>
					<td id="member_count">${sotv}</td>
				</tr>
				<!-- <c:out value="${prt.address}"></c:out> -->
				<tr>
					<td>Địa chỉ</td>
					<td><select id="cboAddress"
						style="width: 150px; height: 25px; float: left">
							<option value='1'>Quảng Nam</option>
							<option value='2	'>Đà Nẵng</option>
							<option value='3'>Sài Gòn</option>
							<option value='4'>Hà Nội</option>
							<option value='5'>An Giang</option>
							<option value='6'>Bà Rịa Vũng Tàu</option>
							<option value='7'>Bạc Liêu</option>
							<option value='8'>Bắc Cạn</option>
							<option value='9'>Bắc Giang</option>
							<option value='10'>Bắc Ninh</option>
							<option value='11'>Bến Tre</option>
							<option value='12'>Bình Dương</option>
							<option value='13'>Bình Định</option>
							<option value='14'>Bình Dương</option>
							<option value='15'>Bình Định</option>
							<option value='16'>Bình Phước</option>
							<option value='17'>Bình Thuận</option>
							<option value='18'>Cà Mau</option>
							<option value='19'>Cao Bằng</option>
							<option value='20'>Cần Thơ</option>
							<option value='21'>Đắc Lắc</option>
							<option value='22'>Đồng Nai</option>
							<option value='23'>Đồng Tháp</option>
							<option value='24'>Gia Lai</option>
							<option value='25'>Hà Giang</option>
							<option value='26'>Hà Nam</option>
							<option value='27'>Hà Tây</option>
							<option value='28'>Hà Tĩnh</option>
							<option value='29'>Hải Dương</option>
							<option value='30'>Hải Phòng</option>
							<option value='31'>Hòa Bình</option>
							<option value='32'>Hưng Yên</option>
							<option value='33'>Khánh Hòa</option>
							<option value='34'>Kiên Giang</option>
							<option value='35'>Kon Tum</option>
							<option value='36'>Lai Châu</option>
							<option value='37'>Lâm Đồng</option>
							<option value='38'>Lạng Sơn</option>
							<option value='39'>Lào Cai</option>
							<option value='40'>Long An</option>
							<option value='41'>Nam Định</option>
							<option value='42'>Nghệ An</option>
							<option value='43'>Ninh Bình</option>
							<option value='44'>Ninh Thuận</option>
							<option value='45'>Phú Yên</option>
							<option value='46'>Phú Thọ</option>
							<option value='47'>Quảng Bình</option>
							<option value='48'>Quảng Ngãi</option>
							<option value='49'>Quảng Ninh</option>
							<option value='50'>Quảng Trị</option>
							<option value='51'>Sóc Trăng</option>
							<option value='52'>Sơn La</option>
							<option value='53'>Tây Ninh</option>
							<option value='54'>Thái Bình</option>
							<option value='55'>Thái Nguyên</option>
							<option value='56'>Thanh Hóa</option>
							<option value='57'>Thừa Thiên Huế</option>
							<option value='58'>Tiền Giang</option>
							<option value='59'>Trà Vinh</option>
							<option value='60'>Tuyên Quang</option>
							<option value='61'>Vĩnh Long</option>
							<option value='62'>Vĩnh Phúc</option>
							<option value='63'>Yên Bái</option>
					</select></td>
					<td style="width: 110px">Tên trưởng họ</td>
					<td style="width: 200px"><input type="text" name="Head"
						id="Head" value="<c:out value="${ParentageModel.head_of_parentage_name}"></c:out>"></td>


				</tr>
				<tr>
					<td>-----------------</td>
				</tr>
				<tr>
					<td>SDT Ngưởi tạo</td>

					<td style="width: 110px"><input type="text" name="Number"
						id="Number"
						value='<c:out value="${ParentageModel.headOfParentageNumber}"></c:out>'></td>
					<td style="width: 200px">Email Người tạo</td>
					<td style="width: 120px"><input type="text" name="Email"
						id="Email"
						value='<c:out value="${ParentageModel.headOfParentageEmail}"></c:out>'></td>
					

				</tr>

				<tr>
					<td>-----------------</td>
				</tr>
				<tr>
				<tr>
					<td style="vertical-align: top">Lời giới thiệu</td>
					<td colspan="3"><textarea name="Description" id="Description"
							style="height: 30px; width: 580px"><c:out
								value="${ParentageModel.historyOfParentage}"></c:out></textarea>
				</tr>
			</tbody>
		</table>
	</div>


	<script type="text/javascript">
		function lastVisit() {
			var lastvisit = new Object()
			lastvisit.firstvisitmsg = "This is your first visit to this page. Welcome!" //Change first visit message here
			lastvisit.subsequentvisitmsg = "<b>[displaydate]</b>" // Change subsequent visit message here

			lastvisit.getCookie = function(Name) { // get cookie value
				var re = new RegExp(Name + "=[^;]+", "i"); // construct RE to search for target name/value pair
				if (document.cookie.match(re)) // if cookie found
					return document.cookie.match(re)[0].split("=")[1] // return its value
				return "";
			}
			lastvisit.setCookie = function(name, value, days) { // set cookie value
				var expireDate = new Date()
				//set "expstring" to either future or past date, to set or delete cookie, respectively
				var expstring = expireDate.setDate(expireDate.getDate()
						+ parseInt(days))
				document.cookie = name + "=" + value + "; expires="
						+ expireDate.toGMTString() + "; path=/";
			}

			lastvisit.showmessage = function() {
				if (lastvisit.getCookie("visitcounter") == "") { // if first visit
					//lastvisit.setCookie("visitcounter", 2, 730) // set "visitcounter" to 2 and for 730 days (2 years)
					$("#recently").html(lastvisit.firstvisitmsg)
				} else
					$("#recently").html(
							lastvisit.subsequentvisitmsg.replace(
									"\[displaydate\]", new Date()
											.toLocaleString()))
			}
			lastvisit.showmessage()
		}

		function ucFirstAllWords(str) {
			var pieces = str.split(" ");
			for (var i = 0; i < pieces.length; i++) {
				var j = pieces[i].charAt(0).toUpperCase();
				pieces[i] = j + pieces[i].substr(1);
			}
			return pieces.join(" ");
		}
		
		var editor = '';
		$(document).ready(function() {
			loadCBO();
			$("#recently").html(document.cookie);
			lastVisit();
			editor = CKEDITOR.replace( 'Description');
		});

		function loadCBO() {
			$("select option").each(function() {
				if ($(this).text() == "<c:out value='${ParentageModel.address}'></c:out>")
					$(this).attr("selected", "selected");
			});
		}
		function open_edit() {

			$('.form-group').removeClass('has-error');
			$('#edit').modal('show'); // show bootstrap modal

		}

		$("#btn_save").click(function () {
			$("#msg").html('<img src="<c:url value='/template/adimgs/loading1.gif'/>">Đang xử lý');
			var parentage_name = $("#FamilyName").val().trim();
			var head_of_parentage_name = $("#Head").val().trim();
			var ancestor = $("#Ancestor").val().trim();
			var cultural_spring_day = $("#SpringAnniversary").val().trim();
			var cultural_autumn_day = $("#AutumnAnniversary").val().trim();
			var parentageid = "<c:out value='${ParentageModel.parentageId}'></c:out>";
			var mess = "";

			if (parentage_name == "") {
				mess += "Tên họ tộc không được để trống. \n";
			}
			if (head_of_parentage_name == "") {
				mess += "Tên trưởng tộc không được để trống. \n";
			}
			if (ancestor == "") {
				mess += "Tên thủy tổ không được để trống. \n";
			}
			
			if (mess != "") {
				$("#msg").html("<div class=\"alert alert-danger\" role=\"alert\">"+mess+"</div>");
				return;
			}
			
			var data = {
					parentageId : parentageid,
					address : $("#cboAddress option:selected").text(),
					parentageName : $("#FamilyName").val(),
					head_of_parentage_name : $("#Head").val(),
					culturalSpringDay : $("#SpringAnniversary").val(),
					culturalAutumnDay : $("#AutumnAnniversary").val(),
					headOfParentageNumber : $("#Number").val(),
					headOfParentageEmail : $("#Email").val(),
					ancestor : $("#Ancestor").val(),
					historyOfParentage : editor.getData(),
					accountId : "<c:out value='${model.id}'></c:out>"
			}
			
			
			if(parentageid!=""){
				$.ajax({
					url: '${APIurl}',
					type: 'put',
					contentType: 'application/json',
					data: JSON.stringify(data),
					dataType: 'json',
					success: function(result){
						window.location.href = "${Adminurl}";
					},
					error: function(error){
						window.location.href = "${Adminurl}?error=updatefailure";
					}
				});
			}else{
				
				$.ajax({
					url: '${APIurl}',
					type: 'post',
					contentType: 'application/json',
					data: JSON.stringify(data),
					dataType: 'json',
					success: function(result){
						var ancestor = {
								individualId : "",
								fullName : $("#Ancestor").val(),
								gender : 1,
								dateOfBirth : "2019-11-22",
								dateOfDeath : "2019-11-22",
								father : 0,
								branch : 1,
								parentageId : result,
								avatar : "/HuongCauPhan/template/adimgs/default.png"
							};
						$.ajax({
							url: '${APIIndividualurl}',
							type: 'put',
							contentType: 'application/json',
							data: JSON.stringify(ancestor),
							dataType: 'json',
							success: function(result){
								window.location.href = "${Adminurl}";	
							},
							error: function(error){
								window.location.href = "${Adminurl}?error=createfailure";
							}
						});
					},
					error: function(error){
						window.location.href = "${Adminurl}?error=createfailure";
					}
				});
			}

		});

		
		
	</script>
</body>
</html>