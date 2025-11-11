<%@page import="java.util.*" %>
<%
    // Sample class data
    List<Map<String, String>> classes = new ArrayList<>();
    Map<String, String> class1 = new HashMap<>();
    class1.put("id", "1"); class1.put("name", "Mathematics 101"); class1.put("code", "MATH101"); 
    class1.put("students", "25"); class1.put("schedule", "Mon, Wed, Fri 9:00-10:30"); class1.put("room", "Room 101");
    classes.add(class1);
    
    Map<String, String> class2 = new HashMap<>();
    class2.put("id", "2"); class2.put("name", "Advanced Calculus"); class2.put("code", "MATH201"); 
    class2.put("students", "18"); class2.put("schedule", "Tue, Thu 11:00-12:30"); class2.put("room", "Room 205");
    classes.add(class2);
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
        
        .class-stats {
            display: flex;
            align-items: center;
            gap: 8px;
            background: var(--light);
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.9rem;
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
                    <i class="fas fa-chalkboard-teacher"></i>
                </div>
                <div class="logo-text">ClassSync</div>
            </div>
            
            <ul class="nav-links">
                <li><a href="teacher-dashboard.jsp"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                <li><a href="${pageContext.request.contextPath}/schedules"><i class="fas fa-calendar-alt"></i><span>All Schedules</span></a></li>
                <li><a href="my-classes.jsp" class="active"><i class="fas fa-chalkboard"></i><span>My Classes</span></a></li>
                <li><a href="attendance.jsp"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="students.jsp"><i class="fas fa-users"></i><span>Students</span></a></li>
                <li><a href="grades.jsp"><i class="fas fa-chart-line"></i><span>Grades</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>My Classes</h1>
                <div class="user-info">
                    <div class="user-avatar">T</div>
                    <div>
                        <div style="font-weight: 600;">Teacher User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Mathematics Department</div>
                    </div>
                </div>
            </div>
            
            <div class="page-header">
                <h2>Teaching Assignments</h2>
                <a href="${pageContext.request.contextPath}/schedules/create" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Create New Class
                </a>
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
                            <div class="class-stats">
                                <i class="fas fa-users"></i>
                                <span><%= cls.get("students") %> students</span>
                            </div>
                        </div>
                        
                        <div class="class-details">
                            <div class="detail-item">
                                <i class="far fa-calendar-alt"></i>
                                <span><%= cls.get("schedule") %></span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-door-open"></i>
                                <span><%= cls.get("room") %></span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-chart-line"></i>
                                <span>Average Attendance: 92%</span>
                            </div>
                        </div>
                        
                        <div class="class-actions">
                            <a href="class-details.jsp?id=<%= cls.get("id") %>" class="btn btn-info">
                                <i class="fas fa-eye"></i> View Details
                            </a>
                            <a href="attendance.jsp?class=<%= cls.get("id") %>" class="btn btn-success">
                                <i class="fas fa-clipboard-check"></i> Attendance
                            </a>
                            <a href="grades.jsp?class=<%= cls.get("id") %>" class="btn btn-warning">
                                <i class="fas fa-edit"></i> Grades
                            </a>
                            <a href="students.jsp?class=<%= cls.get("id") %>" class="btn btn-primary">
                                <i class="fas fa-users"></i> Students
                            </a>
                        </div>
                    </div>
                    <% } %>
                </div>
            <% } else { %>
                <div class="empty-state">
                    <i class="fas fa-chalkboard-teacher"></i>
                    <h3>No Classes Assigned</h3>
                    <p>You don't have any teaching assignments yet.</p>
                    <a href="${pageContext.request.contextPath}/schedules/create" class="btn btn-primary" style="margin-top: 20px;">
                        <i class="fas fa-plus-circle"></i> Create Your First Class
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
                }, index * 100);
            });
        });
    </script>
</body>
</html>