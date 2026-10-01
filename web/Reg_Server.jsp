<%@page import="p1.User1"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.io.*, java.security.*, org.hibernate.*, EmailSend.Email" %>
<%
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String parents = request.getParameter("parents");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");

    // Validate mobile number
    if (mobile == null || !mobile.matches("\\d{10}")) {
        out.println("<script>alert('Invalid mobile number. Please enter a valid 10-digit number.'); window.history.back();</script>");
        return;
    }

    long mobileno = Long.parseLong(mobile);

    // Check if passwords match
    if (!password.equals(confirmPassword)) {
        out.println("<script>alert('Passwords do not match!'); window.history.back();</script>");
        return;
    }

    // Hash the password using SHA-256
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    byte[] hashedPassword = md.digest(password.getBytes());
    StringBuilder hexString = new StringBuilder();
    for (byte b : hashedPassword) {
        hexString.append(String.format("%02x", b));
    }
    String hashedPasswordStr = hexString.toString();

    // Create Hibernate session
    SessionFactory sf = new Configuration().configure().buildSessionFactory();
    Session s = sf.openSession();
    Transaction t = s.beginTransaction();

    try {
        // Creating a new User object
        User1 newUser = new User1();
        newUser.setName(name);
        newUser.setAge(age);
        newUser.setParents(parents);
        newUser.setMobile(mobileno);
        newUser.setEmail(email);
        newUser.setPassword(hashedPasswordStr); // Store hashed password
        s.save(newUser);
        t.commit();

        
       if (newUser != null) {
        // Send confirmation email
        String subject = "Welcome to Local Artisans!";
        String messageText = "Dear " + name + ",\n\n"
                + "Thank you for registering on Local Artisans. "
                + "We are excited to have you!\n\n"
                + "Best Regards,\nLocal Artisans Team";

        Email.sendEmail(email, subject, messageText);
         }
        // Set session and redirect
        session.setAttribute("username", name);
        out.println("<script>alert('Registered Successfully! A confirmation email has been sent.'); window.location.assign('home.jsp');</script>");
    } catch (Exception e) {
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.history.back();</script>");
    } finally {
        s.close();
        sf.close();
    }
%>
