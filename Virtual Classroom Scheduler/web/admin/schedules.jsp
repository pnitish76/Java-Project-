<%@page import="java.util.*" %>
<%
    // Sample schedule data
    List<Map<String, String>> schedules = new ArrayList<>();
    Map<String, String> schedule1 = new HashMap<>();
    schedule1.put("id", "1"); schedule1.put("className", "Mathematics 101"); schedule1.put("teacher", "Dr. Sarah Smith"); 
    schedule1.put("date", "2023-12-01"); schedule1.put("time", "09:00 - 10:30"); schedule1.put("room", "Room 101"); 
    schedule1.put("status", "Scheduled"); schedule1.put("students", "25");
    schedules.add(schedule1);
    
    Map<String, String> schedule2 = new HashMap<>();
    schedule2.put("id", "2"); schedule2.put("className", "Physics 201"); schedule2.put("teacher", "Dr. Michael Brown"); 
    schedule2.put("date", "2023-12-01"); schedule2.put("time", "11:00 - 12:30"); schedule2.put("room", "Lab 205"); 
    schedule2.put("status", "Ongoing"); schedule2.put("students", "30");
    schedules.add(schedule2);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Schedules - Virtual Classroom Scheduler</title>
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
        
        .status-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .status-scheduled { background: #d1ecf1; color: #0c5460; }
        .status-ongoing { background: #d4edda; color: #155724; }
        .status-completed { background: #e2e3e5; color: #383d41; }
        .status-cancelled { background: #f8d7da; color: #721c24; }
        
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
        
        .btn-danger {
            background: var(--danger);
            color: white;
        }
        
        .btn-danger:hover {
            background: #c82333;
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
                <div class="logo-text">Virtual Classroom</div>
            </div>
            
            <ul class="nav-links">
                <li><a href="admin-dashboard.jsp"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                <li><a href="users.jsp"><i class="fas fa-users"></i><span>Manage Users</span></a></li>
                <li><a href="schedules.jsp" class="active"><i class="fas fa-calendar-alt"></i><span>Class Schedules</span></a></li>
                <li><a href="attendance.jsp"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="reports.jsp"><i class="fas fa-chart-bar"></i><span>Reports</span></a></li>
                <li><a href="settings.jsp"><i class="fas fa-cog"></i><span>Settings</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>Class Schedules</h1>
                <div class="user-info">
                    <div class="user-avatar">A</div>
                    <div>
                        <div style="font-weight: 600;">Admin User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Administrator</div>
                    </div>
                </div>
            </div>
            
            <div class="page-header">
                <h2>All Class Schedules</h2>
                <a href="add-schedule.jsp" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Add New Schedule
                </a>
            </div>
            
            <div class="search-filter">
                <div class="search-box">
                    <input type="text" class="form-control" placeholder="Search classes...">
                </div>
                <select class="form-control filter-select">
                    <option value="">All Status</option>
                    <option value="scheduled">Scheduled</option>
                    <option value="ongoing">Ongoing</option>
                    <option value="completed">Completed</option>
                    <option value="cancelled">Cancelled</option>
                </select>
                <input type="date" class="form-control filter-select">
            </div>
            
            <div class="table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Class Name</th>
                            <th>Teacher</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Room</th>
                            <th>Students</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, String> schedule : schedules) { %>
                        <tr>
                            <td><%= schedule.get("className") %></td>
                            <td><%= schedule.get("teacher") %></td>
                            <td><%= schedule.get("date") %></td>
                            <td><%= schedule.get("time") %></td>
                            <td><%= schedule.get("room") %></td>
                            <td><%= schedule.get("students") %></td>
                            <td>
                                <span class="status-badge status-<%= schedule.get("status").toLowerCase() %>">
                                    <%= schedule.get("status") %>
                                </span>
                            </td>
                            <td>
                                <a href="edit-schedule.jsp?id=<%= schedule.get("id") %>" class="btn btn-primary btn-sm">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="#" class="btn btn-danger btn-sm" onclick="confirmDelete(<%= schedule.get("id") %>)">
                                    <i class="fas fa-trash"></i> Delete
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
        function confirmDelete(scheduleId) {
            if (confirm('Are you sure you want to delete this schedule?')) {
                window.location.href = 'delete-schedule.jsp?id=' + scheduleId;
            }
        }
        
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.querySelector('.search-box input');
            const statusFilter = document.querySelector('.filter-select:nth-child(2)');
            const dateFilter = document.querySelector('.filter-select:nth-child(3)');
            const tableRows = document.querySelectorAll('.data-table tbody tr');
            
            function filterSchedules() {
                const searchTerm = searchInput.value.toLowerCase();
                const statusValue = statusFilter.value.toLowerCase();
                const dateValue = dateFilter.value;
                
                tableRows.forEach(row => {
                    const className = row.cells[0].textContent.toLowerCase();
                    const teacher = row.cells[1].textContent.toLowerCase();
                    const date = row.cells[2].textContent;
                    const status = row.cells[6].textContent.toLowerCase();
                    
                    const matchesSearch = className.includes(searchTerm) || teacher.includes(searchTerm);
                    const matchesStatus = !statusValue || status === statusValue;
                    const matchesDate = !dateValue || date === dateValue;
                    
                    row.style.display = (matchesSearch && matchesStatus && matchesDate) ? '' : 'none';
                });
            }
            
            searchInput.addEventListener('input', filterSchedules);
            statusFilter.addEventListener('change', filterSchedules);
            dateFilter.addEventListener('change', filterSchedules);
        });
    </script>
</body>
</html>