<%@page import="java.util.*" %>
<%
    // Sample assignments data
    List<Map<String, String>> assignments = new ArrayList<>();
    
    Map<String, String> assignment1 = new HashMap<>();
    assignment1.put("id", "1");
    assignment1.put("title", "Linear Algebra Problem Set");
    assignment1.put("course", "Mathematics 101");
    assignment1.put("courseCode", "MATH101");
    assignment1.put("dueDate", "2023-12-05");
    assignment1.put("dueTime", "23:59");
    assignment1.put("status", "submitted");
    assignment1.put("submittedDate", "2023-12-03");
    assignment1.put("grade", "A-");
    assignment1.put("points", "95/100");
    assignment1.put("type", "Problem Set");
    assignment1.put("description", "Complete problems 1-10 from chapter 5. Show all work for full credit.");
    assignment1.put("priority", "high");
    assignments.add(assignment1);
    
    Map<String, String> assignment2 = new HashMap<>();
    assignment2.put("id", "2");
    assignment2.put("title", "Physics Lab Report");
    assignment2.put("course", "Physics 201");
    assignment2.put("courseCode", "PHYS201");
    assignment2.put("dueDate", "2023-12-10");
    assignment2.put("dueTime", "17:00");
    assignment2.put("status", "pending");
    assignment2.put("submittedDate", "");
    assignment2.put("grade", "");
    assignment2.put("points", "");
    assignment2.put("type", "Lab Report");
    assignment2.put("description", "Write a comprehensive report on the pendulum experiment including data analysis and conclusions.");
    assignment2.put("priority", "high");
    assignments.add(assignment2);
    
    Map<String, String> assignment3 = new HashMap<>();
    assignment3.put("id", "3");
    assignment3.put("title", "Java Programming Project");
    assignment3.put("course", "Computer Science");
    assignment3.put("courseCode", "CS101");
    assignment3.put("dueDate", "2023-12-15");
    assignment3.put("dueTime", "23:59");
    assignment3.put("status", "in-progress");
    assignment3.put("submittedDate", "");
    assignment3.put("grade", "");
    assignment2.put("points", "150");
    assignment3.put("type", "Project");
    assignment3.put("description", "Create a student management system using Java with GUI interface.");
    assignment3.put("priority", "medium");
    assignments.add(assignment3);
    
    Map<String, String> assignment4 = new HashMap<>();
    assignment4.put("id", "4");
    assignment4.put("title", "Literature Essay");
    assignment4.put("course", "English Literature");
    assignment4.put("courseCode", "ENG202");
    assignment4.put("dueDate", "2023-12-20");
    assignment4.put("dueTime", "14:00");
    assignment4.put("status", "not-started");
    assignment4.put("submittedDate", "");
    assignment4.put("grade", "");
    assignment4.put("points", "50");
    assignment4.put("type", "Essay");
    assignment4.put("description", "Analyze the themes of identity in Shakespeare's Hamlet (1500-2000 words).");
    assignment4.put("priority", "low");
    assignments.add(assignment4);
    
    Map<String, String> assignment5 = new HashMap<>();
    assignment5.put("id", "5");
    assignment5.put("title", "Midterm Exam");
    assignment5.put("course", "Mathematics 101");
    assignment5.put("courseCode", "MATH101");
    assignment5.put("dueDate", "2023-11-25");
    assignment5.put("dueTime", "10:00");
    assignment5.put("status", "graded");
    assignment5.put("submittedDate", "2023-11-25");
    assignment5.put("grade", "B+");
    assignment5.put("points", "88/100");
    assignment5.put("type", "Exam");
    assignment5.put("description", "Covers chapters 1-4. Closed book, calculator allowed.");
    assignment5.put("priority", "high");
    assignments.add(assignment5);
    
    // Get filter parameters
    String filterStatus = request.getParameter("status");
    String filterCourse = request.getParameter("course");
    String sortBy = request.getParameter("sort");
    
    // Filter assignments if needed
    List<Map<String, String>> filteredAssignments = new ArrayList<>();
    for (Map<String, String> assignment : assignments) {
        boolean statusMatch = filterStatus == null || filterStatus.isEmpty() || filterStatus.equals("all") || 
                              assignment.get("status").equals(filterStatus);
        boolean courseMatch = filterCourse == null || filterCourse.isEmpty() || filterCourse.equals("all") || 
                              assignment.get("courseCode").equals(filterCourse);
        
        if (statusMatch && courseMatch) {
            filteredAssignments.add(assignment);
        }
    }
    
    // Sort assignments if needed
    if ("dueDate".equals(sortBy)) {
        Collections.sort(filteredAssignments, new Comparator<Map<String, String>>() {
            public int compare(Map<String, String> a1, Map<String, String> a2) {
                return a1.get("dueDate").compareTo(a2.get("dueDate"));
            }
        });
    } else if ("course".equals(sortBy)) {
        Collections.sort(filteredAssignments, new Comparator<Map<String, String>>() {
            public int compare(Map<String, String> a1, Map<String, String> a2) {
                return a1.get("course").compareTo(a2.get("course"));
            }
        });
    }
    
    // Count assignments by status
    int submittedCount = 0;
    int pendingCount = 0;
    int inProgressCount = 0;
    int notStartedCount = 0;
    int gradedCount = 0;
    
    for (Map<String, String> assignment : assignments) {
        switch(assignment.get("status")) {
            case "submitted": submittedCount++; break;
            case "pending": pendingCount++; break;
            case "in-progress": inProgressCount++; break;
            case "not-started": notStartedCount++; break;
            case "graded": gradedCount++; break;
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assignments - Virtual Classroom Scheduler</title>
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
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
            gap: 15px;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .stat-card.active {
            border: 2px solid var(--primary);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }
        
        .stat-icon.submitted {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .stat-icon.pending {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }
        
        .stat-icon.in-progress {
            background: rgba(23, 162, 184, 0.1);
            color: #17a2b8;
        }
        
        .stat-icon.not-started {
            background: rgba(108, 117, 125, 0.1);
            color: var(--gray);
        }
        
        .stat-icon.graded {
            background: rgba(106, 17, 203, 0.1);
            color: var(--primary);
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
        
        .filters-container {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            align-items: center;
        }
        
        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        
        .filter-group label {
            font-size: 0.9rem;
            color: var(--gray);
            font-weight: 500;
        }
        
        .filter-select {
            padding: 8px 12px;
            border-radius: 5px;
            border: 1px solid #ddd;
            background: white;
            min-width: 150px;
        }
        
        .assignments-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }
        
        .assignment-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary);
            position: relative;
            overflow: hidden;
        }
        
        .assignment-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .assignment-card.priority-high {
            border-left-color: var(--danger);
        }
        
        .assignment-card.priority-medium {
            border-left-color: var(--warning);
        }
        
        .assignment-card.priority-low {
            border-left-color: var(--success);
        }
        
        .assignment-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 15px;
        }
        
        .assignment-info h3 {
            color: var(--dark);
            margin-bottom: 5px;
            font-size: 1.2rem;
        }
        
        .assignment-course {
            color: var(--gray);
            font-weight: 500;
            font-size: 0.9rem;
        }
        
        .assignment-type {
            background: var(--light);
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            color: var(--primary);
        }
        
        .assignment-details {
            margin-bottom: 20px;
        }
        
        .detail-item {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 8px;
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .detail-item i {
            width: 16px;
            color: var(--primary);
        }
        
        .assignment-description {
            margin: 15px 0;
            padding: 15px;
            background: var(--light);
            border-radius: 10px;
            font-size: 0.9rem;
            line-height: 1.5;
        }
        
        .assignment-status {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
            margin-bottom: 15px;
        }
        
        .status-submitted {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .status-pending {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }
        
        .status-in-progress {
            background: rgba(23, 162, 184, 0.1);
            color: #17a2b8;
        }
        
        .status-not-started {
            background: rgba(108, 117, 125, 0.1);
            color: var(--gray);
        }
        
        .status-graded {
            background: rgba(106, 17, 203, 0.1);
            color: var(--primary);
        }
        
        .assignment-grade {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
            font-weight: 600;
        }
        
        .grade-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        
        .grade-A {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .grade-B {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }
        
        .assignment-actions {
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
        
        .btn-warning {
            background: var(--warning);
            color: var(--dark);
        }
        
        .btn-warning:hover {
            background: #e0a800;
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
            grid-column: 1 / -1;
        }
        
        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #dee2e6;
        }
        
        .due-date {
            display: flex;
            align-items: center;
            gap: 5px;
            font-weight: 600;
        }
        
        .due-date.urgent {
            color: var(--danger);
        }
        
        .due-date.upcoming {
            color: var(--warning);
        }
        
        .due-date.future {
            color: var(--success);
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
            
            .assignments-grid {
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
            
            .filters-container {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .filter-group {
                width: 100%;
            }
            
            .filter-select {
                width: 100%;
            }
            
            .assignment-header {
                flex-direction: column;
                gap: 10px;
            }
            
            .assignment-actions {
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
                <li><a href="my-classes.jsp"><i class="fas fa-chalkboard-teacher"></i><span>My Classes</span></a></li>
                <li><a href="attendance.jsp"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="assignments.jsp" class="active"><i class="fas fa-tasks"></i><span>Assignments</span></a></li>
                <li><a href="grades.jsp"><i class="fas fa-chart-line"></i><span>Grades</span></a></li>
                <li><a href="schedule.jsp"><i class="fas fa-calendar-alt"></i><span>Schedule</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>Assignments</h1>
                <div class="user-info">
                    <div class="user-avatar">S</div>
                    <div>
                        <div style="font-weight: 600;">Student User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Computer Science</div>
                    </div>
                </div>
            </div>
            
            <div class="page-header">
                <h2>My Assignments</h2>
                <div style="display: flex; gap: 10px;">
                    <a href="submit-assignment.jsp" class="btn btn-primary">
                        <i class="fas fa-plus-circle"></i> Submit Assignment
                    </a>
                </div>
            </div>
            
            <div class="stats-cards">
                <div class="stat-card <%= "all".equals(filterStatus) || filterStatus == null ? "active" : "" %>" onclick="filterByStatus('all')">
                    <div class="stat-icon graded">
                        <i class="fas fa-tasks"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= assignments.size() %></h3>
                        <p>Total Assignments</p>
                    </div>
                </div>
                
                <div class="stat-card <%= "graded".equals(filterStatus) ? "active" : "" %>" onclick="filterByStatus('graded')">
                    <div class="stat-icon graded">
                        <i class="fas fa-check-double"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= gradedCount %></h3>
                        <p>Graded</p>
                    </div>
                </div>
                
                <div class="stat-card <%= "submitted".equals(filterStatus) ? "active" : "" %>" onclick="filterByStatus('submitted')">
                    <div class="stat-icon submitted">
                        <i class="fas fa-paper-plane"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= submittedCount %></h3>
                        <p>Submitted</p>
                    </div>
                </div>
                
                <div class="stat-card <%= "in-progress".equals(filterStatus) ? "active" : "" %>" onclick="filterByStatus('in-progress')">
                    <div class="stat-icon in-progress">
                        <i class="fas fa-spinner"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= inProgressCount %></h3>
                        <p>In Progress</p>
                    </div>
                </div>
                
                <div class="stat-card <%= "not-started".equals(filterStatus) ? "active" : "" %>" onclick="filterByStatus('not-started')">
                    <div class="stat-icon not-started">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= notStartedCount %></h3>
                        <p>Not Started</p>
                    </div>
                </div>
            </div>
            
            <div class="filters-container">
                <div class="filter-group">
                    <label for="statusFilter">Status</label>
                    <select id="statusFilter" class="filter-select" onchange="filterAssignments()">
                        <option value="all" <%= (filterStatus == null || "all".equals(filterStatus)) ? "selected" : "" %>>All Statuses</option>
                        <option value="not-started" <%= "not-started".equals(filterStatus) ? "selected" : "" %>>Not Started</option>
                        <option value="in-progress" <%= "in-progress".equals(filterStatus) ? "selected" : "" %>>In Progress</option>
                        <option value="submitted" <%= "submitted".equals(filterStatus) ? "selected" : "" %>>Submitted</option>
                        <option value="graded" <%= "graded".equals(filterStatus) ? "selected" : "" %>>Graded</option>
                    </select>
                </div>
                
                <div class="filter-group">
                    <label for="courseFilter">Course</label>
                    <select id="courseFilter" class="filter-select" onchange="filterAssignments()">
                        <option value="all" <%= (filterCourse == null || "all".equals(filterCourse)) ? "selected" : "" %>>All Courses</option>
                        <option value="MATH101" <%= "MATH101".equals(filterCourse) ? "selected" : "" %>>Mathematics 101</option>
                        <option value="PHYS201" <%= "PHYS201".equals(filterCourse) ? "selected" : "" %>>Physics 201</option>
                        <option value="CS101" <%= "CS101".equals(filterCourse) ? "selected" : "" %>>Computer Science</option>
                        <option value="ENG202" <%= "ENG202".equals(filterCourse) ? "selected" : "" %>>English Literature</option>
                    </select>
                </div>
                
                <div class="filter-group">
                    <label for="sortFilter">Sort By</label>
                    <select id="sortFilter" class="filter-select" onchange="sortAssignments()">
                        <option value="default" <%= (sortBy == null || "default".equals(sortBy)) ? "selected" : "" %>>Default</option>
                        <option value="dueDate" <%= "dueDate".equals(sortBy) ? "selected" : "" %>>Due Date</option>
                        <option value="course" <%= "course".equals(sortBy) ? "selected" : "" %>>Course</option>
                    </select>
                </div>
                
                <div style="margin-left: auto;">
                    <button class="btn btn-outline" onclick="clearFilters()">
                        <i class="fas fa-times"></i> Clear Filters
                    </button>
                </div>
            </div>
            
            <% if (filteredAssignments != null && !filteredAssignments.isEmpty()) { %>
                <div class="assignments-grid">
                    <% for (Map<String, String> assignment : filteredAssignments) { 
                        String status = assignment.get("status");
                        String priority = assignment.get("priority");
                        String dueDate = assignment.get("dueDate");
                        String dueTime = assignment.get("dueTime");
                        
                        // Determine due date class for styling
                        String dueDateClass = "due-date future";
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                        try {
                            java.util.Date due = sdf.parse(dueDate);
                            java.util.Date today = new java.util.Date();
                            long diff = due.getTime() - today.getTime();
                            long days = diff / (1000 * 60 * 60 * 24);
                            
                            if (days < 0) {
                                dueDateClass = "due-date urgent";
                            } else if (days <= 3) {
                                dueDateClass = "due-date urgent";
                            } else if (days <= 7) {
                                dueDateClass = "due-date upcoming";
                            }
                        } catch (Exception e) {
                            // Keep default class if parsing fails
                        }
                    %>
                    <div class="assignment-card priority-<%= priority %>">
                        <div class="assignment-header">
                            <div class="assignment-info">
                                <h3><%= assignment.get("title") %></h3>
                                <div class="assignment-course"><%= assignment.get("course") %> (<%= assignment.get("courseCode") %>)</div>
                            </div>
                            <div class="assignment-type">
                                <%= assignment.get("type") %>
                            </div>
                        </div>
                        
                        <div class="assignment-details">
                            <div class="detail-item">
                                <i class="far fa-calendar-alt"></i>
                                <span class="<%= dueDateClass %>">
                                    Due: <%= dueDate %> at <%= dueTime %>
                                    <% if (dueDateClass.contains("urgent")) { %>
                                        <i class="fas fa-exclamation-circle"></i>
                                    <% } %>
                                </span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-user-tie"></i>
                                <span>Instructor: Dr. <%= assignment.get("course").equals("Mathematics 101") ? "Sarah Smith" : 
                                                       assignment.get("course").equals("Physics 201") ? "Michael Brown" : 
                                                       assignment.get("course").equals("Computer Science") ? "Jennifer Wilson" : "Robert Johnson" %></span>
                            </div>
                            <% if (assignment.get("points") != null && !assignment.get("points").isEmpty()) { %>
                            <div class="detail-item">
                                <i class="fas fa-star"></i>
                                <span>Points: <%= assignment.get("points") %></span>
                            </div>
                            <% } %>
                        </div>
                        
                        <div class="assignment-description">
                            <%= assignment.get("description") %>
                        </div>
                        
                        <div class="assignment-status status-<%= status %>">
                            <% 
                                String statusText = "";
                                switch(status) {
                                    case "submitted": statusText = "Submitted"; break;
                                    case "pending": statusText = "Pending Review"; break;
                                    case "in-progress": statusText = "In Progress"; break;
                                    case "not-started": statusText = "Not Started"; break;
                                    case "graded": statusText = "Graded"; break;
                                }
                            %>
                            <%= statusText %>
                        </div>
                        
                        <% if ("graded".equals(status) && assignment.get("grade") != null && !assignment.get("grade").isEmpty()) { %>
                        <div class="assignment-grade">
                            <span>Grade:</span>
                            <span class="grade-badge grade-<%= assignment.get("grade").charAt(0) %>">
                                <%= assignment.get("grade") %>
                            </span>
                            <span><%= assignment.get("points") %></span>
                        </div>
                        <% } %>
                        
                        <div class="assignment-actions">
                            <% if ("not-started".equals(status) || "in-progress".equals(status)) { %>
                                <a href="submit-assignment.jsp?id=<%= assignment.get("id") %>" class="btn btn-primary">
                                    <i class="fas fa-edit"></i> Work on Assignment
                                </a>
                            <% } %>
                            
                            <% if ("submitted".equals(status) || "graded".equals(status)) { %>
                                <a href="view-submission.jsp?id=<%= assignment.get("id") %>" class="btn btn-outline">
                                    <i class="fas fa-eye"></i> View Submission
                                </a>
                            <% } %>
                            
                            <a href="assignment-details.jsp?id=<%= assignment.get("id") %>" class="btn btn-outline">
                                <i class="fas fa-info-circle"></i> Details
                            </a>
                        </div>
                    </div>
                    <% } %>
                </div>
            <% } else { %>
                <div class="empty-state">
                    <i class="fas fa-tasks"></i>
                    <h3>No Assignments Found</h3>
                    <p>No assignments match your current filters. Try adjusting your criteria.</p>
                    <button class="btn btn-primary" onclick="clearFilters()" style="margin-top: 20px;">
                        <i class="fas fa-times"></i> Clear Filters
                    </button>
                </div>
            <% } %>
        </div>
    </div>

    <script>
        function filterByStatus(status) {
            const url = new URL(window.location.href);
            url.searchParams.set('status', status);
            window.location.href = url.toString();
        }
        
        function filterAssignments() {
            const status = document.getElementById('statusFilter').value;
            const course = document.getElementById('courseFilter').value;
            
            const url = new URL(window.location.href);
            url.searchParams.set('status', status);
            url.searchParams.set('course', course);
            window.location.href = url.toString();
        }
        
        function sortAssignments() {
            const sortBy = document.getElementById('sortFilter').value;
            
            const url = new URL(window.location.href);
            url.searchParams.set('sort', sortBy);
            window.location.href = url.toString();
        }
        
        function clearFilters() {
            window.location.href = 'assignments.jsp';
        }
        
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
            
            // Add animation to assignment cards
            const assignmentCards = document.querySelectorAll('.assignment-card');
            assignmentCards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100 + 300);
            });
        });
    </script>
</body>
</html>