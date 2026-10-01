<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Quiz</title>
   <style>
        body {          
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: auto;
            min-height: 100vh;
      padding-bottom: 100px;
            color: white;
        }
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
        
        .quiz-container {          
                   margin: 40px auto;
            background-color: #ffda79;
            border: 5px dashed #ff793f;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
            text-align: center;
        }

        .quiz-header {
            font-size: 2em;
            text-align: center;
            color: #ff793f;
        }

        .question {
            margin: 20px 0;
            font-size: 1.5em;
        }

        .options {
            display: flex;
            flex-direction: column;
        }

        .options label {
            margin: 10px 0;
            background-color: #ffb142;
            padding: 10px;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .options label:hover {
            background-color: #ff793f;
            color: white;
            transform: scale(1.05);
        }

        .submit-btn,
        .restart-btn {
            background-color: #ff793f;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1.2em;
            cursor: pointer;
            border-radius: 10px;
            transition: background-color 0.3s, transform 0.3s;
            margin: 20px auto;
            display: block;
        }

        .submit-btn:hover,
        .restart-btn:hover {
            background-color: #ff5252;
            transform: scale(1.1);
        }

        .score-container {
            text-align: center;
            font-size: 2em;
            color: #ff793f;
            display: none;
        }

        .score-container span {
            font-size: 2.5em;
            color: #ff5252;
        }

        img {
            width: 100%;
            max-width: 300px;
            border-radius: 15px;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Media Queries for responsiveness */
        @media (max-width: 768px) {
            body {
                height: auto;
                padding-top: 20px;
            }

            .quiz-container {
                width: 90%;
                padding: 15px;
            }

            .quiz-header {
                font-size: 1.8em;
            }

            .question {
                font-size: 1.3em;
            }

            .submit-btn,
            .restart-btn {
                font-size: 1em;
                padding: 8px 16px;
            }
        }

        @media (max-width: 480px) {
            .quiz-header {
                font-size: 1.5em;
            }

            .question {
                font-size: 1.1em;
            }

            .submit-btn,
            .restart-btn {
                font-size: 0.9em;
                padding: 6px 12px;
            }

            img {
                max-width: 250px;
            }
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

    
<form action="Counting-obejct-quiz-score.jsp" >

   <div id="quiz-form">
        <div class="quiz-container">
            <h1 class="quiz-header">Colorful Counting Quiz</h1>

            <!-- Question 1 -->
            <div class="question">
                <p>How many apples are there in the image?</p>
<img src="https://wikiclipart.com/wp-content/uploads/2016/09/four-apple-clip-art.png" alt="4 Apples">
                <div class="options">
                    <label><input type="radio" name="q1" value="2"> 2</label>
                    <label><input type="radio" name="q1" value="3"> 3</label>
                    <label><input type="radio" name="q1" value="4"> 4</label>
                </div>
            </div>

            <!-- Question 2 -->
            <div class="question">
                <p>How many bananas are there in the image?</p>
                <img src="https://tse4.mm.bing.net/th?id=OIP.B5d7pRF8cPRDJjngMd5E9wHaFW&pid=Api&P=0&h=180"
                     alt="6Bananas">
                <div class="options">
                    <label><input type="radio" name="q2" value="3"> 3</label>
                    <label><input type="radio" name="q2" value="5"> 5</label>
                    <label><input type="radio" name="q2" value="6"> 6</label>
                </div>
            </div>

            <!-- Question 3 -->
            <div class="question">
                <p>How many oranges are there in the image?</p>
                <img src="https://i.ytimg.com/vi/hXbTbToE7gs/maxresdefault.jpg"
                     alt="5Oranges">
                <div class="options">
                    <label><input type="radio" name="q3" value="4"> 4</label>
                    <label><input type="radio" name="q3" value="5"> 5</label>
                    <label><input type="radio" name="q3" value="6"> 6</label>
                </div>
            </div>

            <!-- Question 4 -->
            <div class="question">
                <p>How many pears are there in the image?</p>
                <img src="https://tse2.mm.bing.net/th?id=OIP.-xAgpnIsnRlJflbPWeK7SAAAAA&pid=Api&P=0&h=180" alt="3Pears">
                <div class="options">
                    <label><input type="radio" name="q4" value="2"> 2</label>
                    <label><input type="radio" name="q4" value="3"> 3</label>
                    <label><input type="radio" name="q4" value="4"> 4</label>
                </div>
            </div>

            <!-- Add more questions -->
            <!-- Question 5 -->
            <div class="question">
                <p>How many grapes are there in the image?</p>
                <img src="https://tse1.mm.bing.net/th?id=OIP.X4yCLbTijbAIzz3SWdcLxwHaHa&pid=Api&P=0&h=180" alt="7Grapes">
                <div class="options">
                    <label><input type="radio" name="q5" value="5"> 5</label>
                    <label><input type="radio" name="q5" value="6"> 6</label>
                    <label><input type="radio" name="q5" value="7"> 7</label>
                </div>
            </div>

            <!-- Question 6 -->
            <div class="question">
                <p>How many strawberries are there in the image?</p>
                <img src="https://tse4.mm.bing.net/th?id=OIP.ZZCrDov1h6CmTH0dKVEv3gHaId&pid=Api&P=0&h=180" alt="4Strawberries">
                <div class="options">
                    <label><input type="radio" name="q6" value="3"> 3</label>
                    <label><input type="radio" name="q6" value="4"> 4</label>
                    <label><input type="radio" name="q6" value="5"> 5</label>
                </div>
            </div>

            <!-- Question 7 -->
            <div class="question">
                <p>How many cherries are there in the image?</p>
                <img src="https://tse1.mm.bing.net/th?id=OIP.w4YICbeLXC6WKoStVWaKbwHaH3&pid=Api&P=0&h=180" alt="2Cherries">
                <div class="options">
                    <label><input type="radio" name="q7" value="1"> 1</label>
                    <label><input type="radio" name="q7" value="2"> 2</label>
                    <label><input type="radio" name="q7" value="3"> 3</label>
                </div>
            </div>

            <!-- Question 8 -->
            <div class="question">
                <p>How many peaches are there in the image?</p>
                <img src="https://tse3.mm.bing.net/th?id=OIP.JAY26R3EOiy2sNETvBYCVgHaHa&pid=Api&P=0&h=180" alt="1Peaches">
                <div class="options">
                    <label><input type="radio" name="q8" value="2"> 2</label>
                    <label><input type="radio" name="q8" value="1"> 3</label>
                    <label><input type="radio" name="q8" value="4"> 4</label>
                </div>
            </div>

            <!-- Question 9 -->
            <div class="question">
                <p>How many lemons are there in the image?</p>
                <img src="https://tse2.mm.bing.net/th?id=OIP.WMc0NETeS-9qEs8djIRnRQHaE8&pid=Api&P=0&h=180" alt="5Lemons">
                <div class="options">
                    <label><input type="radio" name="q9" value="4"> 4</label>
                    <label><input type="radio" name="q9" value="5"> 5</label>
                    <label><input type="radio" name="q9" value="6"> 6</label>
                </div>
            </div>

            <!-- Question 10 -->
            <div class="question">
                <p>How many coconuts are there in the image?</p>
                <img src="https://tse3.mm.bing.net/th?id=OIP.AKluC6ONo06V5fosmK-0NAHaD0&pid=Api&P=0&h=180" alt="3Coconuts">
                <div class="options">
                    <label><input type="radio" name="q10" value="3"> 3</label>
                    <label><input type="radio" name="q10" value="4"> 4</label>
                    <label><input type="radio" name="q10" value="5"> 5</label>
                </div>
     </div>  
    </div>
  </div>  
    <div id="result" class="result-message" style="display:none;" onclick="window.location.href='Counting-object-quiz.jsp';"></div>

               
            <div class="score-container">
                  <input type="hidden" name="score_new" id="score_new">
            </div>

            <!-- Submit Button -->
            <button class="submit-btn" name="submit" onclick="calculateScore()">Submit Quiz</button>
    </form>
     
     
        <button class="restart-btn" id="restart-btn">Restart</button>

        <script>
              function calculateScore() {
            let score = 0;

            // Example: Check answers for each question
            // You can customize this based on your correct answers and question names
            if (document.querySelector('input[name="q1"]:checked')?.value === "4") {
                score++;
            }
            if (document.querySelector('input[name="q2"]:checked')?.value === "6") {
                score++;
            }
            if (document.querySelector('input[name="q3"]:checked')?.value === "5") {
                score++;
            }
            if (document.querySelector('input[name="q4"]:checked')?.value === "3") {
                score++;
            }
            if (document.querySelector('input[name="q5"]:checked')?.value === "7") {
                score++;
            }
            if (document.querySelector('input[name="q6"]:checked')?.value === "4") {
                score++;
            }
            if (document.querySelector('input[name="q7"]:checked')?.value === "2") {
                score++;
            }
            if (document.querySelector('input[name="q8"]:checked')?.value === "1") {
                score++;
            }
            if (document.querySelector('input[name="q9"]:checked')?.value === "5") {
                score++;
            }
            if (document.querySelector('input[name="q10"]:checked')?.value === "5") {
                score++;
            }

            // Display the score in the input field with id "score_new"
            document.getElementById("score_new").value = score;

            // You can also display the score in the score container if you want
           document.querySelector('.score-container span').textContent = score;
        }
    </script>
</body>

</html>
