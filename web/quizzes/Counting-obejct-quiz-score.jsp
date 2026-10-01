<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.io.*"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>
<%@page import="p1.QuizScore"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Score</title>
    <style>
        body {
            background-color: #f0f8ff;
            font-family: 'Comic Sans MS', cursive, sans-serif;
            text-align: center;
            padding: 20px;
        }

        .score-container {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: inline-block;
            padding: 40px;
            position: relative;
            margin-top: 50px;
            animation: popIn 1s ease;
        }

        @keyframes popIn {
            from {
                transform: scale(0.5);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        .score-title {
            font-size: 2.5rem;
            color: #ff6347;
            margin-bottom: 20px;
        }

        .score-value {
            font-size: 4rem;
            color: #4682b4;
            font-weight: bold;
        }

        .character {
            position: absolute;
            width: 150px; /* Increased from 100px to 150px */
            top: -100px;  /* Adjusted positioning due to size increase */
            right: -70px;
            transform: rotate(20deg);
        }

        .button {
            margin-top: 30px;
            padding: 10px 20px;
            font-size: 1.2rem;
            background-color: #ff6347;
            color: #fff;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #ff4500;
        }
    </style>
</head>
<body>


    <div class="score-container">
        <h1 class="score-title">Your Score!</h1>
        
        <!-- Added a div with class 'score-value' to style the score -->
        <div class="score-value">
            <%
                String scoreParam = request.getParameter("score_new");
                int score = 0;
                if (scoreParam != null && !scoreParam.isEmpty()) {
                    try {
                        score = Integer.parseInt(scoreParam);
                    } catch (NumberFormatException e) {
                        // Handle invalid number format (e.g., set score to 0 or display an error message)
                        score = 0;
                        out.println("Invalid score value.");
                    }
                } else {
                    out.println("Score not provided.");
                }
                out.println(score);
 String username = (String) session.getAttribute("username"); 
 if (username == null) {
            out.println("<script>alert(' Please log in again.'); window.location='../login.jsp';</script>");
            return;
        }
 String game_name = "Counting object quiz ";
//HttpSession hs = request.getSession();

// Check for the form submission
if (request.getParameter("submit") != null) {
    SessionFactory sf = new Configuration().configure().buildSessionFactory();
    Session s = sf.openSession();
    Transaction t = s.beginTransaction();

    QuizScore qs = new QuizScore();
    qs.setUsername(username);
    qs.setQuizName(game_name);
    qs.setScore(score);  // Use the validated score here
    s.persist(qs);
    t.commit();
}
%>

        </div>

        <button class="button" onclick="window.location.href='Counting-object-quiz.jsp';">Play Again</button>

        <!-- Increased panda image size via CSS class changes -->
        <img src="https://tse2.mm.bing.net/th?id=OIP.h7Y2VfV1hzzq-OgYHfjmagHaHa&pid=Api&P=0&h=180" 
             alt="Character Pointing" class="character">
    </div>

</body>
</html>

