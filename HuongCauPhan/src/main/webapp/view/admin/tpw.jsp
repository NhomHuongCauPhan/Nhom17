<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-account"/>
<c:url var="WebURL" value="/trang-chu"/>
<c:url var="Adminurl" value="/quan-tri/mat-khau"/>
<!DOCTYPE html>
<html>
<head>
<title>Đổi mật khẩu - Gia phả Việt Nam</title>

</head>
<body>


            

<div class="page_title" style="margin-bottom: 15px">
    <h2>Đổi mật khẩu đăng nhập</h2>
</div>
<div class="message"></div>

	<div class="form_ctrl">
	    <table border="0" cellpadding="0" cellspacing="10" class="compose">
	        <tbody><tr>
	            <td class="ar" style="width: 100px">Mật khẩu cũ</td>
	            <td class="al" style="width: 300px"><input name="password" type="password" id="OldPwd" style="width:200px;"></td>
	        </tr>
	        <tr>
	            <td class="ar">Mật khẩu mới</td>
	            <td class="al"><input name="new_password" type="password" id="NewPwd" style="width:200px;"></td>
	        </tr>
	        <tr>
	            <td class="ar">Xác nhận Mật khẩu mới</td>
	            <td class="al"><input name="confirm_password" type="password" id="Confirm" style="width:200px;"></td>
	        </tr>
	        <tr>
	            <td class="ar"></td>
	            <td class="al"><input type="button" value="Đồng ý" id="btnOK" class="button w70 op" style="height:28px;"></td>
	        </tr>
	    </tbody></table>
	</div>
	<script>
	$('#btnOK').click(function(){
		var oldpass = $('#OldPwd').val();
		var newpass = $('#NewPwd').val();
		var confirm = $('#Confirm').val(); 
		
		if(newpass != confirm){
			alert('Kiển tra lại mật khẩu!');
		}else{
			var data = {
					id : "",
					accountName : "${account.accountName}",
					password :  $('#OldPwd').val(),
					role : 0,
					status : 0	
				};
			
			var data1 = {
					id : "",
					accountName : "${account.accountName}",
					password : $('#NewPwd').val(),
					role : 0,
					status : 0	
				};
			
			$.ajax({
				url: '${APIurl}',
				type: 'post',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function(result){
					if(result!=null){
						$.ajax({
							url: '${APIurl}',
							type: 'delete',
							contentType: 'application/json',
							data: JSON.stringify(data1),
							dataType: 'json',
							success: function(result){
								alert("Đổi mật khẩu thành công.");
							},
							error: function(error){
								window.location.href = "${Adminurl}?error=updatefailure";
							}
						});
					}else{
						alert("Sai mật khẩu");
					}
				},
				error: function(error){
					window.location.href = "${Adminurl}?error=failure";
				}
			});
			
		}
	});
	</script>
</body>
</html>
