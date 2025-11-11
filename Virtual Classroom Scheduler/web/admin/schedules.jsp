<%@page import="java.util.*" %>
<%
    // Sample schedule data
    List<Map<String, String>> schedules = new ArrayList<>();
    Map<String, String> schedule1 = new HashMap<>();
    schedule1.put("id", "1");
    schedule1.put("className", "Mathematics 101");
    schedule1.put("teacher", "Dr. Sarah Smith");
    schedule1.put("date", "2023-12-01");
    schedule1.put("time", "09:00 - 10:30");
    schedule1.put("room", "Room 101");
    schedule1.put("status", "Scheduled");
    schedules.add(schedule1);
    
    Map<String, String> schedule2 = new HashMap<>();
    schedule2.put("id", "2");
    schedule2.put("className", "Physics 201");
    schedule2.put("teacher", "Dr. Michael Brown");
    schedule2.put("date", "2023-12-01");
    schedule2.put("time", "11:00 - 12:30");
    schedule2.put("room", "Lab 205");
    schedule2.put("status", "Ongoing");
    schedules.add(schedule2);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Schedules - Virtual Classroom Scheduler</title>
    <style>
        /* Include all CSS from admin-dashboard.jsp */
        .status-scheduled { background: #d1ecf1; color: #0c5460; }
        .status-ongoing { background: #d4edda; color: #155724; }
        .status-completed { background: #e2e3e5; color: #383d41; }
        .status-cancelled { background: #f8d7da; color: #721c24; }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar (same as dashboard) -->
        <div class="sidebar">
            <div class="logo">
                <div class="logo-icon">
                    <i class="fas fa-chalkboard-teacher"></i>
                </div>
                <div class="logo-text">Virtual Classroom</div>
            </div>
            
            <ul class="nav-links">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/users">
                        <i class="fas fa-users"></i>
                        <span>Manage Users</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/schedules" class="active">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Class Schedules</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/attendance">
                        <i class="fas fa-clipboard-check"></i>
                        <span>Attendance</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/reports">
                        <i class="fas fa-chart-bar"></i>
                        <span>Reports</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/settings">
                        <i class="fas fa-cog"></i>
                        <span>Settings</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <div class="page-header">
                <h1>Class Schedules</h1>
                <a href="${pageContext.request.contextPath}/admin/add-schedule" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Add New Schedule
                </a>
            </div>
            
            <!-- Search and Filter -->
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
            
            <!-- Schedules Table -->
            <div class="table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Class Name</th>
                            <th>Teacher</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Room</th>
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
                            <td>
                                <span class="status-badge status-<%= schedule.get("status").toLowerCase() %>">
                                    <%= schedule.get("status") %>
                                </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/edit-schedule?id=<%= schedule.get("id") %>" class="btn btn-primary btn-sm">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="${pageContext.request.contextPath}/admin/delete-schedule?id=<%= schedule.get("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this schedule?')">
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
        // Search and filter functionality for schedules
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
                    const status = row.cells[5].textContent.toLowerCase();
                    
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