<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - Virtual Classroom Scheduler</title>
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
            background: #f5f7ff;
            color: #333;
            min-height: 100vh;
        }
        
        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }
        
        .sidebar {
            width: 250px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 20px 0;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            margin-bottom: 20px;
        }
        
        .logo-icon {
            font-size: 2rem;
            background: rgba(255, 255, 255, 0.2);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .logo-text {
            font-size: 1.5rem;
            font-weight: 700;
        }
        
        .nav-links {
            list-style: none;
            padding: 0 15px;
        }
        
        .nav-links li {
            margin-bottom: 10px;
        }
        
        .nav-links a {
            display: flex;
            align-items: center;
            gap: 15px;
            color: white;
            text-decoration: none;
            padding: 12px 15px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        
        .nav-links a:hover, .nav-links a.active {
            background: rgba(255, 255, 255, 0.2);
        }
        
        .nav-links i {
            width: 20px;
            text-align: center;
        }
        
        .main-content {
            flex: 1;
            padding: 30px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .header h1 {
            color: var(--dark);
            font-weight: 600;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .user-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: var(--primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }
        
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
            gap: 20px;
            transition: all 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
        }
        
        .stat-icon.attendance {
            background: rgba(37, 117, 252, 0.2);
            color: var(--secondary);
        }
        
        .stat-icon.classes {
            background: rgba(106, 17, 203, 0.2);
            color: var(--primary);
        }
        
        .stat-icon.grades {
            background: rgba(40, 167, 69, 0.2);
            color: var(--success);
        }
        
        .stat-icon.assignments {
            background: rgba(255, 193, 7, 0.2);
            color: var(--warning);
        }
        
        .stat-info h3 {
            font-size: 1.8rem;
            margin-bottom: 5px;
        }
        
        .stat-info p {
            color: var(--gray);
            font-weight: 500;
        }
        
        .quick-actions {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }
        
        .section-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }
        
        .action-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 10px;
            background: var(--light);
            border: none;
            border-radius: 10px;
            padding: 20px 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            color: var(--dark);
        }
        
        .action-btn:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-3px);
        }
        
        .action-btn i {
            font-size: 1.8rem;
        }
        
        .todays-classes {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }
        
        .class-list {
            list-style: none;
        }
        
        .class-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .class-item:last-child {
            border-bottom: none;
        }
        
        .class-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
        }
        
        .class-content {
            flex: 1;
        }
        
        .class-content h4 {
            margin-bottom: 5px;
            color: var(--dark);
        }
        
        .class-details {
            display: flex;
            gap: 15px;
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .class-time {
            font-weight: 600;
            color: var(--primary);
        }
        
        .upcoming-assignments {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .assignment-list {
            list-style: none;
        }
        
        .assignment-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .assignment-item:last-child {
            border-bottom: none;
        }
        
        .assignment-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--warning);
        }
        
        .assignment-content {
            flex: 1;
        }
        
        .assignment-content h4 {
            margin-bottom: 5px;
            color: var(--dark);
        }
        
        .assignment-details {
            display: flex;
            gap: 15px;
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .due-date {
            font-weight: 600;
            color: var(--danger);
        }
        
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .btn-primary {
            background: var(--primary);
            color: white;
        }
        
        .btn-primary:hover {
            background: #5a0db5;
        }
        
        .btn-success {
            background: var(--success);
            color: white;
        }
        
        .btn-success:hover {
            background: #218838;
        }
        
        @media (max-width: 992px) {
            .dashboard-container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                padding: 15px 0;
            }
            
            .nav-links {
                display: flex;
                overflow-x: auto;
                padding: 0 10px;
            }
            
            .nav-links li {
                margin-bottom: 0;
                flex-shrink: 0;
            }
        }
        
        @media (max-width: 768px) {
            .main-content {
                padding: 20px 15px;
            }
            
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .stats-container {
                grid-template-columns: 1fr 1fr;
            }
            
            .class-details, .assignment-details {
                flex-direction: column;
                gap: 5px;
            }
        }
        
        @media (max-width: 576px) {
            .stats-container {
                grid-template-columns: 1fr;
            }
            
            .actions-grid {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar">
            <div class="logo">
                <div class="logo-icon">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <div class="logo-text">Virtual Classroom</div>
            </div>
            
            <ul class="nav-links">
                <li><a href="studentDashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                <li><a href="my-classes.jsp"><i class="fas fa-chalkboard-teacher"></i><span>My Classes</span></a></li>
                <li><a href="attendance.jsp"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="assignments.jsp"><i class="fas fa-tasks"></i><span>Assignments</span></a></li>
                <li><a href="grades.jsp"><i class="fas fa-chart-line"></i><span>Grades</span></a></li>
                <li><a href="schedule.jsp"><i class="fas fa-calendar-alt"></i><span>Schedule</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>Student Dashboard</h1>
                <div class="user-info">
                    <div class="user-avatar">S</div>
                    <div>
                        <div style="font-weight: 600;">Student User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Computer Science</div>
                    </div>
                </div>
            </div>
            
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon attendance"><i class="fas fa-clipboard-check"></i></div>
                    <div class="stat-info"><h3>92%</h3><p>Attendance Rate</p></div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon classes"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="stat-info"><h3>6</h3><p>Active Classes</p></div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon grades"><i class="fas fa-chart-line"></i></div>
                    <div class="stat-info"><h3>3.8</h3><p>Current GPA</p></div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon assignments"><i class="fas fa-tasks"></i></div>
                    <div class="stat-info"><h3>3</h3><p>Pending Assignments</p></div>
                </div>
            </div>
            
            <div class="quick-actions">
                <h2 class="section-title"><i class="fas fa-bolt"></i>Quick Actions</h2>
                <div class="actions-grid">
                    <a href="my-classes.jsp" class="action-btn"><i class="fas fa-chalkboard-teacher"></i><span>View Classes</span></a>
                    <a href="${pageContext.request.contextPath}/attendance/view" class="action-btn"><i class="fas fa-clipboard-check"></i><span>Check Attendance</span></a>
                    <a href="assignments.jsp" class="action-btn"><i class="fas fa-tasks"></i><span>Assignments</span></a>
                    <a href="schedule.jsp" class="action-btn"><i class="fas fa-calendar-alt"></i><span>Weekly Schedule</span></a>
                </div>
            </div>
            
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px;">
                <div class="todays-classes">
                    <h2 class="section-title"><i class="fas fa-calendar-day"></i>Today's Classes</h2>
                    <ul class="class-list">
                        <li class="class-item">
                            <div class="class-icon"><i class="fas fa-calculator"></i></div>
                            <div class="class-content">
                                <h4>Mathematics 101</h4>
                                <div class="class-details">
                                    <span class="class-time">09:00 - 10:30</span>
                                    <span>Dr. Smith</span>
                                    <span>Room 101</span>
                                </div>
                            </div>
                        </li>
                        <li class="class-item">
                            <div class="class-icon"><i class="fas fa-flask"></i></div>
                            <div class="class-content">
                                <h4>Physics 201</h4>
                                <div class="class-details">
                                    <span class="class-time">11:00 - 12:30</span>
                                    <span>Dr. Johnson</span>
                                    <span>Lab 205</span>
                                </div>
                            </div>
                        </li>
                        <li class="class-item">
                            <div class="class-icon"><i class="fas fa-code"></i></div>
                            <div class="class-content">
                                <h4>Computer Science</h4>
                                <div class="class-details">
                                    <span class="class-time">14:00 - 15:30</span>
                                    <span>Prof. Wilson</span>
                                    <span>Lab 301</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                
                <div class="upcoming-assignments">
                    <h2 class="section-title"><i class="fas fa-clock"></i>Upcoming Assignments</h2>
                    <ul class="assignment-list">
                        <li class="assignment-item">
                            <div class="assignment-icon"><i class="fas fa-file-alt"></i></div>
                            <div class="assignment-content">
                                <h4>Math Problem Set</h4>
                                <div class="assignment-details">
                                    <span>Mathematics 101</span>
                                    <span class="due-date">Due: Tomorrow</span>
                                </div>
                            </div>
                        </li>
                        <li class="assignment-item">
                            <div class="assignment-icon"><i class="fas fa-laptop-code"></i></div>
                            <div class="assignment-content">
                                <h4>Programming Project</h4>
                                <div class="assignment-details">
                                    <span>Computer Science</span>
                                    <span class="due-date">Due: Dec 15</span>
                                </div>
                            </div>
                        </li>
                        <li class="assignment-item">
                            <div class="assignment-icon"><i class="fas fa-book"></i></div>
                            <div class="assignment-content">
                                <h4>Research Paper</h4>
                                <div class="assignment-details">
                                    <span>Physics 201</span>
                                    <span class="due-date">Due: Dec 20</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const statCards = document.querySelectorAll('.stat-card');
            statCards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });
            
            const navLinks = document.querySelectorAll('.nav-links a');
            navLinks.forEach(link => {
                link.addEventListener('click', function() {
                    navLinks.forEach(l => l.classList.remove('active'));
                    this.classList.add('active');
                });
            });
        });
    </script>
</body>
</html>