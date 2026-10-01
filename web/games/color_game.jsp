<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Color Game</title>
    <style>
/* Apply Comic Sans MS font to the entire page */
body {
    font-family: 'Comic Sans MS', cursive, sans-serif; /* Comic Sans MS font */
    text-align: center;
    background: linear-gradient(45deg, #ff6b6b, #ff7b7b, #ffbb77, #ffdf77, #ff6bff); /* Colorful gradient */
    background-size: 400% 400%; /* Increase the size for smoother animation */
    animation: gradientAnimation 10s ease infinite; /* Add animation to the gradient */
    color: #333333; /* Dark text color for better readability */
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
  width: 100%;
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
  position: relative;
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

/* Dropdown Menu */
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

.navbar ul li:hover .dropdown {
  display: block;
}


.header h1 {
    color: blue;
  font-size: 3rem;
  margin-bottom: 15px;
  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
}


/* CSS for the buttons (circular with thin dashed border) */
/* Container for the options */
.options {
    text-align: center; /* Center the buttons horizontally */
}

/* Apply floating to each button */
.button {
    color: white;
    padding: 20px;
    margin: 10px;
    border: 2px solid #333;
    cursor: pointer;
    font-size: 24px;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    box-sizing: border-box;
    background-color: #3498db;
    transition: all 0.3s ease; /* Smooth transition for hover effects */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Shadow to create the floating effect */
}

/* Hover effect */
.button:hover {
    transform: translateY(-10px); /* Moves the button up on hover */
    box-shadow: 0 16px 32px rgba(0, 0, 0, 0.3); /* Increases shadow for more floating effect */
}

/* CSS for the Restart Button */
.restartButton {
    font-family: 'Comic Sans MS', cursive, sans-serif; /* Apply Comic Sans MS */
    background-color: #ff5722; /* Add background color */
    color: white; /* Set text color */
    padding: 15px 30px; /* Add padding */
    border: 2px dashed #333; /* Thin dashed border */
    font-size: 18px; /* Set font size */
    cursor: pointer; /* Change cursor to pointer on hover */
    border-radius: 8px; /* Rounded corners */
    transition: transform 0.3s ease; /* Optional transition for click effect */
}

.restartButton:hover {
    transform: scale(1.1); /* Slightly enlarge on hover for effect */
}

/* CSS for the Score Section */

/* CSS for the Feedback Section */
#feedback {
    font-family: 'Comic Sans MS', cursive, sans-serif; /* Apply Comic Sans MS */
    font-size: 20px; /* Set font size */
    margin: 20px;
    padding: 10px 20px; /* Add padding */
    color: #f44336; /* Red color for feedback */
    font-weight: bold; /* Make it bold for emphasis */
    background-color: #ffffff; /* Set background color */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    display: inline-block;
}

/* CSS for the Question Section */
#question {
    font-family: 'Comic Sans MS', cursive, sans-serif; /* Apply Comic Sans MS */
    font-size: 28px; /* Set font size */
    margin: 20px;
    color: blue; /* Set text color to a dark shade */
    font-weight: bold; /* Make it bold for emphasis */
    background-color: #ffffff; /* Set background color */
    padding: 10px 20px; /* Add padding */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    display: inline-block;
}

/* CSS for the Question Number Section */
#questionNumber {
    font-family: 'Comic Sans MS', cursive, sans-serif; /* Apply Comic Sans MS */
    font-size: 24px; /* Set font size */
    margin: 20px;
    color: #333333; /* Set text color to a dark shade */
    font-weight: bold; /* Make it bold */
}
.options {
    display: flex;
    flex-wrap: wrap;
    justify-content: center; /* Center the buttons */
    gap: 20px; /* Space between buttons */
}

/* Media Queries */
@media (max-width: 768px) {
    body {
        background-color: #f0f8ff; /* Change background color for mobile */
    }

    .button {
        width: 80px; /* Adjust width for smaller screens */
        height: 80px; /* Adjust height for smaller screens */
        font-size: 18px; /* Adjust font size for smaller screens */
    }

    .restartButton {
        padding: 12px 24px; /* Adjust padding for smaller screens */
        font-size: 16px; /* Adjust font size for smaller screens */
    }

     #feedback, #question, #questionNumber {
        font-size: 18px; /* Adjust font size for mobile */
        padding: 8px 16px; /* Adjust padding for smaller screens */
    }

    .button:hover {
        transform: scale(1); /* Disable hover effect for small screens */
    }
}

/* For even smaller screens, like smartphones in portrait orientation */
@media (max-width: 480px) {
    body {
        background-color: #e0f7fa; /* Set lighter background color */
    }

    .button {
        width: 60px; /* Further adjust width */
        height: 60px; /* Further adjust height */
        font-size: 16px; /* Further adjust font size */
    }

    .restartButton {
        padding: 10px 20px; /* Further adjust padding */
        font-size: 14px; /* Further adjust font size */
    }

    #score, #feedback, #question, #questionNumber {
        font-size: 16px; /* Further reduce font size */
        padding: 6px 12px; /* Further reduce padding */
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

    <h1>Color Game </h1>
    
    <div id="questionNumber">Question 1</div>
    <div id="question">Click the <span style="font-weight: bold;" id="color_name">Red</span> color!</div>
   
   <div class="options">
    <button class="button" id="option1" onclick="checkAnswer('red')"></button>
    <button class="button" id="option2" onclick="checkAnswer('blue')"></button>
    <button class="button" id="option3" onclick="checkAnswer('green')"></button>
    <button class="button" id="option4" onclick="checkAnswer('yellow')"></button>
    <button class="button" id="option5" style="display: none;" onclick="checkAnswer('purple')"></button>
    <button class="button" id="option6" style="display: none;" onclick="checkAnswer('orange')"></button>
    <button class="button" id="option7" style="display: none;" onclick="checkAnswer('pink')"></button>
    <button class="button" id="option8" style="display: none;" onclick="checkAnswer('brown')"></button>
    <button class="button" id="option9" style="display: none;" onclick="checkAnswer('black')"></button>
    <button class="button" id="option10" style="display: none;" onclick="checkAnswer('white')"></button>
</div>


    <br><br>
    <div id="feedback"></div>
    <div id="score"></div>
    
 <form action="color_game_score.jsp">
        <input type="hidden" name="score_new" id="score_new">
        <input class="restartButton" type="submit" name="submit" value="sumbit game" onclick="updateScore()">
    </form>
    
    <br><br>
<button class="restartButton" type="button" onclick="window.location.href='color_game.jsp';">Restart Quiz</button>
    
    <script>
        var currentQuestion = '';
        var score = 0;
        var questionNumber = 0;
        var questionsAsked = 0; // To track how many questions have been asked
        var totalQuestions = 10; // Number of questions to ask
        var questions = [
    { color: 'red', question: 'Click the Red color!' },
    { color: 'blue', question: 'Click the Blue color!' },
    { color: 'green', question: 'Click the Green color!' },
    { color: 'yellow', question: 'Click the Yellow color!' },
    { color: 'purple', question: 'Click the Purple color!' },
    { color: 'orange', question: 'Click the Orange color!' },
    { color: 'pink', question: 'Click the Pink color!' },
    { color: 'brown', question: 'Click the Brown color!' },
    { color: 'black', question: 'Click the Black color!' },
    { color: 'white', question: 'Click the White color!' }
];

        function randomQuestion() {
            var questionIndex = Math.floor(Math.random() * questions.length);
            return questions[questionIndex];
        }

        function checkAnswer(selectedColor) {
            if (selectedColor === currentQuestion.color) {
                score++;
                document.getElementById('feedback').innerHTML = 'Correct! Well done!';
                document.getElementById('feedback').style.color = '#4CAF50';
            } else {
                document.getElementById('feedback').innerHTML = 'Oops! Try again.';
                document.getElementById('feedback').style.color = '#f44336';
            }

            updateScore();
            questionsAsked++;
            if (questionsAsked < totalQuestions) {
                setTimeout(nextQuestion, 1000); // Move to the next question after 1 second
            } else {
                setTimeout(endGame, 1000); // End the game after all questions are answered
            }
        }

        function updateScore() {
            document.getElementById("score_new").value=score;
        }

      // Function to randomly select 4 options, including the correct color
function getRandomOptions(correctColor) {
    var colors = ['red', 'blue', 'green', 'yellow', 'purple', 'orange', 'pink', 'brown', 'black', 'white'];
    var selectedColors = [];

    // Ensure the correct color is included
    selectedColors.push(correctColor);

    // Select 3 additional random colors, excluding the correct color
    while (selectedColors.length < 4) {
        var randomColor = colors[Math.floor(Math.random() * colors.length)];
        if (!selectedColors.includes(randomColor)) {
            selectedColors.push(randomColor);
        }
    }

    // Shuffle the options to randomize their order
    selectedColors = selectedColors.sort(() => Math.random() - 0.5);

    return selectedColors;
}

// Update the question and available options
function nextQuestion() {
    currentQuestion = randomQuestion();

    // Get 4 random options, including the correct color
    var randomOptions = getRandomOptions(currentQuestion.color);

    // Display the question
    document.getElementById('color_name').innerText = currentQuestion.color;

    // Set the background colors for the 4 buttons with the random options
    for (var i = 0; i < randomOptions.length; i++) {
        var buttonId = 'option' + (i + 1);
        document.getElementById(buttonId).style.backgroundColor = randomOptions[i];
        document.getElementById(buttonId).style.display = 'inline-block';
        document.getElementById(buttonId).setAttribute('onclick', 'checkAnswer("' + randomOptions[i] + '")');
    }

    // Hide the other buttons
    for (var i = randomOptions.length; i < 10; i++) {
        document.getElementById('option' + (i + 1)).style.display = 'none';
    }

    // Reset feedback and update question number
    document.getElementById('feedback').innerHTML = '';
    questionNumber++;
    document.getElementById('questionNumber').innerText = "Question " + questionNumber;

    // Speak the question aloud
    speakQuestion();
}

// Function to read the question aloud (Speech synthesis)
function speakQuestion() {
    if ('speechSynthesis' in window) {
        var utterance = new SpeechSynthesisUtterance(currentQuestion.question);
        window.speechSynthesis.speak(utterance);
    } else {
        console.log("Speech synthesis not supported in this browser.");
    }
}

        function endGame() {
            document.getElementById('question').innerHTML = 'Game Over!';
          //  document.getElementById('feedback').innerHTML = 'Your final score is ' + score;

            // Disable all buttons after game ends
            var buttons = document.querySelectorAll('.button');
            buttons.forEach(function(button) {
                button.disabled = true;
            });
        }

        // Start the game
        nextQuestion();  // Initialize the first question

    </script>
</body>
</html>

