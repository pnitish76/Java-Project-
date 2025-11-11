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
        
        :root {
            --primary: #6a11cb;
            --secondary: #2575fc;
            --success: #28a745;
            --warning: #ffc107;
            --danger: #dc3545;
            --light: #f8f9fa;
            --dark: #343a40;
            --gray: #6c757d;
        }
        
        body {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
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
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
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
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--dark);
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
        }
        
        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e1e1;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        input[type="text"]:focus,
        input[type="password"]:focus,
        select:focus {
            border-color: var(--secondary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(37, 117, 252, 0.2);
        }
        
        .login-btn {
            width: 100%;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
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
        
        .user-type-selector {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .user-type-btn {
            flex: 1;
            padding: 12px;
            border: 2px solid #e1e1e1;
            background: white;
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        
        .user-type-btn.active {
            border-color: var(--secondary);
            background: #f0f8ff;
            color: var(--secondary);
        }
        
        .demo-accounts {
            margin-top: 30px;
            padding: 20px;
            background: #f5f7ff;
            border-radius: 10px;
            border-left: 4px solid var(--secondary);
        }
        
        .demo-accounts h3 {
            margin-bottom: 15px;
            color: var(--dark);
            font-size: 1.1rem;
        }
        
        .demo-account {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .demo-account:hover {
            background: #e8f4ff;
        }
        
        .demo-account:last-child {
            margin-bottom: 0;
        }
        
        .role {
            font-weight: 600;
            color: var(--primary);
        }
        
        .credentials {
            color: var(--gray);
        }
        
        .back-home {
            text-align: center;
            margin-top: 20px;
        }
        
        .back-home a {
            color: var(--secondary);
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
            
            .user-type-selector {
                flex-direction: column;
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
        
        <div class="user-type-selector">
            <div class="user-type-btn active" data-role="student">Student</div>
            <div class="user-type-btn" data-role="teacher">Teacher</div>
            <div class="user-type-btn" data-role="admin">Admin</div>
        </div>
        
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
            
            <input type="hidden" id="userRole" name="role" value="student">
            
            <button type="submit" class="login-btn">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
        </form>
        

        
        <div class="back-home">
            <a href="index.jsp">
                <i class="fas fa-arrow-left"></i> Back to Home
            </a>
        </div>
    </div>
    
    <div class="footer">
        &copy; 2025 Virtual Classroom Scheduler. All rights reserved.
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const userTypeBtns = document.querySelectorAll('.user-type-btn');
            const userRoleInput = document.getElementById('userRole');
            const demoAccounts = document.querySelectorAll('.demo-account');
            
            userTypeBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    userTypeBtns.forEach(b => b.classList.remove('active'));
                    this.classList.add('active');
                    userRoleInput.value = this.dataset.role;
                });
            });
            
            demoAccounts.forEach(account => {
                account.addEventListener('click', function() {
                    const username = this.dataset.username;
                    const password = this.dataset.password;
                    const role = this.dataset.role;
                    
                    document.getElementById('username').value = username;
                    document.getElementById('password').value = password;
                    userRoleInput.value = role;
                    
                    userTypeBtns.forEach(btn => {
                        btn.classList.remove('active');
                        if (btn.dataset.role === role) {
                            btn.classList.add('active');
                        }
                    });
                    
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