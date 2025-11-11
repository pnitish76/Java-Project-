<%@page import="java.util.*" %>
<%
    // Sample grades data
    List<Map<String, String>> grades = new ArrayList<>();
    
    Map<String, String> grade1 = new HashMap<>();
    grade1.put("course", "Mathematics 101");
    grade1.put("code", "MATH101");
    grade1.put("instructor", "Dr. Sarah Smith");
    grade1.put("credits", "3");
    grade1.put("currentGrade", "A-");
    grade1.put("numericGrade", "92");
    grade1.put("lastUpdated", "2023-11-15");
    grade1.put("status", "Excellent");
    grades.add(grade1);
    
    Map<String, String> grade2 = new HashMap<>();
    grade2.put("course", "Physics 201");
    grade2.put("code", "PHYS201");
    grade2.put("instructor", "Dr. Michael Brown");
    grade2.put("credits", "4");
    grade2.put("currentGrade", "B+");
    grade2.put("numericGrade", "88");
    grade2.put("lastUpdated", "2023-11-10");
    grade2.put("status", "Good");
    grades.add(grade2);
    
    Map<String, String> grade3 = new HashMap<>();
    grade3.put("course", "Computer Science");
    grade3.put("code", "CS101");
    grade3.put("instructor", "Prof. Jennifer Wilson");
    grade3.put("credits", "3");
    grade3.put("currentGrade", "A");
    grade3.put("numericGrade", "95");
    grade3.put("lastUpdated", "2023-11-18");
    grade3.put("status", "Excellent");
    grades.add(grade3);
    
    Map<String, String> grade4 = new HashMap<>();
    grade4.put("course", "English Literature");
    grade4.put("code", "ENG202");
    grade4.put("instructor", "Dr. Robert Johnson");
    grade4.put("credits", "3");
    grade4.put("currentGrade", "B");
    grade4.put("numericGrade", "85");
    grade4.put("lastUpdated", "2023-11-12");
    grade4.put("status", "Good");
    grades.add(grade4);
    
    // Calculate overall GPA
    double totalPoints = 0;
    int totalCredits = 0;
    
    for (Map<String, String> grade : grades) {
        String letterGrade = grade.get("currentGrade");
        int credits = Integer.parseInt(grade.get("credits"));
        
        double gradePoints = 0;
        switch(letterGrade) {
            case "A": gradePoints = 4.0; break;
            case "A-": gradePoints = 3.7; break;
            case "B+": gradePoints = 3.3; break;
            case "B": gradePoints = 3.0; break;
            case "B-": gradePoints = 2.7; break;
            case "C+": gradePoints = 2.3; break;
            case "C": gradePoints = 2.0; break;
            case "C-": gradePoints = 1.7; break;
            case "D+": gradePoints = 1.3; break;
            case "D": gradePoints = 1.0; break;
            case "F": gradePoints = 0.0; break;
        }
        
        totalPoints += gradePoints * credits;
        totalCredits += credits;
    }
    
    double overallGPA = totalCredits > 0 ? totalPoints / totalCredits : 0.0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grades - Virtual Classroom Scheduler</title>
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
            overflow-y: auto;
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
        
        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
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
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .stat-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
        }
        
        .stat-icon.primary {
            background: rgba(106, 17, 203, 0.1);
            color: var(--primary);
        }
        
        .stat-icon.success {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .stat-icon.warning {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }
        
        .stat-icon.info {
            background: rgba(23, 162, 184, 0.1);
            color: #17a2b8;
        }
        
        .stat-content h3 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-content p {
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .grades-table-container {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }
        
        .table-header {
            padding: 20px 25px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .table-header h3 {
            color: var(--dark);
            font-weight: 600;
        }
        
        .grades-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .grades-table th {
            text-align: left;
            padding: 15px 25px;
            background: #f8f9fa;
            color: var(--gray);
            font-weight: 600;
            border-bottom: 1px solid #eee;
        }
        
        .grades-table td {
            padding: 15px 25px;
            border-bottom: 1px solid #eee;
        }
        
        .grades-table tr:last-child td {
            border-bottom: none;
        }
        
        .grades-table tr:hover {
            background: #f8f9fa;
        }
        
        .grade-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
            display: inline-block;
        }
        
        .grade-A {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .grade-B {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }
        
        .grade-C {
            background: rgba(253, 126, 20, 0.1);
            color: #fd7e14;
        }
        
        .grade-D {
            background: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }
        
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
            display: inline-block;
        }
        
        .status-excellent {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .status-good {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }
        
        .status-average {
            background: rgba(253, 126, 20, 0.1);
            color: #fd7e14;
        }
        
        .status-poor {
            background: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }
        
        .progress-container {
            width: 100%;
            background: #e9ecef;
            border-radius: 10px;
            height: 8px;
            overflow: hidden;
        }
        
        .progress-bar {
            height: 100%;
            border-radius: 10px;
        }
        
        .progress-A {
            background: var(--success);
            width: 92%;
        }
        
        .progress-B {
            background: var(--warning);
            width: 88%;
        }
        
        .progress-C {
            background: #fd7e14;
            width: 78%;
        }
        
        .progress-D {
            background: var(--danger);
            width: 65%;
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
        
        .btn-outline {
            background: transparent;
            border: 1px solid var(--primary);
            color: var(--primary);
        }
        
        .btn-outline:hover {
            background: var(--primary);
            color: white;
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
            
            .stats-cards {
                grid-template-columns: 1fr 1fr;
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
            
            .stats-cards {
                grid-template-columns: 1fr;
            }
            
            .grades-table {
                display: block;
                overflow-x: auto;
            }
        }
        
        @media (max-width: 576px) {
            .table-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
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
                <li><a href="my-classes.jsp"><i class="fas fa-chalkboard-teacher"></i><span>My Classes</span></a></li>
                <li><a href="attendance.jsp"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="assignments.jsp"><i class="fas fa-tasks"></i><span>Assignments</span></a></li>
                <li><a href="grades.jsp" class="active"><i class="fas fa-chart-line"></i><span>Grades</span></a></li>
                <li><a href="schedule.jsp"><i class="fas fa-calendar-alt"></i><span>Schedule</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>Grades & Performance</h1>
                <div class="user-info">
                    <div class="user-avatar">S</div>
                    <div>
                        <div style="font-weight: 600;">Student User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Computer Science</div>
                    </div>
                </div>
            </div>
            
            <div class="page-header">
                <h2>Current Semester Grades</h2>
                <div style="display: flex; gap: 10px;">
                    <button class="btn btn-outline">
                        <i class="fas fa-download"></i> Export Grades
                    </button>
                    <button class="btn btn-primary">
                        <i class="fas fa-print"></i> Print Report
                    </button>
                </div>
            </div>
            
            <div class="stats-cards">
                <div class="stat-card">
                    <div class="stat-icon primary">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= String.format("%.2f", overallGPA) %></h3>
                        <p>Overall GPA</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon success">
                        <i class="fas fa-trophy"></i>
                    </div>
                    <div class="stat-content">
                        <h3>2</h3>
                        <p>Courses with A Grades</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon warning">
                        <i class="fas fa-book"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= totalCredits %></h3>
                        <p>Total Credits</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon info">
                        <i class="fas fa-percentage"></i>
                    </div>
                    <div class="stat-content">
                        <h3>90%</h3>
                        <p>Average Performance</p>
                    </div>
                </div>
            </div>
            
            <% if (grades != null && !grades.isEmpty()) { %>
                <div class="grades-table-container">
                    <div class="table-header">
                        <h3>Course Grades</h3>
                        <div style="display: flex; gap: 10px;">
                            <select style="padding: 8px 12px; border-radius: 5px; border: 1px solid #ddd;">
                                <option>All Courses</option>
                                <option>Current Semester</option>
                                <option>Previous Semesters</option>
                            </select>
                            <input type="text" placeholder="Search courses..." style="padding: 8px 12px; border-radius: 5px; border: 1px solid #ddd;">
                        </div>
                    </div>
                    
                    <table class="grades-table">
                        <thead>
                            <tr>
                                <th>Course</th>
                                <th>Instructor</th>
                                <th>Credits</th>
                                <th>Letter Grade</th>
                                <th>Numeric Grade</th>
                                <th>Progress</th>
                                <th>Status</th>
                                <th>Last Updated</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Map<String, String> grade : grades) { 
                                String letterGrade = grade.get("currentGrade");
                                String numericGrade = grade.get("numericGrade");
                                String status = grade.get("status");
                            %>
                            <tr>
                                <td>
                                    <div style="font-weight: 600;"><%= grade.get("course") %></div>
                                    <div style="font-size: 0.85rem; color: var(--gray);"><%= grade.get("code") %></div>
                                </td>
                                <td><%= grade.get("instructor") %></td>
                                <td><%= grade.get("credits") %></td>
                                <td>
                                    <span class="grade-badge grade-<%= letterGrade.charAt(0) %>">
                                        <%= letterGrade %>
                                    </span>
                                </td>
                                <td><%= numericGrade %>%</td>
                                <td style="width: 120px;">
                                    <div class="progress-container">
                                        <div class="progress-bar progress-<%= letterGrade.charAt(0) %>"></div>
                                    </div>
                                </td>
                                <td>
                                    <span class="status-badge status-<%= status.toLowerCase() %>">
                                        <%= status %>
                                    </span>
                                </td>
                                <td><%= grade.get("lastUpdated") %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } else { %>
                <div class="empty-state">
                    <i class="fas fa-chart-line"></i>
                    <h3>No Grades Available</h3>
                    <p>Your grades will appear here once they are published by your instructors.</p>
                </div>
            <% } %>
            
            <div class="grades-table-container">
                <div class="table-header">
                    <h3>Grade Distribution</h3>
                </div>
                <div style="padding: 25px;">
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px;">
                        <div style="text-align: center;">
                            <div style="font-size: 2rem; font-weight: 700; color: var(--success);">2</div>
                            <div style="color: var(--gray);">A Grades</div>
                        </div>
                        <div style="text-align: center;">
                            <div style="font-size: 2rem; font-weight: 700; color: var(--warning);">1</div>
                            <div style="color: var(--gray);">B Grades</div>
                        </div>
                        <div style="text-align: center;">
                            <div style="font-size: 2rem; font-weight: 700; color: #fd7e14;">1</div>
                            <div style="color: var(--gray);">C Grades</div>
                        </div>
                        <div style="text-align: center;">
                            <div style="font-size: 2rem; font-weight: 700; color: var(--danger);">0</div>
                            <div style="color: var(--gray);">D/F Grades</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add animation to stat cards
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
            
            // Add animation to table rows
            const tableRows = document.querySelectorAll('.grades-table tbody tr');
            tableRows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateX(-20px)';
                setTimeout(() => {
                    row.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    row.style.opacity = '1';
                    row.style.transform = 'translateX(0)';
                }, index * 100 + 300);
            });
        });
    </script>
</body>
</html>