<%@page import="p1.User1"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>

<%
    try
    {
    String email = request.getParameter("email");
     String password  = request.getParameter("password");
    String confirm_password = request.getParameter("confirm_password");
if(password.equals(confirm_password))
{
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
       Session s = sf.openSession();
       Transaction t = s.beginTransaction();

    Query query = s.createQuery("update User1 set password =:pass where email=:email");

            query.setParameter("pass", password);
            query.setParameter("email", email);
                out.println("<script>alert('passowrd Reset');window.location.assign('login.jsp);</script>");
            t.commit();
            
            s.close();
            sf.close();
}
else{
    out.println("<script>alert('passowrd not match');window.location.assign('forgot_passowrd.jsp);</script>");
}
    }
    catch(Exception e)
    {
        out.println(e);
    }

%>