<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animal Habitat Explorer</title>
    <style>
/* Global Styles */
body {
  margin: 0;
  padding: 0;
  font-family: 'Comic Sans MS', cursive, sans-serif;
  background: linear-gradient(to bottom, #c9ffcf, #80e0ff); /* Gradient similar to home page */
  color: #333;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  min-height: 100vh;
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


/* Header Styles */
.header {
  text-align: center;
  padding: 50px 20px;
  background: linear-gradient(135deg, #ffcc00, #ff6f61);
  color: white;
  border-bottom-left-radius: 50% 20%;
  border-bottom-right-radius: 50% 20%;
  box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
  width: 100%;
}

.header h1 {
  font-size: 3rem;
  margin-bottom: 15px;
  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
}

.header p {
  font-size: 1.2rem;
  color: #ffe082;
}

/* Game Container */
#game-container {
    display: flex;
    justify-content: space-around;
    align-items: center;
    margin: 20px 0;
    gap: 0;  /* Set the gap to 0 to remove the space between habitats */
    flex-wrap: wrap;
}


.card {
  border-radius: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  margin: 20px;
  text-align: center;
  transition: transform 0.3s, box-shadow 0.3s;
  width: 220px;
  position: relative;
  overflow: hidden;
  background-color: white;
}

.card h3 {
  margin: 10px 0;
  font-size: 1.3rem;
  font-weight: bold;
  color: #333;
}

.card-content {
  position: relative;
  border-radius: 20px;
  overflow: hidden;
}

.card img {
  width: 100%;
  height: 150px;
  object-fit: cover;
  border-radius: 20px 20px 0 0;
}

.card:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
}

.card p {
  font-size: 0.9rem;
  padding: 10px;
}

/* Animal Container */
.animal-container {
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  margin: 30px 0;
  max-width: 1000px;
}

.animal-item {
  width: 180px;
  height: 180px;
  margin: 15px;
  border-radius: 50%;
  background-color: #ffcc00;
  display: flex;
  justify-content: center;
  align-items: center;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.animal-item:hover {
  transform: scale(1.1);
  box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
}

.animal-item img {
  width: 120px;
  height: 120px;
  object-fit: cover;
  border-radius: 50%;
}

.animal-item p {
  margin-top: 10px;
  font-size: 1rem;
  color: #333;
}

/* Sound Button */
.sound-button {
  position: fixed;
  bottom: 20px;
  left: 20px;
  background-color: #ff6f61;
  color: white;
  border: none;
  padding: 15px 20px;
  font-size: 18px;
  font-weight: bold;
  border-radius: 30px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
  cursor: pointer;
  transition: background-color 0.3s, transform 0.3s;
}

.sound-button:hover {
  background-color: #e04e47;
  transform: scale(1.1);
}

.sound-button:active {
  transform: scale(1.05);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

/* Game Buttons */
.game-button {
  background-color: #8e44ad;
  color: white;
  border: none;
  padding: 12px 20px;
  font-size: 1.2rem;
  border-radius: 50px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
  cursor: pointer;
  transition: transform 0.3s, background-color 0.3s, box-shadow 0.3s;
}

.game-button:hover {
  background-color: #9b59b6;
  transform: scale(1.1);
}

.game-button:active {
  transform: scale(1.05);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}
.habitat-card {
  width: 200px;
  height: 200px;
  border: 2px solid #000;
  background-size: cover;
  background-position: center;
  margin: 10px;
}

.habitat:hover {
    background-color: #f0e68c;
    border-color: #ff6f61;
}

/* Animal Movement Animation */
@keyframes animalMove {
  0% { transform: translateX(0); }
  50% { transform: translateX(20px); }
  100% { transform: translateX(0); }
}

.animal-moving {
  animation: animalMove 2s infinite ease-in-out;
}

/* Game Intro Fade-in */
@keyframes fadeIn {
  0% { opacity: 0; }
  100% { opacity: 1; }
}

.fade-in {
  animation: fadeIn 1s ease-out;
}

/* Media Queries for Mobile Responsiveness */
@media (max-width: 768px) {
  .header h1 {
    font-size: 2rem;
  }

  .header p {
    font-size: 1rem;
  }

  .card {
    width: 90%;
  }

  .help-button {
    bottom: 15px;
    right: 15px;
    font-size: 16px;
  }

  .navbar h2 {
    font-size: 1rem;
  }

  .navbar ul li a {
    font-size: 0.9rem;
  }

  .animal-item {
    width: 150px;
    height: 150px;
  }

  .sound-button {
    bottom: 15px;
    left: 15px;
    font-size: 16px;
  }
  .habitat {
        width: 150px;
        height: 150px;
    }

    .animal {
        width: 100px;
        height: 100px;
    }

   

}
 /* Habitats Section */
        #game-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin: 10px 0;
            gap: 20px;
            flex-wrap: wrap;
        }

        .habitat {
            width: 250px;
            height: 300px;
            border: 2px dashed #333;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #f9f9f9;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 10px;
            overflow: hidden;
            margin: 10px;
            position: relative;
        }

        .habitat img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .habitat h3 {
            margin: 10px 0 0;
            font-size: 1.1rem;
            color: #555;
        }

        .habitat:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        /* Animals Section */
        #animals-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .animal {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            cursor: grab;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .animal:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        /* Score and Status */
        #status, #score {
            font-size: 1.2rem;
            margin: 10px;
            font-weight: bold;
        }

        #status {
            color: #333;
        }

        #score {
            color: #006400;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .habitat {
                width: 120px;
                height: 150px;
            }

            .animal {
                width: 100px;
                height: 100px;
            }
        }
.restartButton {
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    margin-top: 20px;
    position: relative;  /* Ensures button is positioned normally */
    z-index: 9999;       /* High z-index to ensure it's on top */
}

.restartButton:hover {
    background-color: #45a049;
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


    <h1>Animal Habitat Explorer</h1>
    <p>Drag and drop the animals into their correct habitats to earn points!</p>

    <!-- Habitats -->
    <div id="game-container">
        <div class="habitat" id="jungle" ondrop="drop(event)" ondragover="allowDrop(event)">
            <img src="https://tse4.mm.bing.net/th?id=OIP.ak3R-6-z26f3ueX34f-lqwHaFh&pid=Api&P=0&h=180"
                 alt="Jungle" style="width: 100%; height: auto;">
            <h3>Jungle</h3>
        </div>
        <div class="habitat" id="ocean" ondrop="drop(event)" ondragover="allowDrop(event)">
            <img src="https://tse4.mm.bing.net/th?id=OIP.0Xbl2ysgFljhkYJA6xdCFgHaEK&pid=Api&P=0&h=180"
                 alt="Ocean" style="width: 100%; height: auto;">
            <h3>Ocean</h3>
        </div>
        <div class="habitat" id="forest" ondrop="drop(event)" ondragover="allowDrop(event)">
            <img src="https://tse1.mm.bing.net/th?id=OIP.Yw0_ck8aMcECVk_mOdkaEQHaHk&pid=Api&P=0&h=180"
                 alt="Nest" style="width: 100%; height: auto;">
            <h3>next</h3>
        </div>
        <div class="habitat" id="ice" ondrop="drop(event)" ondragover="allowDrop(event)">
            <img src="https://tse2.mm.bing.net/th?id=OIP.jT6WKw5PqPu9zk-bJJV4kgHaEd&pid=Api&P=0&h=180"
                 alt="Ice" style="width: 100%; height: auto;">
            <h3>Ice</h3>
        </div>
        <div class="habitat" id="desert" ondrop="drop(event)" ondragover="allowDrop(event)">
            <img src="https://tse1.mm.bing.net/th?id=OIP.GYSmljQPb-2b3vk7BlrQ4QHaDV&pid=Api&P=0&h=180"
            alt="Desert" style="width: 100%; height: auto;">
            <h3>Desert</h3>
        </div>
    </div>

    <!-- Animals -->
    <div id="animals-container">
        <img src="https://tse2.mm.bing.net/th?id=OIP.Pfzte9nVgNgXPmtylp640QHaG4&pid=Api&P=0&h=180"
             id="lion" class="animal" draggable="true" ondragstart="drag(event)" alt="Lion">
       
        <img src="https://tse1.mm.bing.net/th?id=OIP.HAh5w0FwT8affDvNdhSuBwHaF5&pid=Api&P=0&h=180"
             id="fish" class="animal" draggable="true" ondragstart="drag(event)" alt="Fish">
        
        <img src="https://tse4.mm.bing.net/th?id=OIP.lqMbk4jlq0VN14ZNLTjdFwHaFx&pid=Api&P=0&h=180"
             id="sparrow" class="animal" draggable="true" ondragstart="drag(event)" alt="Elephant">
        
        <img src="https://tse4.mm.bing.net/th?id=OIP.Rd0KVCn1R6oPvhvRswV4JgHaHa&pid=Api&P=0&h=180"
             id="penguin" class="animal" draggable="true" ondragstart="drag(event)" alt="Penguin">
        
        <img src="https://tse3.mm.bing.net/th?id=OIP.QZbxIzkNvGuS3sXzv4TpDQHaFB&pid=Api&P=0&h=180"
             id="camel" class="animal" draggable="true" ondragstart="drag(event)" alt="Camel">
    </div>

    <!-- Status and Score -->
    <div id="status">Status will appear here.</div>
 <form action="Animal_habitat_score.jsp">
        <input type="hidden" name="score_new" id="score_new">
        <input class="restartButton" type="submit" name="submit" value="sumbit game" onclick="updateScore()">
    </form>
    
<button class="restartButton" type="button" onclick="window.location.href='Animal_habitat.jsp';">Restart Quiz</button>

    <script >
        let score = 0;

// Allow items to be dropped
function allowDrop(event) {
    event.preventDefault();
}

// Triggered when dragging starts
function drag(event) {
    event.dataTransfer.setData("text", event.target.id);
}

// Handle the drop action
function drop(event) {
    event.preventDefault();

    // Get the ID of the dragged element
    const animalId = event.dataTransfer.getData("text");
    const animal = document.getElementById(animalId);

    // Ensure the drop target is a habitat
    const habitat = event.target.closest('.habitat');
    if (habitat) {
        console.log("Dropped:", animalId, "into habitat:", habitat.id);

        // Append the animal to the habitat (or set its background)
        habitat.appendChild(animal);
        checkAnswer(animalId, habitat.id); // Check if the placement is correct
    }
}

// Check if the animal is in the correct habitat
function checkAnswer(animalId, habitatId) {
    const correctMapping = {
        lion: "jungle",
        fish: "ocean",
        sparrow: "forest",
        penguin: "ice",
        camel: "desert"
    };

    const statusElement = document.getElementById("status");

    // If the placement is correct, update the score and show feedback
    if (correctMapping[animalId] === habitatId) {
        score++;
        statusElement.textContent = `Great job! The ${animalId} is correctly placed in the ${habitatId}.`;
        updateScore();
    } else {
        statusElement.textContent = `Oops! The ${animalId} does not belong in the ${habitatId}. Try again!`;
        // Optionally, you can remove the animal from the habitat if placed incorrectly
        setTimeout(() => {
            const animal = document.getElementById(animalId);
            const originalPlace = document.getElementById(animalId).parentNode;
            originalPlace.appendChild(animal); // Reset animal to its original position
        }, 1000);
    }
}

// Update the score on the screen
function updateScore() {
    
                document.getElementById("score_new").value=score;

}


        
        
    </script>
</body>
</html>