<%@ page import="java.util.List" %>
<%@page import="p1.GameScore"%>
<%@page import="p1.QuizScore"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<html>
<head>
    <title>Child Progress Report</title>
    <style>
        /* Gradient Background */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
  /* Navbar styles */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background: #ff6f61;
    color: white;
    position: fixed; /* Keeps navbar at the top */
    top: 0;
    left: 0;
    width: 100%; /* Ensures full width */
    z-index: 1000;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

    .navbar h2 {
      font-size: 1.5rem;
      margin: 0;
    }

    .navbar ul {
      list-style: none;
      margin: 0;
      padding: 0;
      display: flex;
    }

    .navbar ul li {
      margin-left: 20px;
      position: relative; /* To position the dropdown menu */
    }

    .navbar ul li a {
      text-decoration: none;
      color: white;
      font-size: 1rem;
      transition: color 0.3s;
    }

    .navbar ul li a:hover {
      color: #ffe082;
    }

    /* Dropdown styles */
    .dropdown {
      display: none;
      position: absolute;
      top: 100%; /* Position the dropdown below the nav item */
      left: 0;
      background-color: #ffab91;
      border-radius: 5px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      min-width: 200px;
      z-index: 1000;
    }

    .dropdown a {
      display: block;
      color: white;
      text-decoration: none;
      padding: 10px 15px;
      font-size: 0.9rem;
      transition: background-color 0.3s;
    }

    .dropdown a:hover {
      background-color: #ff6f61;
    }

    /* Show the dropdown menu on hover */
    .navbar ul li:hover .dropdown {
      display: block;
    }

        /* Card Container */
        .container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 800px;
            text-align: center;
        }

        h1 {
            color: #0072ff;
            font-size: 26px;
        }

        h3 {
            color: #333;
            font-size: 20px;
            margin-top: 20px;
        }

        /* Stylish Table */
        .progress-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .progress-table th, .progress-table td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .progress-table th {
            background-color: #0072ff;
            color: white;
            text-transform: uppercase;
        }

        .progress-table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .progress-table tbody tr:hover {
            background-color: #a8d0ff;
            transition: 0.3s;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 20px;
            }

            h1 {
                font-size: 22px;
            }

            h3 {
                font-size: 18px;
            }

            .progress-table th, .progress-table td {
                padding: 10px;
                font-size: 14px;
            }
        }
        
    </style>
</head>
<body>
     <!-- Navbar -->
 <div class="navbar">
  <h2>Interactive Learning</h2>
  <ul>
    <li><a href="home.jsp">Home</a></li>
    <li>
      <a href="javascript:void(0);">Quizzes</a>
      <div class="dropdown">
        <a href="quizzes/Counting-object-quiz.jsp">Counting object Quiz</a>
        <a href="quizzes/math_operation_quiz.jsp">Math Quiz</a>
        <a href="quizzes/number_word_quiz.jsp">Number to Word</a>
        <a href="quizzes/rhyming_word_quiz.jsp">Rhyming Words</a>

      </div>
    </li>

  
    <li>
  <a href="javascript:void(0);">Games</a>
  <div class="dropdown">
    <a href="games/Animal_habitat.jsp">Animal habitat Games</a>
    <a href="games/animal_sound.jsp">Animal sound  Games</a>
    <a href="games/color_game.jsp">color_hint_game Games</a>
  </div>
</li>

  
   <li>
  <a href="javascript:void(0);">Learning</a>
  <div class="dropdown">
    <a href="learning/learn_letter.jsp">letters</a>
    <a href="learning/learn_number.jsp">Number</a>
    <a href="learning/learn_color.jsp">Color</a>
     <a href="learning/learn_rhyming_word.jsp">Rhyming</a>
    <a href="learning/learn_animal_place.jsp">Animal Habitat</a>
  </div>
</li>

     <li><a href="progress_tracking.jsp">Progress Report</a></li>
  </ul>
</div>



  <div class="container">
        <h1>📊 Child's Progress Report</h1>

        <!-- Game Scores Table -->
        <h3>🎮 Game Scores</h3>
        <table class="progress-table">
            <thead>
                <tr>
                    <th>Game Name</th>
                    <th>Score</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Initialize Hibernate session
                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                    Session s = sf.openSession();
                    Transaction t = s.beginTransaction();

                    String username = (String) session.getAttribute("username");
    if (username == null) {
            out.println("<script>alert(' Please log in again.'); window.location='login.jsp';</script>");
            return;
        }
                    
                    // Fetch Game Scores
                    List<GameScore> gamelist = s.createQuery("FROM GameScore where username = :uname")
                                                 .setParameter("uname", username)
                                                 .list();

                    for (GameScore game : gamelist) {
                %>
                <tr>
                    <td><%= game.getGameName() %></td>
                    <td><%= game.getScore() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Quiz Scores Table -->
        <h3>📝 Quiz Scores</h3>
        <table class="progress-table">
            <thead>
                <tr>
                    <th>Quiz Name</th>
                    <th>Score</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Fetch Quiz Scores
                    List<QuizScore> quizlist = s.createQuery("FROM QuizScore where username = :uname")
                                                .setParameter("uname", username)
                                                .list();

                    for (QuizScore quiz : quizlist) {
                %>
                <tr>
                    <td><%= quiz.getQuizName() %></td>
                    <td><%= quiz.getScore() %></td>
                </tr>
                <% } 

                // Closing Hibernate session
                s.close();
                sf.close();
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
