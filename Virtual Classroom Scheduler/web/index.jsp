<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Classroom Scheduler | Smart Education Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        header {
            padding: 30px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .logo-icon {
            font-size: 2.5rem;
            background: rgba(255, 255, 255, 0.2);
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            backdrop-filter: blur(10px);
        }
        
        .logo-text {
            font-size: 1.8rem;
            font-weight: 700;
        }
        
        nav ul {
            display: flex;
            list-style: none;
            gap: 30px;
            align-items: center;
        }
        
        nav a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            padding: 8px 15px;
            border-radius: 20px;
        }
        
        nav a:hover {
            background: rgba(255, 255, 255, 0.1);
        }
        
        .login-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            padding: 10px 25px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }
        
        .login-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .hero {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 60px 0;
            min-height: 70vh;
        }
        
        .hero-content {
            flex: 1;
            max-width: 600px;
        }
        
        .hero h1 {
            font-size: 3.5rem;
            line-height: 1.2;
            margin-bottom: 20px;
        }
        
        .hero p {
            font-size: 1.2rem;
            line-height: 1.6;
            margin-bottom: 30px;
            opacity: 0.9;
        }
        
        .cta-button {
            display: inline-block;
            background: #fff;
            color: #2575fc;
            padding: 15px 35px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        
        .cta-button:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.3);
        }
        
        .hero-image {
            flex: 1;
            display: flex;
            justify-content: flex-end;
        }
        
        .dashboard-preview {
            width: 500px;
            height: 350px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
        }
        
        .dashboard-header {
            height: 40px;
            background: rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            padding: 0 20px;
        }
        
        .dashboard-content {
            padding: 20px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        
        .dashboard-item {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 10px;
            height: 60px;
            display: flex;
            align-items: center;
            padding: 0 15px;
            gap: 10px;
        }
        
        .dashboard-item i {
            font-size: 1.5rem;
        }
        
        .features {
            padding: 80px 0;
            background: rgba(255, 255, 255, 0.05);
        }
        
        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 50px;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .feature-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.15);
        }
        
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #ffcc00;
        }
        
        .feature-card h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }
        
        .feature-card p {
            opacity: 0.8;
            line-height: 1.6;
        }
        
        .stats {
            padding: 80px 0;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
        }
        
        .stat-card {
            text-align: center;
            padding: 30px 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            backdrop-filter: blur(10px);
        }
        
        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .stat-label {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        
        footer {
            padding: 30px 0;
            text-align: center;
            background: rgba(0, 0, 0, 0.1);
            margin-top: auto;
        }
        
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .copyright {
            opacity: 0.7;
        }
        
        .social-links {
            display: flex;
            gap: 15px;
        }
        
        .social-links a {
            color: #fff;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }
        
        .social-links a:hover {
            transform: translateY(-3px);
        }
        
        @media (max-width: 992px) {
            .hero {
                flex-direction: column;
                text-align: center;
            }
            
            .hero-content {
                margin-bottom: 50px;
            }
            
            .dashboard-preview {
                width: 100%;
                max-width: 500px;
            }
            
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 768px) {
            nav ul {
                gap: 15px;
            }
            
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .footer-content {
                flex-direction: column;
                gap: 20px;
            }
            
            .stats-grid {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 576px) {
            header {
                flex-direction: column;
                gap: 20px;
            }
            
            nav ul {
                flex-wrap: wrap;
                justify-content: center;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">
                <div class="logo-icon">
                    <i class="fas fa-chalkboard-teacher"></i>
                </div>
                <div class="logo-text">Virtual Classroom</div>
            </div>
            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Features</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="login.jsp" class="login-btn">Login</a></li>
                </ul>
            </nav>
        </header>
        
        <section class="hero">
            <div class="hero-content">
                <h1>Virtual Classroom Scheduler with Attendance Tracking</h1>
                <p>Streamline your educational institution's scheduling and attendance management with our powerful, intuitive platform designed for modern educators and students.</p>
                <a href="/login.jsp" class="cta-button">Get Started <i class="fas fa-arrow-right"></i></a>
            </div>
            <div class="hero-image">
                <div class="dashboard-preview">
                    <div class="dashboard-header">
                        <div style="width: 12px; height: 12px; border-radius: 50%; background: #ff5f57; margin-right: 8px;"></div>
                        <div style="width: 12px; height: 12px; border-radius: 50%; background: #ffbd2e; margin-right: 8px;"></div>
                        <div style="width: 12px; height: 12px; border-radius: 50%; background: #28ca42;"></div>
                    </div>
                    <div class="dashboard-content">
                        <div class="dashboard-item">
                            <i class="far fa-calendar-alt"></i>
                            <span>Schedule Classes</span>
                        </div>
                        <div class="dashboard-item">
                            <i class="fas fa-user-check"></i>
                            <span>Track Attendance</span>
                        </div>
                        <div class="dashboard-item">
                            <i class="fas fa-chart-bar"></i>
                            <span>View Reports</span>
                        </div>
                        <div class="dashboard-item">
                            <i class="fas fa-bell"></i>
                            <span>Get Notifications</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <section class="features">
        <div class="container">
            <h2 class="section-title">Key Features</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-calendar-plus"></i>
                    </div>
                    <h3>Smart Scheduling</h3>
                    <p>Easily create, manage, and organize class schedules with our intuitive drag-and-drop interface.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-clipboard-check"></i>
                    </div>
                    <h3>Attendance Tracking</h3>
                    <p>Automatically track and record student attendance with real-time monitoring and reporting.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-chart-pie"></i>
                    </div>
                    <h3>Analytics Dashboard</h3>
                    <p>Gain insights with comprehensive analytics on attendance patterns and class performance.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>Student Management</h3>
                    <p>Manage student profiles, enrollments, and academic records in one centralized platform.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-file-export"></i>
                    </div>
                    <h3>Report Generation</h3>
                    <p>Generate detailed reports on attendance, schedules, and academic performance with one click.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-mobile-alt"></i>
                    </div>
                    <h3>Mobile Friendly</h3>
                    <p>Access your classroom scheduler on any device with our fully responsive design.</p>
                </div>
            </div>
        </div>
    </section>
    
    <section class="stats">
        <div class="container">
            <h2 class="section-title">Why Educators Love ClassSync</h2>
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-number">95%</div>
                    <div class="stat-label">Time Saved</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">10K+</div>
                    <div class="stat-label">Active Users</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">98%</div>
                    <div class="stat-label">Satisfaction Rate</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">50+</div>
                    <div class="stat-label">Institutions</div>
                </div>
            </div>
        </div>
    </section>
    
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="copyright">
                    &copy; 2025 Virtual Classroom Scheduler. All rights reserved.
                </div>
                <div class="social-links">
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </footer>
    
    <script>
        // Add some animation to feature cards on scroll
        document.addEventListener('DOMContentLoaded', function() {
            const featureCards = document.querySelectorAll('.feature-card');
            const statCards = document.querySelectorAll('.stat-card');
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = 1;
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, { threshold: 0.1 });
            
            featureCards.forEach(card => {
                card.style.opacity = 0;
                card.style.transform = 'translateY(20px)';
                card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                observer.observe(card);
            });
            
            statCards.forEach(card => {
                card.style.opacity = 0;
                card.style.transform = 'translateY(20px)';
                card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                observer.observe(card);
            });
            
            // Animate stat numbers
            const statNumbers = document.querySelectorAll('.stat-number');
            statNumbers.forEach(stat => {
                const target = parseInt(stat.textContent);
                let current = 0;
                const increment = target / 50;
                const timer = setInterval(() => {
                    current += increment;
                    if (current >= target) {
                        current = target;
                        clearInterval(timer);
                    }
                    stat.textContent = Math.round(current) + (stat.textContent.includes('%') ? '%' : '+');
                }, 50);
            });
        });
    </script>
</body>
</html>