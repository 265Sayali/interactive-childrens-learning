<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback | Interactive Children's Learning</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }
    body {
      background: linear-gradient(to right, #ff758c, #ff7eb3);
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }
    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.6);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .feedback-modal {
      background: white;
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 15px 25px rgba(0, 0, 0, 0.3);
      animation: fadeIn 0.5s ease-in-out;
      width: 90%;
      max-width: 450px;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .feedback-modal h3 {
      margin-bottom: 20px;
      color: #333;
      font-size: 1.8rem;
    }
    .feedback-modal form {
      display: flex;
      flex-direction: column;
    }
    .feedback-modal input, .feedback-modal textarea {
      margin-bottom: 15px;
      padding: 12px;
      font-size: 1rem;
      border: 2px solid #ff758c;
      border-radius: 10px;
      outline: none;
      transition: border-color 0.3s, box-shadow 0.3s;
    }
    .feedback-modal input:focus, .feedback-modal textarea:focus {
      border-color: #ffcc00;
      box-shadow: 0 0 10px rgba(255, 204, 0, 0.5);
    }
    .feedback-modal button {
      padding: 12px;
      background: linear-gradient(to right, #ff758c, #ff7eb3);
      color: white;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      font-size: 1rem;
      transition: transform 0.2s, background 0.3s;
    }
    .feedback-modal button:hover {
      background: linear-gradient(to right, #ffcc00, #ff9a9e);
      transform: scale(1.05);
    }
  </style>
</head>
<body>
  <div class="overlay">
    <div class="feedback-modal" id="feedbackModal">
      <h3>We Value Your Feedback!</h3>
      <form action="submit_feedback.jsp" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        
        <label for="email">Email</label>
        <input type="text" id="email" name="email" required>

        
        <label for="comment">Your Comment:</label>
        <textarea id="comment" name="comment" rows="4" required></textarea>
        
        <label for="ranking">Ranking (1-5):</label>
        <input type="number" id="ranking" name="ranking" min="1" max="5" required>
        
        <button type="submit">Submit Feedback</button>
      </form>
    </div>
  </div>
</body>
</html>