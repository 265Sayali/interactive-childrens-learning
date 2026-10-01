/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EmailSend;

    import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author 
 */
public class Email {
    public static void sendEmail(String recipient, String subject, String messageText) {
        final String senderEmail = System.getenv("APP_EMAIL");  // Change to your email
        final String senderPassword = System.getenv("APP_EMAIL_PASSWORD"); // Change to your password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        //props.put("mail.smtp.port", "587");
        props.put("mail.debug", "true");  // Enable Debug Mode
        props.put("mail.smtp.port", "587"); // Use 465 for SSL
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // Ensures compatibility

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });
       

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);
            message.setText(messageText);

            Transport.send(message);
            System.out.println("Email Sent Successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
