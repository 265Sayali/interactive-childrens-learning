<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alphabet Learning</title>
    <style>
       body {
        text-align: center;
        font-family: 'Comic Sans MS', cursive, sans-serif;
        background: linear-gradient(135deg, #f8bbd0, #f06292, #ec407a, #d81b60);
        background-size: 400% 400%;
        animation: gradientAnimation 10s ease infinite;
        margin: 0;
        padding: 0;
    }
    /* Animate the gradient for a dynamic background */
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

      /* Fun Text Styling */
    h1 {
        color: #ff4081;
        font-size: 50px;
        margin-top: 50px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        letter-spacing: 2px;
    }
    /* Container Styling */
    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin-top: 50px;
    }

    /* Individual Letter Styling */
    .letter {
        font-size: 50px;
        font-weight: bold;
        color: white;
        width: 120px;
        height: 120px;
        line-height: 120px;
        text-align: center;
        margin: 15px;
        border-radius: 50%;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
        animation: bounce 1s ease-in-out infinite;
    }
 /* Random Colors Applied to Letters */
 .letter:nth-child(1) { background-color: #ff6347; }
        .letter:nth-child(2) { background-color: #ff7f50; }
        .letter:nth-child(3) { background-color: #ff1493; }
        .letter:nth-child(4) { background-color: #00bfff; }
        .letter:nth-child(5) { background-color: #8a2be2; }
        .letter:nth-child(6) { background-color: #ff6347; }
        .letter:nth-child(7) { background-color: #00fa9a; }
        .letter:nth-child(8) { background-color: #ff69b4; }
        .letter:nth-child(9) { background-color: #ff4500; }
        .letter:nth-child(10) { background-color: #adff2f; }
        .letter:nth-child(11) { background-color: #ff6347; }
        .letter:nth-child(12) { background-color: #ba55d3; }
        .letter:nth-child(13) { background-color: #32cd32; }
        .letter:nth-child(14) { background-color: #dda0dd; }
        .letter:nth-child(15) { background-color: #ff8c00; }
        .letter:nth-child(16) { background-color: #00ff7f; }
        .letter:nth-child(17) { background-color: #ffb6c1; }
        .letter:nth-child(18) { background-color: #7cfc00; }
        .letter:nth-child(19) { background-color: #ff00ff; }
        .letter:nth-child(20) { background-color: #cd5c5c; }
        .letter:nth-child(21) { background-color: #ff4500; }
        .letter:nth-child(22) { background-color: #6a5acd; }
        .letter:nth-child(23) { background-color: #c71585; }
        .letter:nth-child(24) { background-color: #ff6347; }
        .letter:nth-child(25) { background-color: #00ffff; }
        .letter:nth-child(26) { background-color: #ff1493; }

        .letter:nth-child(26) {
            grid-column: 2 / 7;
            margin-top: 50px;
        }    
    /* Hover Effect for Letters */
    .letter:hover {
        transform: scale(1.2);
        box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.5);
        animation: bounce 0.5s ease-in-out;
    }
     .letter.clicked {
        background-color: #ffeb3b; /* Yellow color for clicked letters */
    }

    /* Bouncing Animation for Letters */
    @keyframes bounce {
        0%, 100% {
            transform: translateY(0);
        }
        50% {
            transform: translateY(-10px);
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
            color: #ff6600;
            font-size: 36px;
            margin-top: 20px;
      /* Title Styling */
    .title {
        display: inline-flex;
        align-items: center;
        color: transparent;
        background: linear-gradient(to right, #ff4b8d, #ff66b2, #ff3399); /* Gradient color (Pink to Deep Pink) */
        -webkit-background-clip: text; /* Clip the gradient to the text */
        background-clip: text;
        font-size: 50px;
        text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.4); /* Adding deeper shadow for more contrast */
        letter-spacing: 3px;
        margin-bottom: 20px;
    }

    .title::before,
    .title::after {
        content: "?"; 
        margin: 0 10px;
        font-size: 40px;
        color: #ff3366; /* Deep Pink Star color */
    }

            /* Letter Container Styling */
    .container {
        display: grid;
        grid-template-columns: repeat(5, 1fr) 1fr; /* Adjust the grid to have 6 columns but center the last one */
        grid-gap: 15px; /* Space between letters */
        justify-items: center;
        align-items: center;
        width: 90%; /* To make the container responsive */
        max-width: 1200px; /* Limit the maximum width */
        margin: 0 auto;
    }


       
     /* Individual Letter Styling */
    .letter {
        font-size: 40px;
        font-weight: bold;
        color: white;
        width: 80px;
        height: 80px;
        line-height: 80px;
        text-align: center;
        border-radius: 20px;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
        box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
    }

    /* Hover Effects for Letters */
    .letter:hover {
        transform: scale(1.1);
        box-shadow: 0px 7px 15px rgba(0, 0, 0, 0.3);
    } 
   
    
    @media (max-width: 768px) {
    .container {
        grid-template-columns: repeat(3, 1fr); /* 3 columns on smaller screens */
    }


@media (max-width: 480px) {
    .container {
        grid-template-columns: repeat(2, 1fr); /* 2 columns on very small screens */
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


    <h1 class="title"> Click a Letter to Hear its Pronunciation</h1>

    <div class="container">
        <div class="letter red" onclick="speak('A')">A</div>
        <div class="letter blue" onclick="speak('B')">B</div>
        <div class="letter green" onclick="speak('C')">C</div>
        <div class="letter orange" onclick="speak('D')">D</div>
        <div class="letter purple" onclick="speak('E')">E</div>
        <div class="letter yellow" onclick="speak('F')">F</div>
        <div class="letter red" onclick="speak('G')">G</div>
        <div class="letter blue" onclick="speak('H')">H</div>
        <div class="letter green" onclick="speak('I')">I</div>
        <div class="letter orange" onclick="speak('J')">J</div>
        <div class="letter purple" onclick="speak('K')">K</div>
        <div class="letter yellow" onclick="speak('L')">L</div>
        <div class="letter red" onclick="speak('M')">M</div>
        <div class="letter blue" onclick="speak('N')">N</div>
        <div class="letter green" onclick="speak('O')">O</div>
        <div class="letter orange" onclick="speak('P')">P</div>
        <div class="letter purple" onclick="speak('Q')">Q</div>
        <div class="letter yellow" onclick="speak('R')">R</div>
        <div class="letter red" onclick="speak('S')">S</div>
        <div class="letter blue" onclick="speak('T')">T</div>
        <div class="letter green" onclick="speak('U')">U</div>
        <div class="letter orange" onclick="speak('V')">V</div>
        <div class="letter purple" onclick="speak('W')">W</div>
        <div class="letter yellow" onclick="speak('X')">X</div>
        <div class="letter red" onclick="speak('Y')">Y</div>
        <div class="letter blue" onclick="speak('Z')">Z</div>
    </div>

    <script>
        function speak(letter) {
            let msg = new SpeechSynthesisUtterance(letter);
            msg.lang = 'en-US';
            msg.rate = 0.8;
            window.speechSynthesis.speak(msg);
        }
        
    </script>

</body>
</html>

