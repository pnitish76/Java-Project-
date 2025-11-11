<%@page import="java.util.*" %>
<%
    // Sample student data
    List<Map<String, String>> students = new ArrayList<>();
    Map<String, String> student1 = new HashMap<>();
    student1.put("id", "1"); student1.put("name", "John Doe"); student1.put("email", "john.doe@university.edu"); 
    student1.put("class", "Mathematics 101"); student1.put("attendance", "92%"); student1.put("grade", "A-");
    students.add(student1);
    
    Map<String, String> student2 = new HashMap<>();
    student2.put("id", "2"); student2.put("name", "Jane Smith"); student2.put("email", "jane.smith@university.edu"); 
    student2.put("class", "Mathematics 101"); student2.put("attendance", "88%"); student2.put("grade", "B+");
    students.add(student2);
    
    Map<String, String> student3 = new HashMap<>();
    student3.put("id", "3"); student3.put("name", "Mike Johnson"); student3.put("email", "mike.j@university.edu"); 
    student3.put("class", "Advanced Calculus"); student3.put("attendance", "95%"); student3.put("grade", "A");
    students.add(student3);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students - Virtual Classroom Scheduler</title>
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
        
        .attendance-percentage {
            font-weight: 600;
        }
        
        .percentage-high { color: var(--success); }
        .percentage-medium { color: var(--warning); }
        .percentage-low { color: var(--danger); }
        
        .grade-badge {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .grade-a { background: #d4edda; color: #155724; }
        .grade-b { background: #fff3cd; color: #856404; }
        .grade-c { background: #f8d7da; color: #721c24; }
        
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
        
        .btn-info {
            background: #17a2b8;
            color: white;
        }
        
        .btn-info:hover {
            background: #138496;
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
            
            .search-filter {
                flex-direction: column;
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
                <li><a href="students.jsp" class="active"><i class="fas fa-users"></i><span>Students</span></a></li>
                <li><a href="grades.jsp"><i class="fas fa-chart-line"></i><span>Grades</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>Student Management</h1>
                <div class="user-info">
                    <div class="user-avatar">T</div>
                    <div>
                        <div style="font-weight: 600;">Teacher User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Mathematics Department</div>
                    </div>
                </div>
            </div>
            
            <div class="page-header">
                <h2>My Students</h2>
                <div style="display: flex; gap: 10px;">
                    <a href="export-students.jsp" class="btn btn-primary">
                        <i class="fas fa-download"></i> Export List
                    </a>
                    <a href="add-student.jsp" class="btn btn-success">
                        <i class="fas fa-user-plus"></i> Add Student
                    </a>
                </div>
            </div>
            
            <div class="search-filter">
                <div class="search-box">
                    <input type="text" class="form-control" placeholder="Search students by name or email...">
                </div>
                <select class="form-control filter-select">
                    <option value="">All Classes</option>
                    <option value="math101">Mathematics 101</option>
                    <option value="math201">Advanced Calculus</option>
                </select>
                <select class="form-control filter-select">
                    <option value="">All Grades</option>
                    <option value="A">A Grade</option>
                    <option value="B">B Grade</option>
                    <option value="C">C Grade</option>
                </select>
            </div>
            
            <div class="table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Email</th>
                            <th>Class</th>
                            <th>Attendance</th>
                            <th>Current Grade</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, String> student : students) { %>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 10px;">
                                    <div style="width: 40px; height: 40px; border-radius: 50%; background: var(--light); display: flex; align-items: center; justify-content: center; color: var(--primary); font-weight: 600;">
                                        <%= student.get("name").charAt(0) %>
                                    </div>
                                    <%= student.get("name") %>
                                </div>
                            </td>
                            <td><%= student.get("email") %></td>
                            <td><%= student.get("class") %></td>
                            <td>
                                <%
                                    String attendance = student.get("attendance");
                                    String attendanceClass = "percentage-high";
                                    if (Integer.parseInt(attendance.replace("%", "")) < 80) {
                                        attendanceClass = "percentage-low";
                                    } else if (Integer.parseInt(attendance.replace("%", "")) < 90) {
                                        attendanceClass = "percentage-medium";
                                    }
                                %>
                                <span class="attendance-percentage <%= attendanceClass %>">
                                    <%= attendance %>
                                </span>
                            </td>
                            <td>
                                <%
                                    String grade = student.get("grade");
                                    String gradeClass = "grade-" + grade.charAt(0).toLowerCase();
                                %>
                                <span class="grade-badge <%= gradeClass %>">
                                    <%= grade %>
                                </span>
                            </td>
                            <td>
                                <a href="student-profile.jsp?id=<%= student.get("id") %>" class="btn btn-info btn-sm">
                                    <i class="fas fa-eye"></i> Profile
                                </a>
                                <a href="student-grades.jsp?id=<%= student.get("id") %>" class="btn btn-primary btn-sm">
                                    <i class="fas fa-edit"></i> Grades
                                </a>
                                <a href="student-attendance.jsp?id=<%= student.get("id") %>" class="btn btn-success btn-sm">
                                    <i class="fas fa-clipboard-check"></i> Attendance
                                </a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.querySelector('.search-box input');
            const classFilter = document.querySelector('.filter-select:nth-child(2)');
            const gradeFilter = document.querySelector('.filter-select:nth-child(3)');
            const tableRows = document.querySelectorAll('.data-table tbody tr');
            
            function filterStudents() {
                const searchTerm = searchInput.value.toLowerCase();
                const classValue = classFilter.value.toLowerCase();
                const gradeValue = gradeFilter.value.toLowerCase();
                
                tableRows.forEach(row => {
                    const name = row.cells[0].textContent.toLowerCase();
                    const email = row.cells[1].textContent.toLowerCase();
                    const className = row.cells[2].textContent.toLowerCase();
                    const grade = row.cells[4].textContent.toLowerCase();
                    
                    const matchesSearch = name.includes(searchTerm) || email.includes(searchTerm);
                    const matchesClass = !classValue || className.includes(classValue);
                    const matchesGrade = !gradeValue || grade.includes(gradeValue);
                    
                    row.style.display = (matchesSearch && matchesClass && matchesGrade) ? '' : 'none';
                });
            }
            
            searchInput.addEventListener('input', filterStudents);
            classFilter.addEventListener('change', filterStudents);
            gradeFilter.addEventListener('change', filterStudents);
        });
    </script>
</body>
</html>