<%@page import="javax.sql.rowset.serial.SerialBlob"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Clob"%>
<%@page import="p1.User1"%>
<%@page import="p1.Feedback1"%>
<%@page import="p1.Quiz"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>
<%@page import="java.util.List"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal Dashboard</title>
    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            color: #343a40;
        }

        .navbar {
            background: #007bff;
            color: white;
            padding: 1.5em;
            text-align: center;
            font-size: 1.8em;
            font-weight: 600;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

       

        .sidebar {
            width: 250px;
            background: #343a40;
            color: white;
            padding: 1.5em 1em;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto;
            transition: all 0.3s ease-in-out;
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            margin: 15px 0;
            padding: 15px;
            background: #495057;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover, .sidebar a.active {
            background: #007bff;
            transform: scale(1.05);
        }
        #dashboard{
            margin-left: 20px;

        }
        .content {
            margin-left: 250px;
            padding: 2em;
            width: calc(100% - 250px);
            transition: all 0.3s ease-in-out;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            animation: fadeInUp 0.5s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .stats div {
            background: #007bff;
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .stats div:hover {
            transform: scale(1.1);
        }

        .stats h3 {
            margin-bottom: 10px;
            font-size: 1.5em;
        }

        .stats p {
            font-size: 2em;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
        }

        table, th, td {
            border: 1px solid #dee2e6;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background: #f8f9fa;
        }

        button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: #0056b3;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .section {
            position: relative; 
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);

         }
        .section.show {
            display: block;
        }

    </style>
</head>
<body>
    <div class="navbar">Admin Dashboard</div>

    <div class="container">
        <div class="sidebar">
            <a href="#dashboard" onclick="showSection('dashboard', this)">Dashboard</a>
            <a href="#users" onclick="showSection('users', this)">User Management</a>
            <a href="#feedback" onclick="showSection('feedback', this)">Feedback & Support</a>
        </div>

        <div class="content">
            <div id="dashboard" class="section">
                <h2>Dashboard Overview</h2>
                <div class="card stats">
                    <div>
                        <h3>Registered Users</h3>
                        <%
                 SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Transaction t = s.beginTransaction(); 

                Query q1 = s.createQuery("Select count(*) FROM User1");
                Long userCount = (Long) q1.uniqueResult();

                         %>
                         <p id="registeredUsers"><%=userCount%></p>
                    </div>
                  
                    <div>
                        <h3>Total Quizzes</h3>
                        <%
                        Query q2 = s.createQuery("Select count(*) FROM QuizScore");
                Long quizcount = (Long) q2.uniqueResult();
                        %>
                        <p id="totalQuizzes"><%=quizcount%></p>
                    </div>
                    <div>
                        <h3>Total Games</h3>
                        <%
                        Query q3 = s.createQuery("Select count(*) FROM GameScore");
                Long gamecount = (Long) q3.uniqueResult();
                        %>
                        <p id="totalGames"><%=gamecount%></p>
                    </div>
                </div>
            </div>

 <div id="users" class="section" style="display:none;">
                <h2>User Management</h2>
                <div class="card">
                    <table>
                      <thead>
                         <tr>
                          <th>Name</th>
                          <th>Age</th>
                          <th>parents Name</th>
                          <th>Mobile Number</th>
                          <th>Email</th>
                        </tr>
                      </thead>
                      <tbody>

                       <%
                // Initialize Hibernate session
               

                // Create Hibernate query to fetch all Student data
                List<User1> studentList = s.createQuery("FROM User1").list();
                
                // Loop through the list and display each student in a table row
                for (User1 student : studentList) {
%>
                        <tr>
                        <td><%= student.getName()%></td>
                        <td><%= student.getAge()%></td>
                        <td><%= student.getParents()%></td>
                        <td><%= student.getMobile()%></td>
                        <td><%= student.getEmail()%></td>
                        <td>
                            <form method="post" style="display:inline;">
                                <input type="hidden" name="deleteUsername" value="<%= student.getName() %>">
                                <button type="submit" onclick="return confirm('Are you sure you want to delete <%= student.getName() %>?');">Delete</button>
                            </form>
                        </td>  
                        </tr>
            <%
            }
            %>
                        
</tbody>
</table>
            <%
             
            String deleteUsername = request.getParameter("deleteUsername");
    if (deleteUsername != null && !deleteUsername.isEmpty()) {

            Query q4 = s.createQuery("DELETE FROM User1 WHERE name = :username");
            q4.setParameter("username", deleteUsername);
            
            int result = q4.executeUpdate();
            t.commit();
            
            if (result > 0) {               
                out.println("<script>alert('User " + deleteUsername + " deleted successfully.'); window.location='admin.jsp';</script>");
            } else {
                out.println("<script>alert('User not found.'); window.location='admin.jsp';</script>");
            }
}
                            
            %>
           </div>
     </div>
           
  <div id="quiz" class="section" style="display:none;">
            <h2>Quiz Management</h2>
        <div class="card">
            <form action="" method="post" enctype="multipart/form-data" style="display:inline;">
                <label>Quiz Name</label><br>
                <input type="text" name="quiz_name" required><br><br>
                <label>Question</label><br>
                <input type="text" name="question" required><br><br>
                <label>Upload Image</label><br>
                <input type="file" name="image"><br><br>
                <label>Options</label><br>
                <input type="text" name="option1" required>
                <input type="text" name="option2" required>
                <input type="text" name="option3" required><br><br>
                <label>Correct answer</label><br>
                <input type="text" name="answer" requied><br>
        <input type="hidden" name="addquiz" value="1" placeholder="Enter Quiz " >
        <button type="submit"  class="btn btn-success">Add quiz</button>
        
            </form>6
        </div>
        </div>
          <div> 
   <%
        // Handle category addition
           String addquiz = request.getParameter("addquiz");
        if (addquiz != null && !addquiz.isEmpty()) {

    try{
            String quiz_name = request.getParameter("quiz_name");
            String question = request.getParameter("question");
            String image = request.getParameter("image");
            String option1 = request.getParameter("option1");
            String option2 = request.getParameter("option2");
            String option3 = request.getParameter("option3");
            String answer = request.getParameter("answer");
       
            out.println(quiz_name);
            Part filePart = request.getPart("image");
            InputStream inputStream = null;
            byte[] imageBytes = null;

            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                int bytesRead;
                byte[] data = new byte[1024];
                while ((bytesRead = inputStream.read(data, 0, data.length)) != -1) {
                    buffer.write(data, 0, bytesRead);
                }
                imageBytes = buffer.toByteArray();
            }
            
            
            Quiz newquiz=new Quiz();
            newquiz.setQuiz_name(quiz_name);
            newquiz.setQuestion(question);
            newquiz.setAnswer(answer);
            newquiz.setOption1(option1);
            newquiz.setOption2(option2);
            newquiz.setOption3(option3);
           if (imageBytes != null) {
                newquiz.setImage(new SerialBlob(imageBytes)); // Store as Blob
            }


        s.save(newquiz);
        out.println("saved");
          
         out.println("<script>alert('Quiz added successfully!'); window.location.href='quiz.jsp';</script>");
          
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
            e.printStackTrace();
        }
        }
  
%>
</div>
            <div id="content" class="section" style="display:none;">
                <h2>Content Management</h2>
                <div class="card">
                    <h3>Add New Lesson</h3>
                    <form>
                        <input type="text" placeholder="Lesson Title" required style="width: 100%; padding: 10px; margin: 10px 0; border-radius: 8px; border: 1px solid #ccc;"><br>
                        <input type="file" required style="width: 100%; padding: 10px; margin: 10px 0;">
                        <button type="submit">Upload Lesson</button>
                    </form>
                </div>
            </div>

                
                <%
                // Initialize Hibernate session
             

                // Create Hibernate query to fetch all Student data
                List<Feedback1> feedbackList = s.createQuery("FROM Feedback1").list();
                
                // Loop through the list and display each student in a table row
                for (Feedback1 fb : feedbackList) {
%>
      <div id="feedback" class="section" style="display:none;">
                <h2>Feedback & Support</h2>
                <div class="card">
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Comment</th>
                            <th>Ranking</th>
                        </tr>
                           <tr>
                          <td><%= fb.getId()%></td>
                        <td><%= fb.getUsername()%></td>
                        <td><%= fb.getComment()%></td>
                        <td><%= fb.getRanking()%></td>
                        
                        </tr>
                    </table>
                </div>
            </div>
        <%
        }
                        t.commit();
         s.close();
                sf.close();
        %>

        </div>
        </div>

    <script>
        function showSection(sectionId, element) {
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => {
                section.style.display = 'none';
            });
            document.getElementById(sectionId).style.display = 'block';

            const links = document.querySelectorAll('.sidebar a');
            links.forEach(link => link.classList.remove('active'));
            element.classList.add('active');
        }

       

      
    </script>
</body>
</html>
