<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Kids Math Quiz</title>
  <style>
    body {
            margin: 0;
            font-family: 'Comic Sans MS', cursive, sans-serif;
            text-align: center;
             background: linear-gradient(to bottom right, #fef9c7, #aee5ff); 
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
        h1 {
            font-size: 2.5rem;
            margin-top: 30px;
            color: #333;
            position: relative; /* No z-index applied to avoid interference with navbar */
        }


    #quiz-container {
      background-color: #FFF8DC;
      border-radius: 30px;
      box-shadow: 0 10px 50px rgba(0, 0, 0, 0.1);
      padding: 50px;
      width: 80%;
      max-width: 700px;
      margin: 40px auto;
      text-align: center;
      animation: fadeInUp 1s ease-out;
    }
    .question {
      font-size: 22px;
      font-weight: bold;
      color: #ff4500;
      margin-bottom: 15px;
    }
    .option {
      font-size: 40px; /* Apply font size to the text */
      color: #333; /* Text color */
      font-weight: bold;
      padding: 40px;
      margin: 15px 0;
      background-color: #ff69b4;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 20%;
      height:40%;
      transition: background-color 0.3s;
    }
           .option:hover {
            background-color: #c1c1c1;
            transform: scale(1.05);
        }

        .option:active {
            background-color: #b0b0b0;
            transform: scale(1);
        }
 

    #feedback {
            font-size: 20px;
            font-weight: bold;
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
            display: inline-block;
            transition: opacity 0.5s ease-in-out;
        }

        .correct {
            color: green;
            background-color: #d4f7d4;
            border: 2px solid green;
        }

        .incorrect {
            color: red;
            background-color: #f7d4d4;
            border: 2px solid red;
        }
    
   
    
    .restart-btn {
      background-color: #32CD32;
      padding: 15px 25px;
      font-size: 20px;
      border: none;
      border-radius: 15px;
      cursor: pointer;
      margin-top: 10px;
      transition: background-color 0.3s ease;
    }

    .restart-btn:hover {
      background-color: #228B22;
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
     <!-- Game Content -->
    <h1>Maths quiz</h1>
    
 <div id="quiz-container">
  <h2 id="question"></h2>
  <div id="options">
            <button class="option" id="option1" onclick="checkAnswer(this.textContent)">
                <span class="option-number">1</span> Option 1
            </button>
            <button class="option" id="option2" onclick="checkAnswer(this.textContent)">
                <span class="option-number">2</span> Option 2
            </button>
            <button class="option" id="option3" onclick="checkAnswer(this.textContent)">
                <span class="option-number">3</span> Option 3
            </button>
            <button class="option" id="option4" onclick="checkAnswer(this.textContent)">
                <span class="option-number">4</span> Option 4
            </button>
        </div>
  <p id="feedback"></p>
  
   <form action="math_operation_quiz_score.jsp">
        <input type="hidden" name="score_new" id="score_new">
        <input class="restart-btn" type="submit" name="submit" value="Sumbit game" onclick="updateScore()">
    </form>
    
  <button class="restart-btn" onclick="restartQuiz()">Restart Quiz</button>
</div>

     <script>
        let score = 0;
        let currentIndex = 0;

        let questions = [
            { q: "What is 1 + 2?", a: "3", options: ["2", "4", "3", "7"] },
            { q: "What is 5 - 3?", a: "2", options: ["2", "5", "7", "1"] },
            { q: "What is 4 + 4?", a: "8", options: ["2", "8", "4", "7"] },
            { q: "What is 7 - 2?", a: "5", options: ["7", "9", "2", "5"] },
            { q: "What is 5 + 2?", a: "7", options: ["9", "7", "3", "1"] },
            { q: "What is 8 - 3?", a: "5", options: ["1", "5", "8", "3"] },
            { q: "What is 5 + 5?", a: "10", options: ["5", "10", "2", "7"] },
            { q: "What is 4 - 2?", a: "2", options: ["4", "1", "2", "6"] }
        ];

        function loadQuestion() {
            if (currentIndex < questions.length) {
                document.getElementById("question").textContent = questions[currentIndex].q;
                let options = questions[currentIndex].options;

                document.getElementById("option1").textContent = options[0];
                document.getElementById("option2").textContent = options[1];
                document.getElementById("option3").textContent = options[2];
                document.getElementById("option4").textContent = options[3];
                


                document.getElementById("feedback").textContent = "";
                document.getElementById("feedback").className = "";
            } else {
                document.getElementById("options").style.display = "none";
                document.getElementById("question").style.display = "none";
                document.getElementById("feedback").textContent = "Great! You've completed the quiz.";
                document.getElementById("feedback").className = "correct"; // Green final score
            }
        }

        function checkAnswer(answer) {
            let feedbackMessage = document.getElementById("feedback");

            if (answer === questions[currentIndex].a) {
                score++;
                feedbackMessage.textContent = "Great! It's right ?";
                feedbackMessage.className = "correct";
            } else {
                feedbackMessage.textContent = "Oops! Wrong ?";
                feedbackMessage.className = "incorrect";
            }

           // document.getElementById("score").textContent = "Score: " + score;
            currentIndex++;
            setTimeout(loadQuestion, 1000);
            
        }
        function updateScore() {
            document.getElementById("score_new").value=score;
        }

        function restartQuiz() {
            score = 0;
            currentIndex = 0;

            document.getElementById("options").style.display = "block";
            document.getElementById("feedback").textContent = "";
            document.getElementById("feedback").className = "";
            document.getElementById("score").textContent = "Score: 0";

            loadQuestion();
        }

        loadQuestion();
    </script>

</body>
</html>
