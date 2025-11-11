<%@page import="java.util.*" %>
<%
    // Sample attendance data
    List<Map<String, String>> attendanceRecords = new ArrayList<>();
    
    // Mathematics 101 Attendance
    Map<String, String> math1 = new HashMap<>();
    math1.put("id", "1");
    math1.put("course", "Mathematics 101");
    math1.put("code", "MATH101");
    math1.put("date", "2023-11-01");
    math1.put("status", "Present");
    math1.put("instructor", "Dr. Sarah Smith");
    math1.put("time", "09:00 AM");
    math1.put("notes", "");
    attendanceRecords.add(math1);
    
    Map<String, String> math2 = new HashMap<>();
    math2.put("id", "2");
    math2.put("course", "Mathematics 101");
    math2.put("code", "MATH101");
    math2.put("date", "2023-11-03");
    math2.put("status", "Present");
    math2.put("instructor", "Dr. Sarah Smith");
    math2.put("time", "09:00 AM");
    math2.put("notes", "");
    attendanceRecords.add(math2);
    
    Map<String, String> math3 = new HashMap<>();
    math3.put("id", "3");
    math3.put("course", "Mathematics 101");
    math3.put("code", "MATH101");
    math3.put("date", "2023-11-06");
    math3.put("status", "Late");
    math3.put("instructor", "Dr. Sarah Smith");
    math3.put("time", "09:15 AM");
    math3.put("notes", "Traffic delay");
    attendanceRecords.add(math3);
    
    Map<String, String> math4 = new HashMap<>();
    math4.put("id", "4");
    math4.put("course", "Mathematics 101");
    math4.put("code", "MATH101");
    math4.put("date", "2023-11-08");
    math4.put("status", "Present");
    math4.put("instructor", "Dr. Sarah Smith");
    math4.put("time", "09:00 AM");
    math4.put("notes", "");
    attendanceRecords.add(math4);
    
    Map<String, String> math5 = new HashMap<>();
    math5.put("id", "5");
    math5.put("course", "Mathematics 101");
    math5.put("code", "MATH101");
    math5.put("date", "2023-11-10");
    math5.put("status", "Absent");
    math5.put("instructor", "Dr. Sarah Smith");
    math5.put("time", "-");
    math5.put("notes", "Medical appointment");
    attendanceRecords.add(math5);
    
    // Physics 201 Attendance
    Map<String, String> phys1 = new HashMap<>();
    phys1.put("id", "6");
    phys1.put("course", "Physics 201");
    phys1.put("code", "PHYS201");
    phys1.put("date", "2023-11-02");
    phys1.put("status", "Present");
    phys1.put("instructor", "Dr. Michael Brown");
    phys1.put("time", "11:00 AM");
    phys1.put("notes", "");
    attendanceRecords.add(phys1);
    
    Map<String, String> phys2 = new HashMap<>();
    phys2.put("id", "7");
    phys2.put("course", "Physics 201");
    phys2.put("code", "PHYS201");
    phys2.put("date", "2023-11-07");
    phys2.put("status", "Present");
    phys2.put("instructor", "Dr. Michael Brown");
    phys2.put("time", "11:00 AM");
    phys2.put("notes", "");
    attendanceRecords.add(phys2);
    
    Map<String, String> phys3 = new HashMap<>();
    phys3.put("id", "8");
    phys3.put("course", "Physics 201");
    phys3.put("code", "PHYS201");
    phys3.put("date", "2023-11-09");
    phys3.put("status", "Present");
    phys3.put("instructor", "Dr. Michael Brown");
    phys3.put("time", "11:00 AM");
    phys3.put("notes", "");
    attendanceRecords.add(phys3);
    
    // Computer Science Attendance
    Map<String, String> cs1 = new HashMap<>();
    cs1.put("id", "9");
    cs1.put("course", "Computer Science");
    cs1.put("code", "CS101");
    cs1.put("date", "2023-11-01");
    cs1.put("status", "Present");
    cs1.put("instructor", "Prof. Jennifer Wilson");
    cs1.put("time", "02:00 PM");
    cs1.put("notes", "");
    attendanceRecords.add(cs1);
    
    Map<String, String> cs2 = new HashMap<>();
    cs2.put("id", "10");
    cs2.put("course", "Computer Science");
    cs2.put("code", "CS101");
    cs2.put("date", "2023-11-06");
    cs2.put("status", "Present");
    cs2.put("instructor", "Prof. Jennifer Wilson");
    cs2.put("time", "02:00 PM");
    cs2.put("notes", "");
    attendanceRecords.add(cs2);
    
    Map<String, String> cs3 = new HashMap<>();
    cs3.put("id", "11");
    cs3.put("course", "Computer Science");
    cs3.put("code", "CS101");
    cs3.put("date", "2023-11-08");
    cs3.put("status", "Excused");
    cs3.put("instructor", "Prof. Jennifer Wilson");
    cs3.put("time", "-");
    cs3.put("notes", "University event");
    attendanceRecords.add(cs3);
    
    // English Literature Attendance
    Map<String, String> eng1 = new HashMap<>();
    eng1.put("id", "12");
    eng1.put("course", "English Literature");
    eng1.put("code", "ENG202");
    eng1.put("date", "2023-11-02");
    eng1.put("status", "Present");
    eng1.put("instructor", "Dr. Robert Johnson");
    eng1.put("time", "01:00 PM");
    eng1.put("notes", "");
    attendanceRecords.add(eng1);
    
    Map<String, String> eng2 = new HashMap<>();
    eng2.put("id", "13");
    eng2.put("course", "English Literature");
    eng2.put("code", "ENG202");
    eng2.put("date", "2023-11-07");
    eng2.put("status", "Present");
    eng2.put("instructor", "Dr. Robert Johnson");
    eng2.put("time", "01:00 PM");
    eng2.put("notes", "");
    attendanceRecords.add(eng2);
    
    Map<String, String> eng3 = new HashMap<>();
    eng3.put("id", "14");
    eng3.put("course", "English Literature");
    eng3.put("code", "ENG202");
    eng3.put("date", "2023-11-09");
    eng3.put("status", "Late");
    eng3.put("instructor", "Dr. Robert Johnson");
    eng3.put("time", "01:10 PM");
    eng3.put("notes", "Library book return");
    attendanceRecords.add(eng3);
    
    // Calculate attendance statistics
    Map<String, Map<String, Integer>> courseStats = new HashMap<>();
    
    for (Map<String, String> record : attendanceRecords) {
        String courseCode = record.get("code");
        String status = record.get("status");
        
        if (!courseStats.containsKey(courseCode)) {
            Map<String, Integer> stats = new HashMap<>();
            stats.put("total", 0);
            stats.put("present", 0);
            stats.put("absent", 0);
            stats.put("late", 0);
            stats.put("excused", 0);
            courseStats.put(courseCode, stats);
        }
        
        Map<String, Integer> stats = courseStats.get(courseCode);
        stats.put("total", stats.get("total") + 1);
        
        switch(status) {
            case "Present":
                stats.put("present", stats.get("present") + 1);
                break;
            case "Absent":
                stats.put("absent", stats.get("absent") + 1);
                break;
            case "Late":
                stats.put("late", stats.get("late") + 1);
                break;
            case "Excused":
                stats.put("excused", stats.get("excused") + 1);
                break;
        }
    }
    
    // Calculate overall statistics
    int totalClasses = 0;
    int totalPresent = 0;
    int totalAbsent = 0;
    int totalLate = 0;
    int totalExcused = 0;
    
    for (Map<String, Integer> stats : courseStats.values()) {
        totalClasses += stats.get("total");
        totalPresent += stats.get("present");
        totalAbsent += stats.get("absent");
        totalLate += stats.get("late");
        totalExcused += stats.get("excused");
    }
    
    int totalAttended = totalPresent + totalLate + totalExcused;
    double overallPercentage = totalClasses > 0 ? (totalAttended * 100.0) / totalClasses : 0;
    
    // Get filter parameters
    String filterCourse = request.getParameter("course");
    String filterStatus = request.getParameter("status");
    String filterMonth = request.getParameter("month");
    
    // Filter records
    List<Map<String, String>> filteredRecords = new ArrayList<>();
    for (Map<String, String> record : attendanceRecords) {
        boolean courseMatch = filterCourse == null || filterCourse.isEmpty() || filterCourse.equals("all") || 
                              record.get("code").equals(filterCourse);
        boolean statusMatch = filterStatus == null || filterStatus.isEmpty() || filterStatus.equals("all") || 
                              record.get("status").equals(filterStatus);
        boolean monthMatch = filterMonth == null || filterMonth.isEmpty() || filterMonth.equals("all");
        
        if (courseMatch && statusMatch && monthMatch) {
            filteredRecords.add(record);
        }
    }
    
    // Sort by date (newest first)
    Collections.sort(filteredRecords, new Comparator<Map<String, String>>() {
        public int compare(Map<String, String> r1, Map<String, String> r2) {
            return r2.get("date").compareTo(r1.get("date"));
        }
    });
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance - Virtual Classroom Scheduler</title>
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
            --info: #17a2b8;
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
        
        .stat-icon.danger {
            background: rgba(220, 53, 69, 0.1);
            color: var(--danger);
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
        
        .course-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .course-stat-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }
        
        .course-stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        
        .course-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
        }
        
        .course-info h3 {
            color: var(--dark);
            margin-bottom: 5px;
            font-size: 1.2rem;
        }
        
        .course-code {
            color: var(--gray);
            font-weight: 500;
        }
        
        .attendance-percentage {
            font-size: 1.5rem;
            font-weight: 700;
        }
        
        .percentage-high {
            color: var(--success);
        }
        
        .percentage-medium {
            color: var(--warning);
        }
        
        .percentage-low {
            color: var(--danger);
        }
        
        .progress-container {
            width: 100%;
            background: #e9ecef;
            border-radius: 10px;
            height: 8px;
            overflow: hidden;
            margin: 15px 0;
        }
        
        .progress-bar {
            height: 100%;
            border-radius: 10px;
            transition: width 0.5s ease;
        }
        
        .progress-high {
            background: var(--success);
        }
        
        .progress-medium {
            background: var(--warning);
        }
        
        .progress-low {
            background: var(--danger);
        }
        
        .status-breakdown {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            margin-top: 15px;
        }
        
        .status-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 0.9rem;
        }
        
        .status-count {
            font-weight: 600;
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
        
        .attendance-table-container {
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
        
        .attendance-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .attendance-table th {
            text-align: left;
            padding: 15px 25px;
            background: #f8f9fa;
            color: var(--gray);
            font-weight: 600;
            border-bottom: 1px solid #eee;
        }
        
        .attendance-table td {
            padding: 15px 25px;
            border-bottom: 1px solid #eee;
        }
        
        .attendance-table tr:last-child td {
            border-bottom: none;
        }
        
        .attendance-table tr:hover {
            background: #f8f9fa;
        }
        
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
            display: inline-block;
        }
        
        .status-present {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .status-absent {
            background: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }
        
        .status-late {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }
        
        .status-excused {
            background: rgba(23, 162, 184, 0.1);
            color: var(--info);
        }
        
        .notes-cell {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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
            
            .course-stats {
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
            
            .table-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .attendance-table {
                display: block;
                overflow-x: auto;
            }
        }
        
        @media (max-width: 576px) {
            .stats-cards {
                grid-template-columns: 1fr;
            }
            
            .status-breakdown {
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
                    <i class="fas fa-user-graduate"></i>
                </div>
                <div class="logo-text">Virtual Classroom</div>
            </div>
            
            <ul class="nav-links">
                <li><a href="studentDashboard.jsp"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                <li><a href="my-classes.jsp"><i class="fas fa-chalkboard-teacher"></i><span>My Classes</span></a></li>
                <li><a href="attendance.jsp" class="active"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="assignments.jsp"><i class="fas fa-tasks"></i><span>Assignments</span></a></li>
                <li><a href="grades.jsp"><i class="fas fa-chart-line"></i><span>Grades</span></a></li>
                <li><a href="schedule.jsp"><i class="fas fa-calendar-alt"></i><span>Schedule</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>Attendance</h1>
                <div class="user-info">
                    <div class="user-avatar">S</div>
                    <div>
                        <div style="font-weight: 600;">Student User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Computer Science</div>
                    </div>
                </div>
            </div>
            
            <div class="page-header">
                <h2>Attendance Records</h2>
                <div style="display: flex; gap: 10px;">
                    <button class="btn btn-primary" onclick="printAttendance()">
                        <i class="fas fa-print"></i> Print Report
                    </button>
                    <button class="btn btn-outline" onclick="exportAttendance()">
                        <i class="fas fa-download"></i> Export
                    </button>
                </div>
            </div>
            
            <div class="stats-cards">
                <div class="stat-card">
                    <div class="stat-icon primary">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= String.format("%.0f", overallPercentage) %>%</h3>
                        <p>Overall Attendance</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon success">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= totalAttended %></h3>
                        <p>Classes Attended</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon warning">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= totalLate %></h3>
                        <p>Late Arrivals</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon danger">
                        <i class="fas fa-times-circle"></i>
                    </div>
                    <div class="stat-content">
                        <h3><%= totalAbsent %></h3>
                        <p>Absences</p>
                    </div>
                </div>
            </div>
            
            <div class="course-stats">
                <% 
                    String[] courses = {"MATH101", "PHYS201", "CS101", "ENG202"};
                    String[] courseNames = {"Mathematics 101", "Physics 201", "Computer Science", "English Literature"};
                    String[] courseColors = {"#6a11cb", "#2575fc", "#28a745", "#ffc107"};
                    
                    for (int i = 0; i < courses.length; i++) {
                        String courseCode = courses[i];
                        if (courseStats.containsKey(courseCode)) {
                            Map<String, Integer> stats = courseStats.get(courseCode);
                            int total = stats.get("total");
                            int present = stats.get("present");
                            int absent = stats.get("absent");
                            int late = stats.get("late");
                            int excused = stats.get("excused");
                            
                            int effectivePresent = present + late + excused;
                            double percentage = total > 0 ? (effectivePresent * 100.0) / total : 0;
                            String percentageClass = percentage >= 90 ? "percentage-high" : 
                                                   percentage >= 75 ? "percentage-medium" : "percentage-low";
                            String progressClass = percentage >= 90 ? "progress-high" : 
                                                percentage >= 75 ? "progress-medium" : "progress-low";
                %>
                <div class="course-stat-card">
                    <div class="course-header">
                        <div class="course-info">
                            <h3><%= courseNames[i] %></h3>
                            <div class="course-code"><%= courseCode %></div>
                        </div>
                        <div class="attendance-percentage <%= percentageClass %>">
                            <%= String.format("%.0f", percentage) %>%
                        </div>
                    </div>
                    
                    <div class="progress-container">
                        <div class="progress-bar <%= progressClass %>" style="width: <%= percentage %>%;"></div>
                    </div>
                    
                    <div class="status-breakdown">
                        <div class="status-item">
                            <span>Present:</span>
                            <span class="status-count"><%= present %></span>
                        </div>
                        <div class="status-item">
                            <span>Late:</span>
                            <span class="status-count"><%= late %></span>
                        </div>
                        <div class="status-item">
                            <span>Excused:</span>
                            <span class="status-count"><%= excused %></span>
                        </div>
                        <div class="status-item">
                            <span>Absent:</span>
                            <span class="status-count"><%= absent %></span>
                        </div>
                    </div>
                </div>
                <% 
                        }
                    } 
                %>
            </div>
            
            <div class="filters-container">
                <div class="filter-group">
                    <label for="courseFilter">Course</label>
                    <select id="courseFilter" class="filter-select" onchange="filterAttendance()">
                        <option value="all" <%= (filterCourse == null || "all".equals(filterCourse)) ? "selected" : "" %>>All Courses</option>
                        <option value="MATH101" <%= "MATH101".equals(filterCourse) ? "selected" : "" %>>Mathematics 101</option>
                        <option value="PHYS201" <%= "PHYS201".equals(filterCourse) ? "selected" : "" %>>Physics 201</option>
                        <option value="CS101" <%= "CS101".equals(filterCourse) ? "selected" : "" %>>Computer Science</option>
                        <option value="ENG202" <%= "ENG202".equals(filterCourse) ? "selected" : "" %>>English Literature</option>
                    </select>
                </div>
                
                <div class="filter-group">
                    <label for="statusFilter">Status</label>
                    <select id="statusFilter" class="filter-select" onchange="filterAttendance()">
                        <option value="all" <%= (filterStatus == null || "all".equals(filterStatus)) ? "selected" : "" %>>All Statuses</option>
                        <option value="Present" <%= "Present".equals(filterStatus) ? "selected" : "" %>>Present</option>
                        <option value="Absent" <%= "Absent".equals(filterStatus) ? "selected" : "" %>>Absent</option>
                        <option value="Late" <%= "Late".equals(filterStatus) ? "selected" : "" %>>Late</option>
                        <option value="Excused" <%= "Excused".equals(filterStatus) ? "selected" : "" %>>Excused</option>
                    </select>
                </div>
                
                <div class="filter-group">
                    <label for="monthFilter">Month</label>
                    <select id="monthFilter" class="filter-select" onchange="filterAttendance()">
                        <option value="all" <%= (filterMonth == null || "all".equals(filterMonth)) ? "selected" : "" %>>All Months</option>
                        <option value="2023-11">November 2023</option>
                        <option value="2023-10">October 2023</option>
                        <option value="2023-09">September 2023</option>
                    </select>
                </div>
                
                <div style="margin-left: auto;">
                    <button class="btn btn-outline" onclick="clearFilters()">
                        <i class="fas fa-times"></i> Clear Filters
                    </button>
                </div>
            </div>
            
            <% if (filteredRecords != null && !filteredRecords.isEmpty()) { %>
                <div class="attendance-table-container">
                    <div class="table-header">
                        <h3>Attendance History</h3>
                        <div style="color: var(--gray); font-size: 0.9rem;">
                            Showing <%= filteredRecords.size() %> records
                        </div>
                    </div>
                    
                    <table class="attendance-table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Course</th>
                                <th>Instructor</th>
                                <th>Time</th>
                                <th>Status</th>
                                <th>Notes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Map<String, String> record : filteredRecords) { 
                                String status = record.get("status");
                                String statusClass = "";
                                switch(status) {
                                    case "Present": statusClass = "status-present"; break;
                                    case "Absent": statusClass = "status-absent"; break;
                                    case "Late": statusClass = "status-late"; break;
                                    case "Excused": statusClass = "status-excused"; break;
                                }
                            %>
                            <tr>
                                <td><%= record.get("date") %></td>
                                <td>
                                    <div style="font-weight: 600;"><%= record.get("course") %></div>
                                    <div style="font-size: 0.85rem; color: var(--gray);"><%= record.get("code") %></div>
                                </td>
                                <td><%= record.get("instructor") %></td>
                                <td><%= record.get("time") %></td>
                                <td>
                                    <span class="status-badge <%= statusClass %>">
                                        <%= status %>
                                    </span>
                                </td>
                                <td class="notes-cell">
                                    <%= record.get("notes") != null && !record.get("notes").isEmpty() ? record.get("notes") : "-" %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } else { %>
                <div class="empty-state">
                    <i class="fas fa-clipboard-check"></i>
                    <h3>No Attendance Records Found</h3>
                    <p>No attendance records match your current filters. Try adjusting your criteria.</p>
                    <button class="btn btn-primary" onclick="clearFilters()" style="margin-top: 20px;">
                        <i class="fas fa-times"></i> Clear Filters
                    </button>
                </div>
            <% } %>
        </div>
    </div>

    <script>
        function filterAttendance() {
            const course = document.getElementById('courseFilter').value;
            const status = document.getElementById('statusFilter').value;
            const month = document.getElementById('monthFilter').value;
            
            const url = new URL(window.location.href);
            url.searchParams.set('course', course);
            url.searchParams.set('status', status);
            url.searchParams.set('month', month);
            window.location.href = url.toString();
        }
        
        function clearFilters() {
            window.location.href = 'attendance.jsp';
        }
        
        function printAttendance() {
            window.print();
        }
        
        function exportAttendance() {
            alert('Attendance data would be exported as CSV in a full implementation');
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
            
            // Add animation to course stats
            const courseStats = document.querySelectorAll('.course-stat-card');
            courseStats.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100 + 300);
            });
            
            // Add animation to progress bars
            const progressBars = document.querySelectorAll('.progress-bar');
            progressBars.forEach((bar, index) => {
                const width = bar.style.width;
                bar.style.width = '0';
                setTimeout(() => {
                    bar.style.transition = 'width 1s ease';
                    bar.style.width = width;
                }, index * 100 + 600);
            });
        });
    </script>
</body>
</html>