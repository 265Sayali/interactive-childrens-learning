<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learning Number in Words</title>
    <style>
        /* Navbar styles */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background: #ff6f61;
            color: white;
            position: sticky;
            top: 0;
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
            top: 100%;
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

        /* Body styles */
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            background: linear-gradient(to right, #ff9966, #ff5e62);
            color: white;
            margin: 0;
            padding: 0;
        }
        h2 {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            font-size: 35px;
            margin-top: 20px;
            text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
            letter-spacing: 1px;
        }
        .number-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 15px;
            max-width: 500px;
            margin: auto;
            margin-top: 20px;
        }
        .number-box {
            background: white;
            color: #ff5e62;
            padding: 15px;
            font-size: 20px;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-shadow: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        .number-box:hover {
            background: #ff5e62;
            color: white;
            transform: scale(1.1);
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
        <a href="../quizzes/Counting-object-quiz.jsp">Counting object Quiz</a>
        <a href="../quizzes/math_operation_quiz.jsp">Math Quiz</a>
        <a href="../quizzes/number_word_quiz.jsp">Number to Word</a>
        <a href="../quizzes/rhyming_word_quiz.jsp">Rhyming Words</a>

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
    <a href="learn_letter.jsp">letters</a>
    <a href="learn_number.jsp">Number</a>
    <a href="learn_color.jsp">Color</a>
     <a href="learn_rhyming_word.jsp">Rhyming</a>
    <a href="learn_animal_place.jsp">Animal Habitat</a>
  </div>
</li>

     <li><a href="../progress_tracking.jsp">Progress Report</a></li>
  </ul>
</div>


    <h2>Learning Number in Words</h2>
    <div class="number-grid">
        <div class="number-box" onclick="speak('One')">1 - One</div>
        <div class="number-box" onclick="speak('Two')">2 - Two</div>
        <div class="number-box" onclick="speak('Three')">3 - Three</div>
        <div class="number-box" onclick="speak('Four')">4 - Four</div>
        <div class="number-box" onclick="speak('Five')">5 - Five</div>
        <div class="number-box" onclick="speak('Six')">6 - Six</div>
        <div class="number-box" onclick="speak('Seven')">7 - Seven</div>
        <div class="number-box" onclick="speak('Eight')">8 - Eight</div>
        <div class="number-box" onclick="speak('Nine')">9 - Nine</div>
        <div class="number-box" onclick="speak('Ten')">10 - Ten</div>
        <div class="number-box" onclick="speak('Eleven')">11 - Eleven</div>
        <div class="number-box" onclick="speak('Twelve')">12 - Twelve</div>
        <div class="number-box" onclick="speak('Thirteen')">13 - Thirteen</div>
        <div class="number-box" onclick="speak('Fourteen')">14 - Fourteen</div>
        <div class="number-box" onclick="speak('Fifteen')">15 - Fifteen</div>
        <div class="number-box" onclick="speak('Sixteen')">16 - Sixteen</div>
        <div class="number-box" onclick="speak('Seventeen')">17 - Seventeen</div>
        <div class="number-box" onclick="speak('Eighteen')">18 - Eighteen</div>
        <div class="number-box" onclick="speak('Nineteen')">19 - Nineteen</div>
        <div class="number-box" onclick="speak('Twenty')">20 - Twenty</div>
    </div>

    <script>
        function speak(text) {
            const utterance = new SpeechSynthesisUtterance(text);
            utterance.lang = 'en-US';
            speechSynthesis.speak(utterance);
        }
    </script>

</body>
</html>

