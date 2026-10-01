<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.io.*"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>
<%@page import="p1.QuizScore"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Identify Numbers Quiz</title>
  <style>
    /* Keyframes for fade-in animation */
    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    body {
      font-family: "Comic Sans MS", cursive, sans-serif;
      /* Attractive blue to purple gradient background */
      background: linear-gradient(135deg, #667eea, #764ba2);
      margin: 0;
      padding: 0;
      color: #333;
    }
   
        /* Navbar styles */
        .navbar {
             background: linear-gradient(to right, #ff6f61, #ffcc00); 
            overflow: visible;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            color: white;
            position: relative;
            z-index: 1000; 
        }

        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 20px;
        }

        .navbar li {
            position: relative;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px;
            display: block;
        }

        .navbar a:hover {
            background-color: #ff3e2a;
        }

        /* Dropdown styles */
        .navbar li:hover .dropdown {
            display: block;
        }

        .dropdown {
            display: none;
            position: absolute;
            background-color: #ff6f61;
            min-width: 180px;
            top: 100%; /* Ensures dropdown is below the parent menu item */
            left: 0;
            z-index: 1100; /* Ensures dropdown appears above other content */
            overflow: hidden; /* Handles overflow */
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .dropdown a {
            display: block;
            padding: 10px;
            color: white;
            text-decoration: none;
        }

        .dropdown a:hover {
            background-color: #ff3e2a;
        }
        
    h2 {
      text-align: center;
      color: #ffffff;  /* White title color */
      font-size: 2.5em;
      font-weight: bold;
      margin-top: 2px;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
      animation: fadeIn 1s ease-out;
    }
    
    .quiz-container {
      width: 50%;
      margin: 40px auto;
      padding: 20px 30px;
      background-color: rgba(255, 255, 255, 0.97); /* Nearly opaque white background */
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
      animation: fadeIn 1s ease-out;
    }
    
    fieldset {
      border: 2px solid #764ba2; /* Purple border */
      padding: 15px;
      margin-bottom: 20px;
      border-radius: 8px;
    }
    
    legend {
      font-size: 1.2em;
      font-weight: bold;
      color: #764ba2;
    }
    
    .options input {
      margin: 5px;
    }
    
    .feedback {
      font-size: 1em;
      color: #e74c3c; /* Red for incorrect feedback */
      font-weight: bold;
    }
    
    .correct {
      color: #27ae60; /* Green for correct feedback */
      font-weight: bold;
    }
    
    .score {
      text-align: center;
      font-size: 1.4em;
      margin-top: 20px;
      font-weight: bold;
    }
    
    .button {
      display: block;
      width: 100%;
      padding: 12px;
      /* Button gradient matching container */
      background: linear-gradient(135deg, #764ba2, #667eea);
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 1.1em;
      cursor: pointer;
      margin-top: 20px;
      transition: background 0.3s ease, transform 0.3s ease;
    }
    
    .button:hover {
      background: linear-gradient(135deg, #667eea, #764ba2);
      transform: scale(1.02);
    }
  </style>
</head>
<body>
    
  <!-- Navbar -->
 <div class="navbar">
  <h2>Interactive Learning</h2>
  <ul>
    <li><a href="../home.jsp">Home</a></li>
    <li>
      <a href="javascript:void(0);">Quizzes</a>
      <div class="dropdown">
        <a href="Counting-object-quiz.jsp">Counting object Quiz</a>
        <a href="math_operation_quiz.jsp">Math Quiz</a>
        <a href="number_word_quiz.jsp">Number to Word</a>
        <a href="rhyming_word_quiz.jsp">Rhyming Words</a>

      </div>
    </li>
    <li>
  <a href="javascript:void(0);">Games</a>
  <div class="dropdown">
    <a href="../games/Animal_habitat.jsp">Animal habitat Games</a>
    <a href="../games/animal_sound.jsp">Animal sound  Games</a>
    <a href="../games/color_game.jsp">color_hint_game Games</a>
  </div>
</li>

   <li>
  <a href="javascript:void(0);">Learning</a>
  <div class="dropdown">
    <a href="../learning/learn_letter.jsp">letters</a>
    <a href="../learning/learn_number.jsp">Number</a>
    <a href="../learning/learn_color.jsp">Color</a>
     <a href="../learning/learn_rhyming_word.jsp">Rhyming</a>
    <a href="../learning/learn_animal_place.jsp">Animal Habitat</a>
  </div>
</li>

     <li><a href="../progress_tracking.jsp">Progress Report</a></li>
  </ul>
</div>
    
  <h2>Identify Numbers Quiz</h2>
  <div class="quiz-container">
    <form method="post" >
      <!-- Question 1 -->
      <fieldset>
        <legend>Question 1: Identify the number: 2</legend>
        <div class="options">
          <input type="radio" name="q1" value="one" id="q1a"> One<br>
          <input type="radio" name="q1" value="two" id="q1b"> Two<br>
          <input type="radio" name="q1" value="three" id="q1c"> Three<br>
          <input type="radio" name="q1" value="four" id="q1d"> Four<br>
        </div>
        <div class="feedback">
          <% 
            String q1Answer = request.getParameter("q1");
            if (q1Answer != null) {
              if ("two".equals(q1Answer)) {
                out.print("<p class='correct'>Correct! 'Two' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Two'.</p>");
              }
            }
          %>
        </div>
      </fieldset>
      
      <!-- Question 2 -->
      <fieldset>
        <legend>Question 2: Identify the number: 6</legend>
        <div class="options">
          <input type="radio" name="q5" value="two" id="q5a"> Two<br>
          <input type="radio" name="q5" value="four" id="q5b"> Four<br>
          <input type="radio" name="q5" value="six" id="q5c"> Six<br>
          <input type="radio" name="q5" value="eight" id="q5d"> Eight<br>
        </div>
        <div class="feedback">
          <% 
            String q5Answer = request.getParameter("q5");
            if (q5Answer != null) {
              if ("six".equals(q5Answer)) {
                out.print("<p class='correct'>Correct! 'Six' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Six'.</p>");
              }
            }
          %>
        </div>
      </fieldset>
      
      <!-- Question 3 -->
      <fieldset>
        <legend>Question 3: Identify the number: 4</legend>
        <div class="options">
          <input type="radio" name="q3" value="one" id="q3a"> One<br>
          <input type="radio" name="q3" value="two" id="q3b"> Two<br>
          <input type="radio" name="q3" value="three" id="q3c"> Three<br>
          <input type="radio" name="q3" value="four" id="q3d"> Four<br>
        </div>
        <div class="feedback">
          <% 
            String q3Answer = request.getParameter("q3");
            if (q3Answer != null) {
              if ("four".equals(q3Answer)) {
                out.print("<p class='correct'>Correct! 'Four' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Four'.</p>");
              }
            }
          %>
        </div>
      </fieldset>
      
      <!-- Question 4 -->
      <fieldset>
        <legend>Question 4: Identify the number: 9</legend>
        <div class="options">
          <input type="radio" name="q8" value="three" id="q8a"> Three<br>
          <input type="radio" name="q8" value="five" id="q8b"> Five<br>
          <input type="radio" name="q8" value="seven" id="q8c"> Seven<br>
          <input type="radio" name="q8" value="nine" id="q8d"> Nine<br>
        </div>
        <div class="feedback">
          <% 
            String q8Answer = request.getParameter("q8");
            if (q8Answer != null) {
              if ("nine".equals(q8Answer)) {
                out.print("<p class='correct'>Correct! 'Nine' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Nine'.</p>");
              }
            }
          %>
        </div>
      </fieldset>
      
      <!-- Question 5 -->
      <fieldset>
        <legend>Question 5: Identify the number: >3</legend>
        <div class="options">
          <input type="radio" name="q2" value="one" id="q2a"> One<br>
          <input type="radio" name="q2" value="two" id="q2b"> Two<br>
          <input type="radio" name="q2" value="three" id="q2c"> Three<br>
          <input type="radio" name="q2" value="four" id="q2d"> Four<br>
        </div>
        <div class="feedback">
          <% 
            String q2Answer = request.getParameter("q2");
            if (q2Answer != null) {
              if ("three".equals(q2Answer)) {
                out.print("<p class='correct'>Correct! 'Three' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Three'.</p>");
              }
            }
          %>
        </div>

      </fieldset>
      
      <!-- Question 6 -->
      <fieldset>
        <legend>Question 6: Identify the number: 10</legend>
        <div class="options">
          <input type="radio" name="q9" value="two" id="q9a"> Two<br>
          <input type="radio" name="q9" value="four" id="q9b"> Four<br>
          <input type="radio" name="q9" value="six" id="q9c"> Six<br>
          <input type="radio" name="q9" value="ten" id="q9d"> Ten<br>
        </div>
        <div class="feedback">
          <% 
            String q9Answer = request.getParameter("q9");
            if (q9Answer != null) {
              if ("ten".equals(q9Answer)) {
                out.print("<p class='correct'>Correct! 'Ten' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Ten'.</p>");
              }
            }
          %>
        </div>
      </fieldset>
      
      <!-- Question 7 -->
      <fieldset>
        <legend>Question 7: Identify the number: 8</legend>
        <div class="options">
          <input type="radio" name="q7" value="two" id="q7a"> Two<br>
          <input type="radio" name="q7" value="four" id="q7b"> Four<br>
          <input type="radio" name="q7" value="six" id="q7c"> Six<br>
          <input type="radio" name="q7" value="eight" id="q7d"> Eight<br>
        </div>
        <div class="feedback">
          <% 
            String q7Answer = request.getParameter("q7");
            if (q7Answer != null) {
              if ("eight".equals(q7Answer)) {
                out.print("<p class='correct'>Correct! 'Eight' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Eight'.</p>");
              }
            }
          %>
        </div>
      </fieldset>
      
      <!-- Question 8 -->
      <fieldset>
        <legend>Question 8: Identify the number: 5</legend>
        <div class="options">
          <input type="radio" name="q4" value="one" id="q4a"> One<br>
          <input type="radio" name="q4" value="three" id="q4b"> Three<br>
          <input type="radio" name="q4" value="five" id="q4c"> Five<br>
          <input type="radio" name="q4" value="seven" id="q4d"> Seven<br>
        </div>
        <div class="feedback">
          <% 
            String q4Answer = request.getParameter("q4");
            if (q4Answer != null) {
              if ("five".equals(q4Answer)) {
                out.print("<p class='correct'>Correct! 'Five' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Five'.</p>");
              }
            }
          %>
        </div>
      </fieldset>
      
      <!-- Question 9 -->
      <fieldset>
        <legend>Question 9: Identify the number: 7</legend>
        <div class="options">
          <input type="radio" name="q6" value="three" id="q6a"> Three<br>
          <input type="radio" name="q6" value="five" id="q6b"> Five<br>
          <input type="radio" name="q6" value="seven" id="q6c"> Seven<br>
          <input type="radio" name="q6" value="nine" id="q6d"> Nine<br>
        </div>
        <div class="feedback">
          <% 
            String q6Answer = request.getParameter("q6");
            if (q6Answer != null) {
              if ("seven".equals(q6Answer)) {
                out.print("<p class='correct'>Correct! 'Seven' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Seven'.</p>");
              }
            }
          %>
        </div>
      </fieldset>
      
      <!-- Question 10 -->
      <fieldset>
        <legend>Question 10: Identify the number: 11</legend>
        <div class="options">
          <input type="radio" name="q10" value="three" id="q10a"> Three<br>
          <input type="radio" name="q10" value="five" id="q10b"> Five<br>
          <input type="radio" name="q10" value="seven" id="q10c"> Seven<br>
          <input type="radio" name="q10" value="eleven" id="q10d"> Eleven<br>
        </div>
        <div class="feedback">
          <% 
            String q10Answer = request.getParameter("q10");
            if (q10Answer != null) {
              if ("eleven".equals(q10Answer)) {
                out.print("<p class='correct'>Correct! 'Eleven' is the right answer.</p>");
              } else {
                out.print("<p class='feedback'>Incorrect. The correct answer is 'Eleven'.</p>");
              }
            }
          %>
        </div>
      </fieldset>
      
     
    <input type="submit" value="Submit" id="submit" class="button">
    </form>
    <% 
        int score = 0;
        if ("POST".equalsIgnoreCase(request.getMethod())) 
        {
         if ("two".equals(request.getParameter("q1"))) score++;
         if ("three".equals(request.getParameter("q2"))) score++;
         if ("four".equals(request.getParameter("q3"))) score++;
         if ("five".equals(request.getParameter("q4"))) score++;
         if ("six".equals(request.getParameter("q5"))) score++;
         if ("seven".equals(request.getParameter("q6"))) score++;
         if ("eight".equals(request.getParameter("q7"))) score++;
         if ("nine".equals(request.getParameter("q8"))) score++;
         if ("ten".equals(request.getParameter("q9"))) score++;
         if ("eleven".equals(request.getParameter("q10"))) score++;
         out.println("<div class='score'>Your Total Score: " + score + " / 10</div>");
         
     SessionFactory sf = new Configuration().configure().buildSessionFactory();
    Session s = sf.openSession();
    Transaction t = s.beginTransaction();
    String username = (String) session.getAttribute("username");
    if (username == null) {
            out.println("<script>alert(' Please log in again.'); window.location='../login.jsp';</script>");
            return;
        }
    String game_name="number word quiz";

    QuizScore qs= new QuizScore();
    qs.setUsername(username);
    qs.setQuizName(game_name);
    qs.setScore(score);
     s.persist(qs);
            t.commit();
            } 
        %>
    
     
<button class="button" type="button" onclick="window.location.href='number_word_quiz.jsp';">Restart Quiz</button>
    <% 
%>
    
  </div>
</body>
</html>
