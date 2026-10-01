<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.sql.*, java.security.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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

        /* Forgot Password & Signup Links */
        .links {
            margin-top: 15px;
        }

        .links a {
            color: #FF6F61;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .links a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .login-container {
                width: 90%;
                padding: 20px;
            }

            .form-group input {
                font-size: 0.9rem;
            }

            .form-group button {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form action="" method="POST">
            <!-- Email -->
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" name="email" id="email" required placeholder="Enter your email">
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" required placeholder="Enter your password">
            </div>

            <!-- Login Button -->
            <div class="form-group">
                <button type="submit">Log In</button>
            </div>
        </form>

        <!-- Links -->
        <div class="links">
            <a href="forgot_password.jsp">Forgot Password?</a><br>
            <a href="registration_page.html">Don't have an account? Register here</a>
        </div>
    </div>
</body>
</html>
<%
    // Define variables to capture form input values
    String email2 = request.getParameter("email");
    String enteredPassword2 = request.getParameter("password");

    String adminEmail = "sayali02kadam@gmail.com";
String adminPassword = System.getenv("ADMIN_PASSWORD");
    boolean loginSuccess = false;

    // Check if form is submitted
    if (email2 != null && enteredPassword2 != null) {
        // Hibernate session
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Transaction t = s.beginTransaction();

        try {
            HttpSession hs = request.getSession();  // Use HttpSession correctly

            if (email2.equals(adminEmail) && enteredPassword2.equals(adminPassword)) {
                // Admin login
                hs.setAttribute("name", "Admin");
                response.sendRedirect("Admin/admin.jsp");
            } else {
                // Hibernate query to fetch user by email and password
                Query query = s.createQuery("from User1 where email = :email and password = :password");
                query.setParameter("email", email2);
                query.setParameter("password", enteredPassword2);

                if (query!=null) {
                    loginSuccess = true;

                    // Fetch the username
                    Query q1 = s.createQuery("select name from User1 where email = :email");
                    q1.setParameter("email", email2);
                    
                    String username = (String) q1.uniqueResult();  // Get a single result

                    if (username != null) {
                        hs.setAttribute("username", username);  // Correct session usage
                        response.sendRedirect("home.jsp");  // Redirect to home page
                    } else {
                        out.println("<p style='color: red; text-align: center;'>Invalid email or password!</p>");
                    }
                } else {
                    out.println("<p style='color: red; text-align: center;'>Invalid email or password!</p>");
                }
            }
            t.commit();  // Commit transaction
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            s.close();  // Ensure session is closed properly
        }
    }
%>
