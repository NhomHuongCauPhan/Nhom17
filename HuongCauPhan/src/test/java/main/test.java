package main;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class test {
	 public static final String HOST_NAME = "smtp.gmail.com";
	 
	    public static final String SSL_PORT = "465"; // Port for SSL
	 
	    public static final String TSL_PORT = "587"; // Port for TLS/STARTTLS
	 
	    public static final String APP_EMAIL = "msluudiecphi@gmail.com"; // your email
	 
	    public static final String APP_PASSWORD = "hieu300198"; // your password
	 
	    public static final String RECEIVE_EMAIL = "phamvanhieu300198@gmail.com"; 
	public static void main(String[] args) {
		// Get properties object
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.host", HOST_NAME);
        props.setProperty("mail.smtp.socketFactory.port", SSL_PORT);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.port", SSL_PORT);
 
        // get Session
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(APP_EMAIL,APP_PASSWORD);
            }
        });
 
        // compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(RECEIVE_EMAIL));
            message.setSubject("Testing Subject");
            message.setText("Welcome to gpcoder.com");
 
            // send message
            Transport.send(message);
 
            System.out.println("Message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
	}
	
	/*
var tmp="";
						for (var i in result) {					
							tmp="1"+result[i].fullName;
							var flag=0;
							var check=0;
							for (var j in result) {
								if(result[j].father==result[i].individualId){
									check=1;
									tmp+="2"+result[j].fullName;
									if(result[j].gender==1){
										flag=1;
									}
								}
								
							}
							if(flag==0&&check==1){
								console.log(tmp);
							}
							tmp='';
						}
*
*
*/
/*
 var tmp='<div class=\"rcontent-item item3\" >';
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
							for (var j in result) {
								if(result[i].individualId==result[j].father){
									tmp1+="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
									tmp1+=""	
										+"<img align=\"absmiddle\" src=\"/HuongCauPhan/template/adimgs/plus4.gif\" style=\"padding: 0px; margin: 0px; width: 18px; height: 18px;\" id=\"img0\" onclick=\"img1()\">"
										+"<img src=\"/HuongCauPhan/template/adimgs/m.jpg\" align=\"absmiddle\" style=\"width: 18px; height: 18px;\" id=\"img1\">"
										+"<button class=\"tree\">"+ result[i].fullName +"</button>"
										+"<button class=\"tree tree1\" onclick=\"openedit(\"+item.getIndividualId()+\")\"><img src=\"/HuongCauPhan/template/adimgs/pencil.png\" width=\"14px\" heigh=\"14px\"></button>"
										+"<button class=\"tree tree1\" onclick=\"del(\"+item.getIndividualId()+\",\'\"+item.getFullName()+\"\')\"><img src=\"/HuongCauPhan/template/adimgs/delete.png\" width=\"14px\" heigh=\"14px\"></button>"
										+"</br>"
										+"";
									if(result[j].gender==1){
										flag=1;
									}
								}
							}
							if(flag==1){
								tmp+=tmp1;
								tmp1='';
							}
						}
						$('#gp_phahe').html(tmp+"</div>");
*/
}
