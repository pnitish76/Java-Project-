<%@page import="java.util.*" %>
<%
    // Sample class data
    List<Map<String, String>> classes = new ArrayList<>();
    Map<String, String> class1 = new HashMap<>();
    class1.put("id", "1"); class1.put("name", "Mathematics 101"); class1.put("code", "MATH101"); 
    class1.put("teacher", "Dr. Sarah Smith"); class1.put("schedule", "Mon, Wed, Fri 9:00-10:30"); 
    class1.put("room", "Room 101"); class1.put("credits", "3");
    classes.add(class1);
    
    Map<String, String> class2 = new HashMap<>();
    class2.put("id", "2"); class2.put("name", "Physics 201"); class2.put("code", "PHYS201"); 
    class2.put("teacher", "Dr. Michael Brown"); class2.put("schedule", "Tue, Thu 11:00-12:30"); 
    class2.put("room", "Lab 205"); class2.put("credits", "4");
    classes.add(class2);
    
    Map<String, String> class3 = new HashMap<>();
    class3.put("id", "3"); class3.put("name", "Computer Science"); class3.put("code", "CS101"); 
    class3.put("teacher", "Prof. Jennifer Wilson"); class3.put("schedule", "Mon, Wed 14:00-15:30"); 
    class3.put("room", "Lab 301"); class3.put("credits", "3");
    classes.add(class3);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Classes - Virtual Classroom Scheduler</title>
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
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .classes-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }
        
        .class-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary);
        }
        
        .class-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .class-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 15px;
        }
        
        .class-info h3 {
            color: var(--dark);
            margin-bottom: 5px;
            font-size: 1.3rem;
        }
        
        .class-code {
            color: var(--gray);
            font-weight: 500;
        }
        
        .class-credits {
            background: var(--light);
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--primary);
        }
        
        .class-details {
            margin-bottom: 20px;
        }
        
        .detail-item {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 8px;
            color: var(--gray);
        }
        
        .detail-item i {
            width: 16px;
            color: var(--primary);
        }
        
        .class-stats {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 20px;
            padding: 15px;
            background: var(--light);
            border-radius: 10px;
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 5px;
        }
        
        .stat-label {
            font-size: 0.8rem;
            color: var(--gray);
        }
        
        .class-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
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
            font-size: 0.9rem;
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
        
        .btn-info {
            background: #17a2b8;
            color: white;
        }
        
        .btn-info:hover {
            background: #138496;
        }
        
        .btn-warning {
            background: var(--warning);
            color: var(--dark);
        }
        
        .btn-warning:hover {
            background: #e0a800;
        }
        
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: var(--gray);
        }
        
        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #dee2e6;
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
            
            .classes-grid {
                grid-template-columns: 1fr;
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
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .class-header {
                flex-direction: column;
                gap: 10px;
            }
            
            .class-stats {
                grid-template-columns: 1fr;
            }
            
            .class-actions {
                justify-content: center;
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
                <li><a href="studentDashboard.jsp"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                <li><a href="my-classes.jsp" class="active"><i class="fas fa-chalkboard-teacher"></i><span>My Classes</span></a></li>
                <li><a href="attendance.jsp"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="assignments.jsp"><i class="fas fa-tasks"></i><span>Assignments</span></a></li>
                <li><a href="grades.jsp"><i class="fas fa-chart-line"></i><span>Grades</span></a></li>
                <li><a href="schedule.jsp"><i class="fas fa-calendar-alt"></i><span>Schedule</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>My Classes</h1>
                <div class="user-info">
                    <div class="user-avatar">S</div>
                    <div>
                        <div style="font-weight: 600;">Student User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Computer Science</div>
                    </div>
                </div>
            </div>
            
            <div class="page-header">
                <h2>Current Semester Classes</h2>
                <div style="display: flex; gap: 10px;">
                    <a href="class-registration.jsp" class="btn btn-primary">
                        <i class="fas fa-plus-circle"></i> Register for Classes
                    </a>
                </div>
            </div>
            
            <% if (classes != null && !classes.isEmpty()) { %>
                <div class="classes-grid">
                    <% for (Map<String, String> cls : classes) { %>
                    <div class="class-card">
                        <div class="class-header">
                            <div class="class-info">
                                <h3><%= cls.get("name") %></h3>
                                <div class="class-code"><%= cls.get("code") %></div>
                            </div>
                            <div class="class-credits">
                                <%= cls.get("credits") %> Credits
                            </div>
                        </div>
                        
                        <div class="class-details">
                            <div class="detail-item">
                                <i class="fas fa-user-tie"></i>
                                <span><%= cls.get("teacher") %></span>
                            </div>
                            <div class="detail-item">
                                <i class="far fa-calendar-alt"></i>
                                <span><%= cls.get("schedule") %></span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-door-open"></i>
                                <span><%= cls.get("room") %></span>
                            </div>
                        </div>
                        
                        <div class="class-stats">
                            <div class="stat-item">
                                <div class="stat-value">92%</div>
                                <div class="stat-label">Attendance</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-value">A-</div>
                                <div class="stat-label">Current Grade</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-value">3</div>
                                <div class="stat-label">Assignments</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-value">85%</div>
                                <div class="stat-label">Average</div>
                            </div>
                        </div>
                        
                        <div class="class-actions">
                            <a href="class-details.jsp?id=<%= cls.get("id") %>" class="btn btn-info">
                                <i class="fas fa-eye"></i> View Details
                            </a>
                            <a href="class-materials.jsp?id=<%= cls.get("id") %>" class="btn btn-primary">
                                <i class="fas fa-book"></i> Materials
                            </a>
                            <a href="class-assignments.jsp?id=<%= cls.get("id") %>" class="btn btn-warning">
                                <i class="fas fa-tasks"></i> Assignments
                            </a>
                            <a href="class-grades.jsp?id=<%= cls.get("id") %>" class="btn btn-success">
                                <i class="fas fa-chart-line"></i> Grades
                            </a>
                        </div>
                    </div>
                    <% } %>
                </div>
            <% } else { %>
                <div class="empty-state">
                    <i class="fas fa-book-open"></i>
                    <h3>No Classes Registered</h3>
                    <p>You haven't registered for any classes this semester.</p>
                    <a href="class-registration.jsp" class="btn btn-primary" style="margin-top: 20px;">
                        <i class="fas fa-plus-circle"></i> Register for Classes
                    </a>
                </div>
            <% } %>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const classCards = document.querySelectorAll('.class-card');
            classCards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                },
                         }, index * 100);
            });
        });
    </script>
</body>
</html>