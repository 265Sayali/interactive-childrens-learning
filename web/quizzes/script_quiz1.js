let currentQuestionIndex = 0;
let score = 0;

const questions = [
    {
        question: "🍎🍎, 🍎🍎🍎, ?",
        correctAnswer: "🍎🍎🍎🍎",
        options: ["🍎🍎", "🍎🍎🍎🍎"]
    },
    {
        question: "🍎🍏🍎, 🍎🍏🍏🍎, ?",
        correctAnswer: "🍏🍎🍏",
        options: ["🍏🍎🍏", "🍎🍏🍏🍎🍏"]
    },
    {
        question: "🍎🍎🍏, 🍏🍎🍏, ?",
        correctAnswer: "🍏🍏🍎",
        options: ["🍏🍏🍎", "🍎🍎🍏🍏"]
    },
    // Add more questions as needed
];

function checkAnswer(questionIndex, selectedAnswer) {
    const question = questions[questionIndex - 1];
    const isCorrect = selectedAnswer === question.correctAnswer;

    // Update score
    if (isCorrect) {
        score++;
    }

    // Disable the buttons for the current question
    const buttons = document.querySelectorAll(`#options${questionIndex} .option`);
    buttons.forEach(btn => btn.disabled = true);

    // Show feedback for the current question
    const feedback = document.getElementById('feedback');
    feedback.textContent = isCorrect ? "Correct!" : "Incorrect!";

    // Update score display
    const scoreDisplay = document.getElementById('score');
    scoreDisplay.textContent = `Score: ${score}`;

    // Move to the next question after a short delay
    currentQuestionIndex++;
    if (currentQuestionIndex < questions.length) {
        setTimeout(() => showNextQuestion(), 1000);
    } else {
        // Show restart button after all questions are answered
        setTimeout(() => document.getElementById('restart-btn').style.display = 'block', 1000);
    }
}

function showNextQuestion() {
    // Hide the current question
    const currentQuestion = document.getElementById(`question${currentQuestionIndex}`);
    currentQuestion.style.display = 'none';

    // Display the next question and enable its options
    const nextQuestion = document.getElementById(`question${currentQuestionIndex + 1}`);
    nextQuestion.style.display = 'block';

    // Enable buttons for the next question
    const buttons = document.querySelectorAll(`#options${currentQuestionIndex + 1} .option`);
    buttons.forEach(btn => btn.disabled = false);

    // Clear feedback text
    const feedback = document.getElementById('feedback');
    feedback.textContent = '';
}


function restartQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    document.getElementById('feedback').textContent = '';
    document.getElementById('score').textContent = 'Score: 0';
    document.getElementById('restart-btn').style.display = 'none';

    // Reset all options (enable all buttons)
    const allButtons = document.querySelectorAll('.option');
    allButtons.forEach(btn => btn.disabled = false);

    showNextQuestion();
}

// Initialize the quiz
showNextQuestion();
