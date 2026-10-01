<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Three-Letter Word Pronunciation</title>

  <!-- Global CSS Styling -->
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* Base body settings with animated gradient using the same 3 colors as the cards */
    body {
      font-family: Arial, sans-serif;
      color: #333;
      text-align: center;
      margin: 0;
      padding: 0;
      /* Animated gradient background using the 3 colors */
      background: linear-gradient(270deg, #87CEEB, #FFC0CB, #FFFACD);
      background-size: 600% 600%;
      animation: gradientAnimation 20s ease infinite;
      overflow: hidden;
    }

    @keyframes gradientAnimation {
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

/* Apply Comic Sans MS Font Style to the Title with New Color Scheme */
h1 {
    font-family: 'Comic Sans MS', cursive, sans-serif; /* Comic Sans MS font */
    font-size: 48px;
    color: transparent; /* Make text transparent to show the background gradient */
    background: linear-gradient(to right, #8a2be2, #ff4500); /* Gradient from bright purple to vibrant orange */
    -webkit-background-clip: text; /* Ensure gradient is applied to text for webkit browsers */
    background-clip: text; /* Standard for other browsers */
    padding: 20px;
    text-transform: uppercase;
    letter-spacing: 3px;
    font-weight: bold;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.4); /* Add subtle shadow for more depth */
    animation: bounce 1s infinite alternate; /* Bounce animation for extra effect */
}

/* Bounce Effect */
@keyframes bounce {
    0% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-10px);
    }
    100% {
        transform: translateY(0);
    }
}

.word-list {
        display: grid;
        grid-template-columns: repeat(3, 1fr); /* Creates 3 equal-width columns */
        gap: 10px;  /* Space between the cards */
        margin-top: 20px;
    }
.container {
    max-height: 400px; /* Adjust height as needed */
    overflow-y: auto;  /* Enables vertical scrolling */
    display: flex;
    flex-direction: column; /* Ensures groups are in separate lines */
    gap: 10px; /* Adds spacing between groups */
}

.word-group {
    display: flex;
    justify-content: center; /* Centers words in each group */
    width: 100%; /* Ensures full width */
}

    

    /* General word card styling */
    .word-card {
      display: inline-block;
      width: 100px;
      height: 100px;
      margin: 10px;
      color: #333;
      text-align: center;
      line-height: 100px;
      border: 2px solid rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      cursor: pointer;
      font-size: 24px;
      transition: all 0.3s ease-in-out;
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
      position: relative;
      animation: bounce 0.5s ease-in-out;
    }

    .word-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
    }

    @keyframes bounce {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-15px); }
    }

    /* Individual color adjustments for word cards (same as used in the body background) */
    .word-card.blue {
      background-color: #87CEEB;
    }
    .word-card.blue:hover {
      background-color: #7ec7e6;
    }

    .word-card.pink {
      background-color: #FFC0CB;
    }
    .word-card.pink:hover {
      background-color: #FFB6C1;
    }

    .word-card.yellow {
      background-color: #FFFACD;
      color: #333;
    }
    .word-card.yellow:hover {
      background-color: #FAFAD2;
    }

    /* Responsive adjustments */
    @media (max-width: 600px) {
      .word-card {
        font-size: 18px;
        width: 120px;
        height: 120px;
        line-height: 120px;
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



  <!-- Word List Section -->
  <h1>Rhyming Words</h1>


<div class="word-list">
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('cat')">cat</div>
        <div class="word-card" onclick="playPronunciation('bat')">bat</div>
        <div class="word-card" onclick="playPronunciation('hat')">hat</div>
    </div>
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('dog')">dog</div>
        <div class="word-card" onclick="playPronunciation('log')">log</div>
        <div class="word-card" onclick="playPronunciation('fog')">fog</div>
    </div>
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('sun')">sun</div>
        <div class="word-card" onclick="playPronunciation('fun')">fun</div>
        <div class="word-card" onclick="playPronunciation('run')">run</div>
    </div>
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('bed')">bed</div>
        <div class="word-card" onclick="playPronunciation('red')">red</div>
        <div class="word-card" onclick="playPronunciation('led')">led</div>
    </div>
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('ball')">ball</div>
        <div class="word-card" onclick="playPronunciation('fall')">fall</div>
        <div class="word-card" onclick="playPronunciation('mall')">mall</div>
    </div>
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('car')">car</div>
        <div class="word-card" onclick="playPronunciation('bar')">bar</div>
        <div class="word-card" onclick="playPronunciation('star')">star</div>
    </div>
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('rain')">rain</div>
        <div class="word-card" onclick="playPronunciation('train')">train</div>
        <div class="word-card" onclick="playPronunciation('pain')">pain</div>
    </div>
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('kite')">kite</div>
        <div class="word-card" onclick="playPronunciation('bite')">bite</div>
        <div class="word-card" onclick="playPronunciation('site')">site</div>
    </div>
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('light')">light</div>
        <div class="word-card" onclick="playPronunciation('night')">night</div>
        <div class="word-card" onclick="playPronunciation('fight')">fight</div>
    </div>
    <div class="word-group">
        <div class="word-card" onclick="playPronunciation('blue')">blue</div>
        <div class="word-card" onclick="playPronunciation('true')">true</div>
        <div class="word-card" onclick="playPronunciation('glue')">glue</div>
    </div>
    <div class="word-group">
    <div class="word-card" onclick="playPronunciation('bell')">bell</div>
    <div class="word-card" onclick="playPronunciation('sell')">sell</div>
    <div class="word-card" onclick="playPronunciation('tell')">tell</div>
    </div>
    <div class="word-group">
    <div class="word-card" onclick="playPronunciation('pen')">pen</div>
    <div class="word-card" onclick="playPronunciation('ten')">ten</div>
    <div class="word-card" onclick="playPronunciation('hen')">hen</div>
    </div>

</div>


  <!-- JavaScript -->
  <script>
    function playPronunciation(word) {
      const utterance = new SpeechSynthesisUtterance(word);
      speechSynthesis.speak(utterance);
    }
  </script>

</body>
</html>
