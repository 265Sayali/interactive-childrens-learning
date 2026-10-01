<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Color and Speech</title>

    <script>
        function speakColor(colorName) {
            var msg = new SpeechSynthesisUtterance(colorName); // Create speech object
            window.speechSynthesis.speak(msg); // Speak the color name
        }
    </script>

    <style>
        /* Background Gradient Animation */
        @keyframes gradientBackground {
            0% { background: linear-gradient(to right, #ff7e5f, #feb47b); }
            25% { background: linear-gradient(to right, #6a11cb, #2575fc); }
            50% { background: linear-gradient(to right, #ff6a00, #ee0979); }
            75% { background: linear-gradient(to right, #00c6ff, #0072ff); }
            100% { background: linear-gradient(to right, #00b09b, #96c93d); }
        }

        body {
            font-family: "Comic Sans MS", cursive, sans-serif; /* Applied Comic Sans MS */
            background: linear-gradient(to right, #00c6ff, #0072ff); /* Initial Gradient */
            color: white;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            animation: gradientBackground 10s ease infinite; /* Apply animated gradient */
        }

        h1 {
            font-size: 2.5em;
            margin-top: 50px;
            animation: fadeIn 2s ease-out;
            position: fixed;
            top: 20px; /* Keep it at the top */
            text-align: center;
            width: 100%;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
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

        .color-circle-container {
            
            display: flex;
            flex-wrap: wrap; /* Allow items to wrap onto the next line */
            justify-content: center; /* Center items horizontally */
            margin-top: 100px; /* Space for the fixed title */
            width: 60%; /* Adjust width */
            height: calc(100vh - 100px); /* Remaining height for the grid */
            overflow-y: auto; /* Allow scrolling */
            padding-bottom: 20px; /* Add some padding at the bottom */
        }

        .color-circle {
            border: 2px solid #333;
            width: 100px; /* Smaller width */
            height: 100px; /* Smaller height */
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%; /* Makes the box a circle */
            font-size: 16px; /* Smaller text size */
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin: 10px; /* Add space between circles */
        }

        .color-circle:hover {
            transform: scale(1.1);
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
        }

        .color-circle:active {
            transform: scale(1);
        }

        /* Color Classes */
        .red { background-color: #FF4F58; }
        .blue { background-color: #4F6DFF; }
        .green { background-color: #2DFF6D; }
        .yellow { background-color: #FFCC00; color: black; }
        .pink { background-color: #FF6F91; }
        .purple { background-color: #9B59B6; }
        .orange { background-color: #FFA500; }
        .brown { background-color: #8B4513; }
        .cyan { background-color: #00FFFF; }
        .magenta { background-color: #FF00FF; }
        .lime { background-color: #00FF00; }
        .indigo { background-color: #4B0082; }
        .violet { background-color: #EE82EE; }
        .gold { background-color: #FFD700; }
        .silver { background-color: #C0C0C0; }
        .teal { background-color: #008080; }
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


    <h1>Click on a color to hear its name!</h1>

    <div class="color-circle-container">
        <div class="color-circle red" onclick="speakColor('Red')">Red</div>
        <div class="color-circle blue" onclick="speakColor('Blue')">Blue</div>
        <div class="color-circle green" onclick="speakColor('Green')">Green</div>
        <div class="color-circle yellow" onclick="speakColor('Yellow')">Yellow</div>
        <div class="color-circle pink" onclick="speakColor('Pink')">Pink</div>
        <div class="color-circle purple" onclick="speakColor('Purple')">Purple</div>
        <div class="color-circle orange" onclick="speakColor('Orange')">Orange</div>
        <div class="color-circle brown" onclick="speakColor('Brown')">Brown</div>
        <div class="color-circle cyan" onclick="speakColor('Cyan')">Cyan</div>
        <div class="color-circle magenta" onclick="speakColor('Magenta')">Magenta</div>
        <div class="color-circle lime" onclick="speakColor('Lime')">Lime</div>
        <div class="color-circle indigo" onclick="speakColor('Indigo')">Indigo</div>
        <div class="color-circle violet" onclick="speakColor('Violet')">Violet</div>
        <div class="color-circle gold" onclick="speakColor('Gold')">Gold</div>
        <div class="color-circle silver" onclick="speakColor('Silver')">Silver</div>
        <div class="color-circle teal" onclick="speakColor('Teal')">Teal</div>
    </div>

</body>
</html>
