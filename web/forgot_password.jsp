<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <style>
        /* General Body Styling */
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(to bottom, #80e0ff, #c9ffcf);
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container Styling */
        .login-container {
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            width: 400px;
            text-align: center;
        }

        /* Heading */
        .login-container h1 {
            color: #FF6F61;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        /* Form Group Styling */
        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-size: 1rem;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Buttons Styling */
        .form-group button {
            background-color: #FF6F61;
            color: white;
            padding: 12px;
            font-size: 1.1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s, transform 0.3s;
        }

        .form-group button:hover {
            background-color: #FF8A80;
            transform: scale(1.05);
        }
        </style>
    </head>
   <body>
    <div class="login-container">
        <h1>Forgot Password</h1>
        <form action="Send_Password.jsp" method="POST">
            <!-- Email -->
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" name="email" id="email" required placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" required placeholder="Enter password">
            </div>
            <div class="form-group">
                <label for="password">confirm Password</label>
                <input type="password" name="password" id="password" required placeholder="Enter confirm password">
            </div>
                        
            <div class="form-group">
                <button type="submit">Reset password </button>
            </div>
           
        </form>
    </body>
</html>
