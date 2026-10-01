
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="java.io.*, java.sql.*" %>
<%@ page import="org.hibernate.*, org.hibernate.cfg.*, p1.GameScore" %>
<%@ page import="javax.servlet.http.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counting Quiz</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            text-align: center;
            background: linear-gradient(to bottom right, #ffebf0, #ffe4c4);
            margin: 0;
            padding: 0;
            animation: gradientBG 5s infinite alternate;
        }

        @keyframes gradientBG {
            0% {
                background: linear-gradient(to bottom right, #ffebf0, #ffe4c4);
            }
            50% {
                background: linear-gradient(to bottom right, #ffd1dc, #ffcba4);
            }
            100% {
                background: linear-gradient(to bottom right, #ffebb4, #ffc8e0);
            }
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background: #fff4e6;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            animation: popIn 1s ease-out;
        }

        @keyframes popIn {
            0% {
                transform: scale(0);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        h1 {
            font-size: 2.5em;
            color: #ff6b6b;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        p {
            font-size: 1.2em;
            color: #555;
        }

        .question {
            font-size: 2.5em;
            margin: 20px 0;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
                color: #ff6b6b;
            }
            50% {
                transform: scale(1.1);
                color: #6c63ff;
            }
            100% {
                transform: scale(1);
                color: #ff6b6b;
            }
        }

        .options {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .option {
            padding: 15px 20px;
            background: #6c63ff;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.5em;
            cursor: pointer;
            transition: transform 0.3s, background-color 0.3s;
        }

        .option:hover {
            background: #5548c8;
            transform: scale(1.1);
        }

        .option.correct {
            background: #28a745;
        }

        .option.incorrect {
            background: #dc3545;
        }

        #feedback {
            margin-top: 20px;
            font-size: 1.5em;
            color: #333;
            animation: fadeIn 1s ease-out;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        #score {
            margin-top: 20px;
            font-size: 1.3em;
            color: #ff6b6b;
        }

        #restart-btn {
            display: none;
            margin-top: 20px;
            padding: 10px 20px;
            background: #ff6b6b;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.2em;
            cursor: pointer;
            animation: buttonGlow 1.5s infinite alternate;
        }

        #restart-btn:hover {
            background: #ff4c4c;
        }

        @keyframes buttonGlow {
            0% {
                box-shadow: 0 0 10px #ff6b6b;
            }
            100% {
                box-shadow: 0 0 20px #ff4c4c;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Sequence Quiz</h1>
        <p>Can you figure out how many apples come next?</p>
        <div id="quiz-container">
            <!-- Quiz Question -->
            <div id="question" class="question">🍎🍎, 🍎🍎🍎, ?</div>
            <!-- Options -->
            <div id="options" class="options">
                <button class="option" onclick="checkAnswer(this, '🍎🍎')">🍎🍎</button>
                <button class="option" onclick="checkAnswer(this, '🍎🍎🍎🍎')">🍎🍎🍎🍎</button>
            </div>
            <!-- Feedback -->
            <div id="feedback"></div>
            <!-- Score -->
            <div id="score">Score: 0</div>
            <!-- Restart Button -->
            <button id="restart-btn" onclick="restartQuiz()">Restart Quiz</button>
        </div>
    </div>
    <script src="script_quiz1.js" type="text/javascript"></script>
        

    <%-- Backend Logic for Saving the Score --%>
    <% 
        String gameName = request.getParameter("gameName");
        String scoreParam = request.getParameter("score");
        if (gameName != null && scoreParam != null) {
            int scoreValue = Integer.parseInt(scoreParam);
            
             SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Transaction t = s.beginTransaction();
            try {

                // Create and save GameScore entity
                GameScore gameScore = new GameScore();
                gameScore.setGameName(gameName);
                gameScore.setScore(scoreValue);
                s.save(gameScore);

                t.commit();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
