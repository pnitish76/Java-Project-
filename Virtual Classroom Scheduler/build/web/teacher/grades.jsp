<%@page import="java.util.*" %>
<%
    // Sample grade data
    List<Map<String, String>> gradeRecords = new ArrayList<>();
    Map<String, String> record1 = new HashMap<>();
    record1.put("id", "1"); record1.put("className", "Mathematics 101"); record1.put("assignment", "Midterm Exam"); 
    record1.put("date", "2023-11-15"); record1.put("average", "82%"); record1.put("submitted", "25/25");
    gradeRecords.add(record1);
    
    Map<String, String> record2 = new HashMap<>();
    record2.put("id", "2"); record2.put("className", "Advanced Calculus"); record2.put("assignment", "Problem Set 3"); 
    record2.put("date", "2023-11-20"); record2.put("average", "78%"); record2.put("submitted", "18/18");
    gradeRecords.add(record2);
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
        
        .stat-icon.average {
            background: rgba(37, 117, 252, 0.2);
            color: var(--secondary);
        }
        
        .stat-icon.assignments {
            background: rgba(106, 17, 203, 0.2);
            color: var(--primary);
        }
        
        .stat-icon.graded {
            background: rgba(40, 167, 69, 0.2);
            color: var(--success);
        }
        
        .stat-icon.pending {
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
        
        .search-filter {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .search-box {
            flex: 1;
            min-width: 250px;
        }
        
        .filter-select {
            min-width: 150px;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e1e1e1;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
        }
        
        .table-container {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            overflow-x: auto;
        }
        
        .data-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .data-table th,
        .data-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        .data-table th {
            background: var(--light);
            font-weight: 600;
            color: var(--dark);
        }
        
        .data-table tr:hover {
            background: #f8f9fa;
        }
        
        .average-grade {
            font-weight: 600;
        }
        
        .grade-high { color: var(--success); }
        .grade-medium { color: var(--warning); }
        .grade-low { color: var(--danger); }
        
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
        
        .btn-sm {
            padding: 6px 12px;
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
            
            .search-filter {
                flex-direction: column;
            }
        }
        
        @media (max-width: 576px) {
            .stats-container {
                grid-template-columns: 1fr;
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
                <li><a href="my-classes.jsp"><i class="fas fa-chalkboard"></i><span>My Classes</span></a></li>
                <li><a href="attendance.jsp"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="students.jsp"><i class="fas fa-users"></i><span>Students</span></a></li>
                <li><a href="grades.jsp" class="active"><i class="fas fa-chart-line"></i><span>Grades</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>Grade Management</h1>
                <div class="user-info">
                    <div class="user-avatar">T</div>
                    <div>
                        <div style="font-weight: 600;">Teacher User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Mathematics Department</div>
                    </div>
                </div>
            </div>
            
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon average"><i class="fas fa-chart-line"></i></div>
                    <div class="stat-info"><h3>82%</h3><p>Average Grade</p></div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon assignments"><i class="fas fa-tasks"></i></div>
                    <div class="stat-info"><h3>15</h3><p>Total Assignments</p></div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon graded"><i class="fas fa-check-circle"></i></div>
                    <div class="stat-info"><h3>12</h3><p>Graded</p></div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon pending"><i class="fas fa-clock"></i></div>
                    <div class="stat-info"><h3>3</h3><p>Pending</p></div>
                </div>
            </div>
            
            <div class="search-filter">
                <div class="search-box">
                    <input type="text" class="form-control" placeholder="Search assignments...">
                </div>
                <select class="form-control filter-select">
                    <option value="">All Classes</option>
                    <option value="math101">Mathematics 101</option>
                    <option value="math201">Advanced Calculus</option>
                </select>
                <select class="form-control filter-select">
                    <option value="">All Status</option>
                    <option value="graded">Graded</option>
                    <option value="pending">Pending</option>
                </select>
            </div>
            
            <div class="table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Class</th>
                            <th>Assignment</th>
                            <th>Due Date</th>
                            <th>Average Grade</th>
                            <th>Submitted</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, String> record : gradeRecords) { %>
                        <tr>
                            <td><%= record.get("className") %></td>
                            <td><%= record.get("assignment") %></td>
                            <td><%= record.get("date") %></td>
                            <td>
                                <%
                                    String average = record.get("average");
                                    String gradeClass = "grade-high";
                                    if (Integer.parseInt(average.replace("%", "")) < 70) {
                                        gradeClass = "grade-low";
                                    } else if (Integer.parseInt(average.replace("%", "")) < 80) {
                                        gradeClass = "grade-medium";
                                    }
                                %>
                                <span class="average-grade <%= gradeClass %>">
                                    <%= average %>
                                </span>
                            </td>
                            <td><%= record.get("submitted") %></td>
                            <td>
                                <a href="enter-grades.jsp?id=<%= record.get("id") %>" class="btn btn-success btn-sm">
                                    <i class="fas fa-edit"></i> Enter Grades
                                </a>
                                <a href="view-grades.jsp?id=<%= record.get("id") %>" class="btn btn-info btn-sm">
                                    <i class="fas fa-eye"></i> View
                                </a>
                                <a href="export-grades.jsp?id=<%= record.get("id") %>" class="btn btn-primary btn-sm">
                                    <i class="fas fa-download"></i> Export
                                </a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <div style="background: white; border-radius: 15px; padding: 25px; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);">
                <h2 style="font-size: 1.5rem; margin-bottom: 20px; color: var(--dark); display: flex; align-items: center; gap: 10px;">
                    <i class="fas fa-bolt"></i>Quick Actions
                </h2>
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px;">
                    <a href="create-assignment.jsp" class="btn btn-primary" style="padding: 15px; text-align: center; display: flex; flex-direction: column; align-items: center; gap: 10px;">
                        <i class="fas fa-plus-circle" style="font-size: 1.5rem;"></i>
                        <span>Create Assignment</span>
                    </a>
                    <a href="gradebook.jsp" class="btn btn-success" style="padding: 15px; text-align: center; display: flex; flex-direction: column; align-items: center; gap: 10px;">
                        <i class="fas fa-book" style="font-size: 1.5rem;"></i>
                        <span>View Gradebook</span>
                    </a>
                    <a href="grading-rubrics.jsp" class="btn btn-info" style="padding: 15px; text-align: center; display: flex; flex-direction: column; align-items: center; gap: 10px;">
                        <i class="fas fa-clipboard-list" style="font-size: 1.5rem;"></i>
                        <span>Grading Rubrics</span>
                    </a>
                    <a href="grade-reports.jsp" class="btn btn-warning" style="padding: 15px; text-align: center; display: flex; flex-direction: column; align-items: center; gap: 10px;">
                        <i class="fas fa-chart-bar" style="font-size: 1.5rem;"></i>
                        <span>Grade Reports</span>
                    </a>
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
        });
    </script>
</body>
</html>