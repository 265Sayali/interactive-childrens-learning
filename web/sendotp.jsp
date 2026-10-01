<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, javax.mail.*, javax.mail.internet.*, javax.activation.*" %>

<%
    String email = request.getParameter("a");
    final String username = System.getenv("APP_EMAIL"); // Your Gmail address
    final String password = System.getenv("APP_EMAIL_PASSWORD"); // Use an app password if 2FA is enabled
    String smtphost = "smtp.gmail.com";
    String from = "your-email@gmail.com"; // Sender's email
    String to = email; // Recipient's email

    // Generate a random 4-digit OTP
    int otp = (int) (Math.random() * (9999 - 1000 + 1) + 1000);

    // Ensure OTP is positive (in case of negative values)
    if (otp < 0) {
        otp = otp * -1;
    }

    String body = "Your OTP is: " + otp;
    
    Transport myTransport = null;
    try {
        Properties props = System.getProperties();
        props.put("mail.smtp.user", username);
        props.put("mail.smtp.host", smtphost);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        // Get the session with authentication
        Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(username, password);
            }
        });

        // Create a new message
        Message msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(from));
        InternetAddress[] address = {new InternetAddress(to)};
        msg.setRecipients(Message.RecipientType.TO, address);
        msg.setSubject("Your OTP for Registration");
        msg.setText(body);
        msg.setSentDate(new java.util.Date());

        // Send the message
        myTransport = mailSession.getTransport("smtp");
        myTransport.connect(smtphost, username, password);
        msg.saveChanges();
        myTransport.sendMessage(msg, msg.getAllRecipients());
        myTransport.close();

        // Send OTP back to the client (AJAX will handle it)
        out.println(otp); // Sending OTP as response to the frontend
        
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>

