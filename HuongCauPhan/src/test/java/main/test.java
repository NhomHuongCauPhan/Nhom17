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

}
