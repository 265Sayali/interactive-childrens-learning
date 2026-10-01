<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>
<%
 String username = (String) session.getAttribute("username");      
%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home | Interactive Children's Learning</title>
  <style>
   body {
    margin: 0;
    font-family: 'Comic Sans MS', cursive, sans-serif;
    background: linear-gradient(to bottom, #c9ffcf, #80e0ff); /* Same gradient as home page */
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

    /* Header styles */
    .header {
      text-align: center;
      padding: 50px 20px;
      background: linear-gradient(135deg, #ffcc00, #ff6f61);
      color: white;
      border-bottom-left-radius: 50% 20%;
      border-bottom-right-radius: 50% 20%;
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
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

    .container {
  display: flex;
  flex-wrap: nowrap; /* Prevent wrapping */
  justify-content: space-between; /* Evenly distribute */
  max-width: 1200px; /* Ensure enough width */
  margin: auto; /* Centering */
  padding: 20px;
  overflow-x: auto; /* Allow scrolling if needed */
}

   .card {
  flex: 1; /* Equal width for each card */
  max-width: 220px; /* Adjust as needed */
  min-width: 200px;
  border-radius: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  text-align: center;
  transition: transform 0.3s, box-shadow 0.3s;
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

    .help-button {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #8e44ad;
      color: white;
      border: none;
      padding: 15px 25px;
      font-size: 18px;
      font-weight: bold;
      border-radius: 30px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
      cursor: pointer;
      transition: background-color 0.3s, transform 0.3s;
    }

    .help-button:hover {
      background-color: #9b59b6;
      transform: scale(1.1);
    }

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
    }
  </style>
</head>
<body>
     
  <!-- Navbar -->
 <div class="navbar">
  <h2>Interactive Learning</h2>
  <ul>
    <li><a href="home.jsp">Home</a></li>
    <li>
      <a href="javascript:void(0);">Quizzes</a>
      <div class="dropdown">
        <a href="quizzes/Counting-object-quiz.jsp">Counting object Quiz</a>
        <a href="quizzes/math_operation_quiz.jsp">Math Quiz</a>
        <a href="quizzes/number_word_quiz.jsp">Number to Word</a>
        <a href="quizzes/rhyming_word_quiz.jsp">Rhyming Words</a>

      </div>
    </li>

  
    <li>
  <a href="javascript:void(0);">Games</a>
  <div class="dropdown">
    <a href="games/Animal_habitat.jsp">Animal habitat Games</a>
    <a href="games/animal_sound.jsp">Animal sound  Games</a>
    <a href="games/color_game.jsp">color_hint_game Games</a>
  </div>
</li>

  
   <li>
  <a href="javascript:void(0);">Learning</a>
  <div class="dropdown">
    <a href="learning/learn_letter.jsp">letters</a>
    <a href="learning/learn_number.jsp">Number</a>
    <a href="learning/learn_color.jsp">Color</a>
     <a href="learning/learn_rhyming_word.jsp">Rhyming</a>
    <a href="learning/learn_animal_place.jsp">Animal Habitat</a>
  </div>
</li>

     <li><a href="progress_tracking.jsp">Progress Report</a></li>
          <li><a href="login.jsp">Login</a></li>

  </ul>
</div>


  <!-- Header -->
  <div class="header">
    <h1>Welcome Back <%=username%> !</h1>
    <p>Explore new ways to learn and have fun!</p>
  </div>
    
  <!-- Main Content -->
  <div class="container">
    <div class="card">
      <h3>Quizzes</h3>
      <div class="card-content">
        <img src="IMAGES/quizzes1.avif" alt="Quizzes">
        <p>Test your knowledge with fun and engaging quizzes.</p>
      </div>
    </div>

    <div class="card">
      <h3>Languages</h3>
      <div class="card-content">
        <img src="IMAGES/languages.avif" alt="Languages">
        <p>Learn new languages and improve vocabulary skills.</p>
      </div>
    </div>

    <div class="card">
      <h3>Games</h3>
      <div class="card-content">
        <img src="IMAGES/games.jpg" alt="Games">
        <p>Play educational games to make learning enjoyable.</p>
      </div>
    </div>

    <div class="card">
      <h3>Assignments</h3>
      <div class="card-content">
        <img src="IMAGES/assignments.avif" alt="Assignments">
        <p>Complete and submit your daily tasks easily.</p>
      </div>
    </div>

    <div class="card">
      <h3>Progress Report</h3>
      <div class="card-content">
          <img src="https://img.freepik.com/premium-vector/lesson-planning-flat-illustration-vector-download_203633-4377.jpg?ga=GA1.1.808765458.1725949216&semt=ais_hybrid">
        <p>Track your learning journey and achievements.</p>
      </div>
    </div>
  </div>
<%
     SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction t = s.beginTransaction();
        if(username!=null)
        {
               Query q2=s.createQuery("select email from User1 where name=:username ");
               q2.setParameter("username", username);
               List l = q2.list();
               if (l.size() > 0) {
                String newemail = (String) l.get(0);   
             
               
               
               
%>
 
  <script>
  // Open feedback page after 10 minutes
  setTimeout(function() {
    window.location.href = "feedback.jsp";
  }, 15000); // Redirect after 10 minutes
  out.println("saved")
</script>
<%         }
           }


%>
</body>
</html>
