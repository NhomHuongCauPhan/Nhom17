<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-individual"/>
<c:url var="APISearchurl" value="/api-search"/>

<c:url var="WebURL" value="/trang-chu"/>
<c:url var="Adminurl" value="/quan-tri/pha-do"/>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý phả đồ - Gia phả Việt Nam</title>


</head>
<body>
	

			<!-- content -->
			<div class="page_title" style="margin-bottom: 15px">
				<h2 style="padding-right: 860px">Phả Đồ</h2>
			</div>
			<div class="ucp_def_right" id="gp_phahe" style="background:#eeee; width:44%; float:left">
				${FamilyTree}
			</div>
			<div class="ucp_def_right" id="gp_phahe" style="background:#dddd; width:42%;float:left">
				<div class="container-fluid">
					<div class="row" style="padding-bottom:20px;">
						<div class="col-md-offset-2 col-md-3">Đời</div>
						<div class="col-md-4">
							<select id="cbxAge" style="width:130px; background:#dddd ; height:30px !important">
								<option value="">Chọn đời</option>
								<%
									int doi;
									if(request.getAttribute("prlife")!=null){
										doi = (int) request.getAttribute("prlife");
									}else{
										doi=0;
									}
									
									for (int i = 1; i <= doi; i++) {
										out.print("<option value=" + i + ">" + i + "</option>");
									}
								%>
							</select>
						</div>
						<div class="col-md-3">
							<div class="toolbox" style="cursor: pointer;">
								<a id="btn_load" class="ubtn save" style="background:#007bff;color:white">Hiển thị</a>
							</div>
						</div>
					</div>
					<div class="row" style="padding-bottom:20px;">
						<div class="col-md-offset-2 col-md-3">Giới tính</div>
						<div class="col-md-4">
							<input type="radio" name="gender" value="1" />Nam
							<input type="radio" name="gender" value="0" />Nữ
						</div>
					</div>
					<div class="row" style="padding-bottom:20px;">
						<div class="col-md-offset-2 col-md-3">Tên thành viên</div>
						<div class="col-md-4">
							<input id="indname" type="text" style="background:#ffff; padding:14px 5px;" placeholder="Tên thành viên" />
						</div>
						
					</div>	
					<div class="row" style="padding-bottom:20px;background:#aaaa">
						<div class="col-md-offset-2 col-md-3" style="padding-top:20px" >Gia đình không có</div>
						<div class="col-md-4" style="padding-top:20px">
							<input type="radio" name="prtgender" value="1" />Nam
							<input type="radio" name="prtgender" value="0" />Nữ
						</div>
					</div>	
					
					<div class="row" style="padding-bottom:20px;background:#1g1g3g">
						<div class="col-md-offset-2 col-md-3" style="padding-top:20px" >Gia đình có con</div>
						<div class="col-md-4" style="padding-top:20px">
							<input type="radio" name="married" value="1" />Đã có
							<input type="radio" name="married" value="0" />Chưa có
						</div>
					</div>	
				</div>
			</div>
			

	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		
		$("#btn_load").click(function(){
			var age = $("#cbxAge option:selected").text();
			var gender = $('input[name=gender]:checked').val();
			var married = $('input[name=married]:checked').val();
			var prtgender = $('input[name=prtgender]:checked').val();
			var name = $('#indname').val();
			if(gender==undefined){
				gender =  2;
			}
			if(age=='Chọn đời'&&gender==2&&prtgender==undefined&&name==''&&married==''){
				return;
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
					var tmp='<div class=\"rcontent-item item3\" >.';
					if(prtgender=='0'||prtgender=='1'){
						for (var i in result) {
							var tmp1="&nbsp;&nbsp;&nbsp;&nbsp;"	
								+"<img align=\"absmiddle\" src=\"/HuongCauPhan/template/adimgs/plus4.gif\" style=\"padding: 0px; margin: 0px; width: 18px; height: 18px;\" id=\"img0\" onclick=\"img1()\">"
								+"<img src=\"/HuongCauPhan/template/adimgs/m.jpg\" align=\"absmiddle\" style=\"width: 18px; height: 18px;\" id=\"img1\">"
								+"<button class=\"tree\">"+ result[i].fullName +"</button>"
								+"<button class=\"tree tree1\" onclick=\"openedit(\"+item.getIndividualId()+\")\"><img src=\"/HuongCauPhan/template/adimgs/pencil.png\" width=\"14px\" heigh=\"14px\"></button>"
								+"<button class=\"tree tree1\" onclick=\"del(\"+item.getIndividualId()+\",\'\"+item.getFullName()+\"\')\"><img src=\"/HuongCauPhan/template/adimgs/delete.png\" width=\"14px\" heigh=\"14px\"></button>"
								+"</br>"
								+"";
							console.log(result[i]);
							
							var flag=0;
							var check=0;
							for (var j in result) {
								if(result[i].individualId==result[j].father){
									check=1;
									tmp1+="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
									tmp1+=""	
										+"<img align=\"absmiddle\" src=\"/HuongCauPhan/template/adimgs/plus4.gif\" style=\"padding: 0px; margin: 0px; width: 18px; height: 18px;\" id=\"img0\" onclick=\"img1()\">"
										+"<img src=\"/HuongCauPhan/template/adimgs/m.jpg\" align=\"absmiddle\" style=\"width: 18px; height: 18px;\" id=\"img1\">"
										+"<button class=\"tree\">"+ result[j].fullName +"</button>"
										+"<button class=\"tree tree1\" onclick=\"openedit(\"+item.getIndividualId()+\")\"><img src=\"/HuongCauPhan/template/adimgs/pencil.png\" width=\"14px\" heigh=\"14px\"></button>"
										+"<button class=\"tree tree1\" onclick=\"del(\"+item.getIndividualId()+\",\'\"+item.getFullName()+\"\')\"><img src=\"/HuongCauPhan/template/adimgs/delete.png\" width=\"14px\" heigh=\"14px\"></button>"
										+"</br>"
										+"";
									if(result[j].gender==prtgender){
										flag=1;
									}
								}
							}
							if(flag==0&&check==1){
								tmp+=tmp1;
							}
							tmp1='';
						}
						$('#gp_phahe').html(tmp+"</div>");
					}else if(married=='1'||married=='0'){
						for (var i in result) {
							var tmp1="&nbsp;&nbsp;&nbsp;&nbsp;"	
								+"<img align=\"absmiddle\" src=\"/HuongCauPhan/template/adimgs/plus4.gif\" style=\"padding: 0px; margin: 0px; width: 18px; height: 18px;\" id=\"img0\" onclick=\"img1()\">"
								+"<img src=\"/HuongCauPhan/template/adimgs/m.jpg\" align=\"absmiddle\" style=\"width: 18px; height: 18px;\" id=\"img1\">"
								+"<button class=\"tree\">"+ result[i].fullName +"</button>"
								+"<button class=\"tree tree1\" onclick=\"openedit(\"+item.getIndividualId()+\")\"><img src=\"/HuongCauPhan/template/adimgs/pencil.png\" width=\"14px\" heigh=\"14px\"></button>"
								+"<button class=\"tree tree1\" onclick=\"del(\"+item.getIndividualId()+\",\'\"+item.getFullName()+\"\')\"><img src=\"/HuongCauPhan/template/adimgs/delete.png\" width=\"14px\" heigh=\"14px\"></button>"
								+"</br>"
							console.log(result[i]);
							var check=0;
							for (var j in result) {
								if(result[i].individualId==result[j].father){
									check=1;
								}
							}
							if(check==married){
								tmp+=tmp1;
							}
							tmp1='';
						}
						$('#gp_phahe').html(tmp+"</div>");
					}else{
						$('#gp_phahe').html("<div class=\"rcontent-item item3\" >.");
						for (var i in result) {
							   var obj = result[i];
							   for (var j in obj) {
								   if(age!="Chọn đời"){
									   if(j=="branch"){							
										   if(age != obj[j].split("\.").length){break;}
									   }
								   }
								   
								   if(j=="fullName"){
										$('#gp_phahe').append(""	
											+"<img align=\"absmiddle\" src=\"/HuongCauPhan/template/adimgs/plus4.gif\" style=\"padding: 0px; margin: 0px; width: 18px; height: 18px;\" id=\"img0\" onclick=\"img1()\">"
											+"<img src=\"/HuongCauPhan/template/adimgs/m.jpg\" align=\"absmiddle\" style=\"width: 18px; height: 18px;\" id=\"img1\">"
											+"<button class=\"tree\">"+ obj[j] +"</button>"
											+"<button class=\"tree tree1\" onclick=\"openedit(\"+item.getIndividualId()+\")\"><img src=\"/HuongCauPhan/template/adimgs/pencil.png\" width=\"14px\" heigh=\"14px\"></button>"
											+"<button class=\"tree tree1\" onclick=\"del(\"+item.getIndividualId()+\",\'\"+item.getFullName()+\"\')\"><img src=\"/HuongCauPhan/template/adimgs/delete.png\" width=\"14px\" heigh=\"14px\"></button>"
											+"</br>"
											+"</div>");
								   }							  							   							   
							   }
							}
						$('#gp_phahe').append("</div>");
					}
				},
				error: function(error){
					
				}
			});
			
		});

		function openedit(id) {
			window.location.href = "<c:url value='/quan-tri/sua-gia-pha?id="+id+"'/>";
		}
		
	</script>
</body>
</html>