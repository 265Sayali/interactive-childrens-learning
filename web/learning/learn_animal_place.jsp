<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Animals and Their Habitats</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background-color: #f0f8ff;
            text-align: center;
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


        h1 {
            font-size: 2.5em;
            color: #4caf50;
            margin-top: 20px;
        }

        .animal-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 30px;
        }

        .animal-card {
            background-color: #ffffff;
            border: 2px solid #cccccc;
            margin: 20px;
            padding: 20px;
            width: 300px;
            border-radius: 15px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .animal-card:hover {
            transform: scale(1.1);
        }

        .animal-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 10px;
        }

        .animal-name {
            font-size: 1.5em;
            color: #333;
            margin-top: 15px;
        }

        .habitat-container {
            margin-top: 20px;
        }

        .habitat-image {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
        }

        .habitat-name {
            font-size: 1.2em;
            color: #00796b;
            margin-top: 10px;
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

    <h1>Animals and Their Habitats</h1>

    <div class="animal-container">

        <!-- Animal 1 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse1.mm.bing.net/th?id=OIP.HAh5w0FwT8affDvNdhSuBwHaF5&pid=Api&P=0&h=180" alt="Fish">
            <div class="animal-name">Fish</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse4.mm.bing.net/th?id=OIP.0Xbl2ysgFljhkYJA6xdCFgHaEK&pid=Api&P=0&h=180" 
                     alt="Ocean">
                <div class="habitat-name">Sea / Ocean</div>
            </div>
        </div>

        <!-- Animal 2 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse2.mm.bing.net/th?id=OIP.Pfzte9nVgNgXPmtylp640QHaG4&pid=Api&P=0&h=180" alt="Lion">
            <div class="animal-name">Lion</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse1.mm.bing.net/th?id=OIP.9xNPP1T9QIcFu5vJNk4hagHaEI&pid=Api&P=0&h=180" 
                     alt="Grasslands">
                <div class="habitat-name"> Grasslands</div>
            </div>
        </div>

        <!-- Animal 3 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse1.mm.bing.net/th?id=OIP.tTLgglEr7S_ShZDhaMpCRAHaIE&pid=Api&P=0&h=180" alt="Eagle">
            <div class="animal-name">Eagle</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse3.mm.bing.net/th?id=OIP.Bb-77hmXniT7hmpOSboHTgHaGo&pid=Api&P=0&h=180" alt="Mountains">
                <div class="habitat-name">Mountains / Forests</div>
            </div>
        </div>

        <!-- Animal 4 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse1.mm.bing.net/th?id=OIP.h5XtweMyulwK4d8nzDAnegHaF4&pid=Api&P=0&h=180" alt="Elephant">
            <div class="animal-name">Elephant</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse4.mm.bing.net/th?id=OIP.krSKOZokFqJptUcVPvRAxQHaFC&pid=Api&P=0&h=180" alt="Forests">
                <div class="habitat-name"> Forests</div>
            </div>
        </div>

        <!-- Animal 5 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse4.mm.bing.net/th?id=OIP.Rd0KVCn1R6oPvhvRswV4JgHaHa&pid=Api&P=0&h=180" alt="Penguin">
            <div class="animal-name">Penguin</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse3.mm.bing.net/th?id=OIP.eaGm7Unsn9jfNf5He4VIBAHaEl&pid=Api&P=0&h=180" alt="Antarctica">
                <div class="habitat-name">Antarctica</div>
            </div>
        </div>

        <!-- Animal 6 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse3.mm.bing.net/th?id=OIP.1U-HKEkIO8V_pXLh1ML9HQHaFj&pid=Api&P=0&h=180" alt="Giraffe">
            <div class="animal-name">Giraffe</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse2.mm.bing.net/th?id=OIP.-3wvAqWErC9xO7UeT_OzhAHaDR&pid=Api&P=0&h=180" alt="Savanna">
                <div class="habitat-name">Savanna / Grasslands</div>
            </div>
        </div>

        <!-- Animal 7 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse3.mm.bing.net/th?id=OIP.knjFzs7ylV5sso83xjPMYQHaGZ&pid=Api&P=0&h=180" alt="Kangaroo">
            <div class="animal-name">Kangaroo</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse3.mm.bing.net/th?id=OIP.L9TIVjD2ErHkdONc5XMJHQHaCS&pid=Api&P=0&h=180" alt="Australia">
                <div class="habitat-name">Australian Bush / Grasslands</div>
            </div>
        </div>

        <!-- Animal 8 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse4.mm.bing.net/th?id=OIP.vRDyVq42jmHYfPKBuY-dHwHaF_&pid=Api&P=0&h=180" alt="Tiger">
            <div class="animal-name">Tiger</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse1.mm.bing.net/th?id=OIP.fJlGRSE2bAARbobm60YTOAHaEH&pid=Api&P=0&h=180" alt="Rainforest">
                <div class="habitat-name">Rainforests / Grasslands</div>
            </div>
        </div>

        <!-- Animal 9 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse1.mm.bing.net/th?id=OIP.4yL_efdabXjCNzhBwztlzQHaGO&pid=Api&P=0&h=180" alt="Whale">
            <div class="animal-name">Whale</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse3.mm.bing.net/th?id=OIP.IIdafr2k57XlXYnIrjthuQHaEv&pid=Api&P=0&h=180" alt="Ocean">
                <div class="habitat-name">Ocean</div>
            </div>
        </div>

        <!-- Animal 10 -->
        <div class="animal-card">
            <img class="animal-image" src="https://tse3.mm.bing.net/th?id=OIP.SQuQpsuM5eEo-HX4tZIkqwHaKr&pid=Api&P=0&h=180" alt="Panda">
            <div class="animal-name">Panda</div>
            <div class="habitat-container">
                <img class="habitat-image" src="https://tse1.mm.bing.net/th?id=OIP.wWhsWasvlbfLDOKynaiwiwHaJE&pid=Api&P=0&h=180" alt="Bamboo Forest">
                <div class="habitat-name">Bamboo Forests</div>
            </div>
        </div>

    </div>

</body>
</html>
