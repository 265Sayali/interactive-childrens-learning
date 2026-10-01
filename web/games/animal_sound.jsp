<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Interactive Animal Sounds Quiz</title>
  <style>
    /* General Body Styling */
    body {
      margin: 0;
      font-family: 'Comic Sans MS', cursive, sans-serif;
      background: linear-gradient(to bottom, #ff9a8b, #ff6a88, #d7a6f7);
      background-size: 400% 400%;
      animation: gradientBG 10s ease infinite;
      height: auto;
      min-height: 100vh;
      padding-bottom: 100px; /* To allow space for the scroll */
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
       


    /* Hero Section Styling */
    .hero {
      text-align: center;
      padding: 80px 20px;
      color: white;
      background: linear-gradient(135deg, #ff6f61 30%, #ffcc00);
      border-bottom-left-radius: 50% 20%;
      border-bottom-right-radius: 50% 20%;
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
    }

    .hero h1 {
      font-size: 3.5rem;
      margin-bottom: 20px;
      color: #ffffff;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
    }

    .hero p {
      font-size: 1.5rem;
      margin-bottom: 40px;
      color: #ffe082;
    }

    /* Quiz Container */
    .quiz-container {
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

    .quiz-container p {
      font-size: 28px;
      font-weight: bold;
      color: #FF4500;
    }

    .options button {
      background-color: #FFB6C1;
      border: none;
      padding: 25px 50px;
      margin: 20px;
      font-size: 28px;
      border-radius: 50px;
      cursor: pointer;
      transition: transform 0.3s ease, background-color 0.3s ease;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
    }

    .options button:hover {
      background-color: #FF6347;
      transform: scale(1.1);
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
    }

    .options button:disabled {
      background-color: #dcdcdc;
      cursor: not-allowed;
      transform: none;
      box-shadow: none;
    }

    .cow-image {
      width: 180px;
      margin-top: 30px;
      animation: bounce 1s infinite alternate;
    }

    .correct {
      color: #32CD32;
      font-size: 30px;
      display: none;
      animation: correctBounce 1s ease-out;
    }

    .incorrect {
      color: #FF6347;
      font-size: 30px;
      display: none;
      animation: incorrectBounce 1s ease-out;
    }

    .sound-btn {
      background-color: #FFD700;
      padding: 20px 40px;
      font-size: 24px;
      border: none;
      border-radius: 15px;
      cursor: pointer;
      margin-top: 30px;
      transition: background-color 0.3s ease;
      animation: pulse 1s infinite;
    }

    .sound-btn:hover {
      background-color: #FF8C00;
    }

    .score {
      font-size: 30px;
      color: #333;
      margin-top: 30px;
    }

    .restart-btn {
      background-color: #32CD32;
      padding: 25px 50px;
      font-size: 28px;
      border: none;
      border-radius: 15px;
      cursor: pointer;
      margin-top: 40px;
      margin-left:600px;
      transition: background-color 0.3s ease;
    }

    .restart-btn:hover {
      background-color: #228B22;
    }

    /* Keyframe Animations */
    @keyframes bounce {
      0% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(-20px);
      }
      100% {
        transform: translateY(0);
      }
    }

    @keyframes correctBounce {
      0% {
        transform: scale(1.2);
        opacity: 0;
      }
      100% {
        transform: scale(1);
        opacity: 1;
      }
    }

    @keyframes incorrectBounce {
      0% {
        transform: scale(1.2);
        opacity: 0;
      }
      100% {
        transform: scale(1);
        opacity: 1;
      }
    }

    @keyframes pulse {
      0% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.1);
      }
      100% {
        transform: scale(1);
      }
    }

    @keyframes fadeInUp {
      0% {
        opacity: 0;
        transform: translateY(30px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes gradientBG {
      0% {
        background-position: 0% 50%;
      }
      50% {
        background-position: 100% 50%;
      }
      100% {
        background-position: 0% 50%;
      }
    }

    @media (max-width: 768px) {
      .hero h1 {
        font-size: 2.5rem;
      }

      .hero p {
        font-size: 1.2rem;
      }

      .auth-buttons button {
        padding: 12px 20px;
        font-size: 1rem;
      }

      .help-button {
        bottom: 15px;
        left: 15px;
        font-size: 16px;
      }

      .hero img {
        width: 200px;
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
        <a href="../quizzes/Counting-object-quiz.jsp">Counting object Quiz</a>
        <a href="../quizzes/math_operation_quiz.jsp">Math Quiz</a>
        <a href="../quizzes/number_word_quiz.jsp">Number to Word</a>
        <a href="../quizzes/rhyming_word_quiz.jsp">Rhyming Words</a>

      </div>
    </li>

  
    <li>
  <a href="javascript:void(0);">Games</a>
  <div class="dropdown">
    <a href="Animal_habitat.jsp">Animal habitat Games</a>
    <a href="animal_sound.jsp">Animal sound  Games</a>
    <a href="color_game.jsp">color_hint_game Games</a>
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
  <div class="hero">
    <h1>Interactive Animal Sounds Quiz</h1>
    <p>Learn and have fun with animal sounds!</p>
  </div>

  <!-- ? QUESTION 1: Cow -->
<div class="quiz-container">
  <img src="https://img.freepik.com/free-vector/cow-family-garden_1308-29180.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Cow" class="animal-image" id="cow">
  <p>What sound does a cow make?</p>
  <div class="options">
    <button onclick="checkAnswer('Moo', 'cow',this )">Moo</button>
    <button onclick="checkAnswer('Meow', 'cow',this )">Meow</button>
    <button onclick="checkAnswer('Woof', 'cow',this )">Woof</button>
  </div>
  <button class="sound-btn" onclick="playSound('cow')">Play Cow Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>

<!-- ? QUESTION 2: Cat -->
<div class="quiz-container">
  <img src="https://img.freepik.com/free-vector/sticker-template-cat-cartoon-character_1308-68088.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Cat" class="animal-image" id="cat">
  <p>What sound does a cat make?</p>
  <div class="options">
    <button onclick="checkAnswer('Moo', 'cat',this)">Moo</button>
   <button onclick="checkAnswer('Meow', 'cat',this)">Meow</button>
    <button onclick="checkAnswer('Quack', 'cat',this)">Quack</button>
  </div>
  <button class="sound-btn" onclick="playSound('cat')">Play Cat Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>

<!-- ? QUESTION 3: Dog -->
<div class="quiz-container">
  <img src="https://img.freepik.com/free-vector/cheerful-puppy-floral-wonderland_1308-161984.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Dog" class="animal-image" id="dog">
  <p>What sound does a dog make?</p>
  <div class="options">
    <button onclick="checkAnswer('Woof', 'dog',this)">Woof</button>
    <button onclick="checkAnswer('Moo', 'dog',this)">Moo</button>
    <button onclick="checkAnswer('Neigh', 'dog',this)">Neigh</button>
  </div>
  <button class="sound-btn" onclick="playSound('dog')">Play Dog Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>

<!-- ? QUESTION 4: Duck -->
<div class="quiz-container">
  <img src="https://img.freepik.com/free-vector/little-duck-standing-rock_1308-134434.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Duck" class="animal-image" id="duck">
  <p>What sound does a duck make?</p>
  <div class="options">
    <button onclick="checkAnswer('Woof', 'duck',this)">Woof</button>
    <button onclick="checkAnswer('Moo', 'duck',this)">Moo</button>
     <button onclick="checkAnswer('Quack', 'duck',this)">Quack</button>

  </div>
  <button class="sound-btn" onclick="playSound('duck')">Play Duck Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>

<!-- ? QUESTION 5: Lion -->
<div class="quiz-container">
  <img src="https://img.freepik.com/premium-vector/cartoon-illustration-lion-jungle-with-jungle-background_730620-955052.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Lion" class="animal-image" id="lion">
  <p>What sound does a lion make?</p>
  <div class="options">
    <button onclick="checkAnswer('Quack', 'lion',this)">Quack</button>
    <button onclick="checkAnswer('Woof', 'lion',this)">Woof</button>
    <button onclick="checkAnswer('Roar', 'lion',this)">Roar</button>

  </div>
  <button class="sound-btn" onclick="playSound('lion')">Play Lion Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>

<!-- ? QUESTION 6: Frog -->
<div class="quiz-container">
  <img src="https://img.freepik.com/free-vector/hand-drawn-frog-cartoon-illustration_23-2151320895.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Frog" class="animal-image" id="frog">
  <p>What sound does a frog make?</p>
  <div class="options">
    <button onclick="checkAnswer('Meow', 'frog',this)">Meow</button>
    <button onclick="checkAnswer('Ribbit', 'frog',this)">Ribbit</button>
    <button onclick="checkAnswer('Neigh', 'frog',this)">Neigh</button>
  </div>
  <button class="sound-btn" onclick="playSound('frog')">Play Frog Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>

<!-- ? QUESTION 7: Sheep -->
<div class="quiz-container">
  <img src="https://img.freepik.com/free-vector/hand-drawn-cartoon-sheep-illustration_23-2150399935.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Sheep" class="animal-image" id="sheep">
  <p>What sound does a sheep make?</p>
  <div class="options">
    <button onclick="checkAnswer('Quack', 'sheep',this)">Quack</button>
    <button onclick="checkAnswer('Moo', 'sheep',this)">Moo</button>
    <button onclick="checkAnswer('Baa', 'sheep',this)">Baa</button>

  </div>
  <button class="sound-btn" onclick="playSound('sheep')">Play Sheep Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>

<!-- ? QUESTION 8: Elephant -->
<div class="quiz-container">
  <img src="https://img.freepik.com/free-vector/elephant-standing-land-with-rainbow_1308-62733.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Elephant" class="animal-image" id="elephant">
  <p>What sound does an elephant make?</p>
  <div class="options">
    <button onclick="checkAnswer('Woof', 'elephant',this)">Woof</button>
        <button onclick="checkAnswer('Trumpet', 'elephant',this)">Trumpet</button>
    <button onclick="checkAnswer('Meow', 'elephant',this)">Meow</button>
  </div>
  <button class="sound-btn" onclick="playSound('elephant')">Play Elephant Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>

<!-- ? QUESTION 9: Horse -->
<div class="quiz-container">
  <img src="https://img.freepik.com/free-vector/brown-horse-cartoon-isolated_1308-141019.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Horse" class="animal-image" id="horse">
  <p>What sound does a horse make?</p>
  <div class="options">
    <button onclick="checkAnswer('Baa', 'horse',this)">Baa</button>
    <button onclick="checkAnswer('Neigh', 'horse',this)">Neigh</button>
    <button onclick="checkAnswer('Trumpet', 'horse',this)">Trumpet</button>
  </div>
  <button class="sound-btn" onclick="playSound('horse')">Play Horse Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>

<!-- ? QUESTION 10: Fox -->
<div class="quiz-container">
  <img src="https://img.freepik.com/free-vector/cute-fox-flat-cartoon-style_1308-121093.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid"
       alt="Fox" class="animal-image" id="fox">
  <p>What sound does a fox make?</p>
  <div class="options">

    <button onclick="checkAnswer('Huu', 'fox',this)">Huu</button>
    <button onclick="checkAnswer('Baa', 'fox',this)">Baa</button>
    <button onclick="checkAnswer('Quack', 'fox',this)">Quack</button>
  </div>
  <button class="sound-btn" onclick="playSound('fox')">Play Fox Sound</button>
  <p class="correct">Correct! Well done!</p>
  <p class="incorrect">Oops! Try again.</p>
</div>


    <form action="animal_sound_score.jsp">
        <input type="hidden" name="score_new" id="score_new">
        <input class="restart-btn" type="submit" name="submit" value="sumbit game" onclick="updateScore()">
    </form>

    <button class="restart-btn" onclick="restartQuiz()">Restart Quiz</button>
  

  <script>
    let score = 0;

function playSound(animal) {
  const sounds = {
    cow: "sound/cow_sound.mp3",
    cat: "sound/cat_sound.mp3",
    dog: "sound/dog_sound.mp3",
    duck: "sound/duck_sound.mp3",
    lion: "sound/lion_sound.mp3",
    frog: "sound/frog_sound.mp3",
    sheep: "sound/sheep_sound.mp3",
    elephant: "sound/elephant_sound.mp3",
    horse: "sound/horse_sound.mp3",
    fox: "sound/fox_sound.mp3"
  };

  const soundUrl = sounds[animal];

  if (soundUrl) {
    const audio = new Audio(soundUrl);
    audio.play().catch(error => console.error("Playback failed:", error));
  } else {
    console.error("Sound not found for:", animal);
  }
}

   function checkAnswer(answer, animal, buttonElement) {
  const correctAnswers = {
    cow: "Moo",
    cat: "Meow",
    dog: "Woof",
    duck: "Quack",
    lion: "Roar",
    sheep: "Baa",
    frog: "Ribbit",
    elephant: "Trumpet",
    horse: "Neigh",
    fox: "Huuu"
  };

  const correctAnswer = correctAnswers[animal];

  const currentQuizContainer = buttonElement.closest('.quiz-container');
  const resultMessage = currentQuizContainer ? currentQuizContainer.querySelector('.correct') : null;
  const resultMessageIncorrect = currentQuizContainer ? currentQuizContainer.querySelector('.incorrect') : null;
  const allButtons = currentQuizContainer ? currentQuizContainer.querySelectorAll('.options button') : [];

  if (allButtons.length > 0) {
    allButtons.forEach(button => button.disabled = true);
  }

  if (resultMessage) {
    resultMessage.style.display = 'none';
  }

  if (resultMessageIncorrect) {
    resultMessageIncorrect.style.display = 'none';
  }

  if (answer === correctAnswer) {
    if (resultMessage) {
      resultMessage.style.display = 'block';
    }
    score++;
  } else {
    if (resultMessageIncorrect) {
      resultMessageIncorrect.style.display = 'block';
    }
  }

}

 function updateScore() {
            document.getElementById("score_new").value=score;
        }

    // Function to restart the quiz
    function restartQuiz() {
  // Reset the score
  score = 0;
  document.getElementById('score').textContent = score;

  // Hide all result messages
  const allResultMessages = document.querySelectorAll('.correct, .incorrect');
  allResultMessages.forEach(message => {
    message.style.display = 'none';
  });

  // Enable all buttons for all questions
  const allButtons = document.querySelectorAll('.options button');
  allButtons.forEach(button => {
    button.disabled = false;
  });
}

  </script>

</body>
</html>

