<%@page import="java.lang.System.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.io.*"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>
<%@page import="p1.Feedback1"%>

<% 
  String username = request.getParameter("username");
    String email = request.getParameter("email");
  String comment = request.getParameter("comment");
  int ranking = Integer.parseInt(request.getParameter("ranking"));
  
    //  if(request.getParameter("submit") != null) {
   SessionFactory sf = new Configuration().configure().buildSessionFactory();
    Session s = sf.openSession();
    Transaction t = s.beginTransaction();
    
    Feedback1 fb=new Feedback1();
    fb.setUsername(username);
    fb.setComment(comment);
    fb.setRanking(ranking);
    fb.setEmail(email);
   s.persist(fb);
        t.commit();
    //  }
  out.println("<script>alert('Feedback received! Thank you!! ' ); window.location='home.jsp';</script>");
%>
