<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matching Letter and Picture Quiz</title>
    <style>
        body {
            margin: 0;
            font-family: 'Comic Sans MS', cursive, sans-serif;
            text-align: center;
            background: linear-gradient(to bottom right, #fef9c7, #aee5ff);
        }
        h1 {
            font-size: 2.5rem;
            margin-top: 30px;
            color: #333;
        }
        .quiz-container {
            margin-top: 50px;
        }
        .quiz-item {
            margin-bottom: 30px;
        }
        .quiz-item p {
            font-size: 1.5rem;
        }
        .quiz-item img {
            max-width: 200px;
            margin-bottom: 20px;
        }
        .quiz-item .options {
            margin-top: 10px;
        }
        .quiz-item input {
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .submit-btn {
            padding: 10px 20px;
            background-color: #ff6f61;
            color: white;
            font-size: 1.2rem;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .submit-btn:hover {
            background-color: #ff8f70;
        }
        .score {
            font-size: 1.5rem;
            margin-top: 30px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Matching Letter and Picture Quiz</h1>

    <div class="quiz-container">
        <form method="post">
            <% 
                // Correct answers
                Map<String, String> correctAnswers = new LinkedHashMap<String ,String>();
                correctAnswers.put("A", "A");
                correctAnswers.put("B", "B");
                correctAnswers.put("C", "C");
                correctAnswers.put("D", "D");
                correctAnswers.put("E", "E");
                // Add more if needed

                // Initialize score
                int score = 0;

                // Check if form is submitted
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    for (String letter : correctAnswers.keySet()) {
                        String userAnswer = request.getParameter(letter);
                        if (userAnswer != null && userAnswer.equals(correctAnswers.get(letter))) {
                            score++;
                        }
                    }
                }
            %>
            
            <!-- Display quiz items -->
            <div class="quiz-item">
                <p>What letter matches this picture?</p>
                <img src="https://tse2.mm.bing.net/th?id=OIP.6g3_fGcHVufs7610EFlNOAHaLb&pid=Api&P=0&h=180" alt="Image A">
                <div class="options">
                    <input type="radio" name="A" value="A"> A
                    <input type="radio" name="A" value="B"> B
                    <input type="radio" name="A" value="C"> C
                    <input type="radio" name="A" value="D"> D
                </div>
            </div>

            <div class="quiz-item">
                <p>What letter matches this picture?</p>
                <img src="https://tse4.mm.bing.net/th?id=OIP.sUWiaJ6F1AM9fbAp7-4ptgHaIF&pid=Api&P=0&h=180" alt="Image B">
                <div class="options">
                    <input type="radio" name="B" value="A"> A
                    <input type="radio" name="B" value="B"> B
                    <input type="radio" name="B" value="C"> C
                    <input type="radio" name="B" value="D"> D
                </div>
            </div>

            <!-- Add more quiz items as needed -->

            <button class="submit-btn" type="submit">Submit</button>
        </form>

        <div class="score">
            <% if (request.getMethod().equalsIgnoreCase("POST")) { %>
                <p>Your score: <%= score %> / <%= correctAnswers.size() %></p>
            <% } %>
        </div>
    </div>
</body>
</html>
