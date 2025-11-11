<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Virtual Classroom Scheduler</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .login-container {
            width: 100%;
            max-width: 450px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 40px 30px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }
        
        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
        }
        
        .logo-icon {
            font-size: 2.5rem;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .logo-text {
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e1e1;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #2575fc;
            outline: none;
            box-shadow: 0 0 0 3px rgba(37, 117, 252, 0.2);
        }
        
        .login-btn {
            width: 100%;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }
        
        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        
        .login-btn:active {
            transform: translateY(-1px);
        }
        
        .error-message {
            background: #ffebee;
            color: #c62828;
            padding: 12px 15px;
            border-radius: 10px;
            margin: 20px 0;
            text-align: center;
            border-left: 4px solid #c62828;
        }
        
        .links {
            text-align: center;
            margin-top: 25px;
        }
        
        .links a {
            color: #2575fc;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .links a:hover {
            text-decoration: underline;
        }
        
        .demo-accounts {
            margin-top: 30px;
            padding: 20px;
            background: #f5f7ff;
            border-radius: 10px;
            border-left: 4px solid #2575fc;
        }
        
        .demo-accounts h3 {
            margin-bottom: 15px;
            color: #333;
            font-size: 1.1rem;
        }
        
        .demo-account {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            padding-bottom: 8px;
            border-bottom: 1px solid #e1e1e1;
        }
        
        .demo-account:last-child {
            margin-bottom: 0;
            border-bottom: none;
        }
        
        .role {
            font-weight: 600;
            color: #6a11cb;
        }
        
        .credentials {
            color: #555;
        }
        
        .back-home {
            text-align: center;
            margin-top: 20px;
        }
        
        .back-home a {
            color: #2575fc;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s ease;
        }
        
        .back-home a:hover {
            gap: 8px;
        }
        
        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }
            
            .logo {
                flex-direction: column;
                gap: 10px;
            }
        }
        
        .footer {
            margin-top: 30px;
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.9rem;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <div class="logo-icon">
                <i class="fas fa-chalkboard-teacher"></i>
            </div>
            <div class="logo-text">Virtual Classroom</div>
        </div>
        
        <h2>Login to Your Account</h2>
        
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="error-message">
                <i class="fas fa-exclamation-circle"></i> <%= error %>
            </div>
        <%
            }
        %>
        
        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required placeholder="Enter your username">
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
            
            <button type="submit" class="login-btn">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
        </form>
        
        <div class="links">
            <a href="#">Forgot your password?</a>
        </div>
        

        
        <div class="back-home">
            <a href="${pageContext.request.contextPath}/">
                <i class="fas fa-arrow-left"></i> Back to Home
            </a>
        </div>
    </div>
    
    <div class="footer">
        &copy; 2025 Virtual Classroom Scheduler. All rights reserved.
    </div>

    <script>
        // Simple animation for input fields
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input[type="text"], input[type="password"]');
            
            inputs.forEach(input => {
                // Add focus effect
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-2px)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'translateY(0)';
                });
            });
            
            // Add demo account filling functionality
            const demoAccounts = document.querySelectorAll('.demo-account');
            
            demoAccounts.forEach(account => {
                account.addEventListener('click', function() {
                    const credentials = this.querySelector('.credentials').textContent.split(' / ');
                    document.getElementById('username').value = credentials[0];
                    document.getElementById('password').value = credentials[1];
                    
                    // Add visual feedback
                    this.style.backgroundColor = '#e8f4ff';
                    setTimeout(() => {
                        this.style.backgroundColor = '';
                    }, 1000);
                });
            });
        });
    </script>
</body>
</html>