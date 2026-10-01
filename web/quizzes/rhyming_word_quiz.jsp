<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Rhyming Word Quiz</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(45deg, #ff9a9e, #fad0c4, #ffdde1, #ff80ab);
            background-size: 400% 400%;
            animation: gradientBG 10s ease infinite;
            text-align: center;
            color: #333;
            margin: 0;
            padding: 0;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

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

        .navbar li:hover .dropdown {
            display: block;
        }

        .dropdown {
            display: none;
            position: absolute;
            background-color: #ff6f61;
            min-width: 180px;
            top: 100%;
            left: 0;
            z-index: 1100;
            overflow: hidden;
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

        .container {
            width: 90%;
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
        }

        h1 {
            font-size: 2.5em;
            color: #ff4081;
            text-shadow: 3px 3px 8px rgba(255, 100, 150, 0.5);
        }

        .restart-btn {
            display: none;
            background-color: #ff9800;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 1.2em;
            border-radius: 20px;
            cursor: pointer;
            margin-bottom: 20px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
        }

        .restart-btn:hover {
            background-color: #ff5722;
        }

        .card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin-bottom: 20px;
        }

        .question-text {
            font-size: 1.3em;
            color: #555;
        }

        .options label {
            display: block;
            padding: 12px;
            margin-bottom: 8px;
            background-color: #ffcc80;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1.2em;
            transition: 0.3s;
        }

        .options label:hover {
            background-color: #ffb74d;
        }

        .options input[type="radio"] {
            margin-right: 10px;
        }

        .submit-btn {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 1.2em;
            border-radius: 20px;
            cursor: pointer;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
        }

        .submit-btn:hover {
            background-color: #388e3c;
        }

        .result-message {
            font-size: 1.8em;
            margin-top: 20px;
            font-weight: bold;
            color: #ff4081;
            text-shadow: 2px 2px 8px rgba(255, 100, 150, 0.5);
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
 
<div class="container">
    <h1>Rhyming Word Quiz</h1>

    <button class="restart-btn" onclick="restartQuiz()">Restart Quiz</button>

    <div id="quiz">
        <div class="card">
            <p class="question-text">1) Find the rhyming word of cat, bat, ?</p>
            <div class="options">
                <label><input type="radio" name="answer1" value="hat"> hat</label>
                <label><input type="radio" name="answer1" value="dog"> dog</label>
            </div>
        </div>

        <div class="card">
            <p class="question-text">2) Find the rhyming word of hill, fill, ?</p>
            <div class="options">
                <label><input type="radio" name="answer2" value="pill"> pill</label>
                <label><input type="radio" name="answer2" value="ball"> ball</label>
            </div>
        </div>

        <div class="card">
            <p class="question-text">3) Find the rhyming word of book, cook, ?</p>
            <div class="options">
                <label><input type="radio" name="answer3" value="look"> look</label>
                <label><input type="radio" name="answer3" value="note"> note</label>
            </div>
        </div>

        <div class="card">
            <p class="question-text">4) Find the rhyming word of star, car, ?</p>
            <div class="options">
                <label><input type="radio" name="answer4" value="jar"> jar</label>
                <label><input type="radio" name="answer4" value="moon"> moon</label>
            </div>
        </div>

        <div class="card">
            <p class="question-text">5) Find the rhyming word of sun, run, ?</p>
            <div class="options">
                <label><input type="radio" name="answer5" value="fun"> fun</label>
                <label><input type="radio" name="answer5" value="night"> night</label>
            </div>
        </div>

        <div class="card">
            <p class="question-text">6) Find the rhyming word of ball, call, ?</p>
            <div class="options">
                <label><input type="radio" name="answer6" value="wall"> wall</label>
                <label><input type="radio" name="answer6" value="tree"> tree</label>
            </div>
        </div>

        <div class="card">
            <p class="question-text">7) Find the rhyming word of light, night, ?</p>
            <div class="options">
                <label><input type="radio" name="answer7" value="kite"> kite</label>
                <label><input type="radio" name="answer7" value="cloud"> cloud</label>
            </div>
        </div>

        <div class="card">
            <p class="question-text">8) Find the rhyming word of plane, cane, ?</p>
            <div class="options">
                <label><input type="radio" name="answer8" value="lane"> lane</label>
                <label><input type="radio" name="answer8" value="train"> train</label>
            </div>
        </div>

        <div class="card">
            <p class="question-text">9) Find the rhyming word of ring, king, ?</p>
            <div class="options">
                <label><input type="radio" name="answer9" value="sing"> sing</label>
                <label><input type="radio" name="answer9" value="chair"> chair</label>
            </div>
        </div>

        <div class="card">
            <p class="question-text">10) Find the rhyming word of boat, coat, ?</p>
            <div class="options">
                <label><input type="radio" name="answer10" value="goat"> goat</label>
                <label><input type="radio" name="answer10" value="fish"> fish</label>
            </div>
        </div>

        <form action="rhyming_word_quiz_score.jsp">
            <input type="hidden" name="score_new" id="score_new">
            <input class="submit-btn" type="submit" value="Submit" onclick="calculateScore()">
        </form>
    </div>

    <div id="result" class="result-message" style="display:none;"></div>
</div>

<script>
   function calculateScore() {
    let score = 0;
    let correctAnswers = {
        "answer1": "hat",
        "answer2": "pill",
        "answer3": "look",
        "answer4": "jar",
        "answer5": "fun",
        "answer6": "wall",
        "answer7": "kite",
        "answer8": "lane",
        "answer9": "sing",
        "answer10": "goat"
    };

    for (let key in correctAnswers) {
        let selected = document.querySelector('input[name="' + key + '"]:checked');
        if (selected && selected.value === correctAnswers[key]) {
            score++;
        }
    }

    updateScore(score);
}

function updateScore(score) {
    document.getElementById("score_new").value = score;
}
</script>

</body>
</html>
