<%@page import="java.util.*" %>
<%
    // Sample user data - replace with actual data from your database
    List<Map<String, String>> users = new ArrayList<>();
    Map<String, String> user1 = new HashMap<>();
    user1.put("id", "1");
    user1.put("name", "John Doe");
    user1.put("email", "john.doe@university.edu");
    user1.put("role", "Student");
    user1.put("status", "Active");
    users.add(user1);
    
    Map<String, String> user2 = new HashMap<>();
    user2.put("id", "2");
    user2.put("name", "Dr. Sarah Smith");
    user2.put("email", "sarah.smith@university.edu");
    user2.put("role", "Teacher");
    user2.put("status", "Active");
    users.add(user2);
    
    Map<String, String> user3 = new HashMap<>();
    user3.put("id", "3");
    user3.put("name", "Robert Johnson");
    user3.put("email", "robert.j@university.edu");
    user3.put("role", "Student");
    user3.put("status", "Inactive");
    users.add(user3);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Virtual Classroom Scheduler</title>
    <style>
        /* Include all CSS from admin-dashboard.jsp */
        /* Add specific styles for users page */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .status-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .status-active {
            background: #d4edda;
            color: #155724;
        }
        
        .status-inactive {
            background: #f8d7da;
            color: #721c24;
        }
        
        .status-pending {
            background: #fff3cd;
            color: #856404;
        }
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
                <div class="logo-text">CVirtual Classroom</div>
            </div>
            
            <ul class="nav-links">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/users" class="active">
                        <i class="fas fa-users"></i>
                        <span>Manage Users</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/schedules">
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
                <h1>Manage Users</h1>
                <a href="${pageContext.request.contextPath}/admin/add-user" class="btn btn-primary">
                    <i class="fas fa-user-plus"></i> Add New User
                </a>
            </div>
            
            <!-- Search and Filter -->
            <div class="search-filter">
                <div class="search-box">
                    <input type="text" class="form-control" placeholder="Search users...">
                </div>
                <select class="form-control filter-select">
                    <option value="">All Roles</option>
                    <option value="student">Student</option>
                    <option value="teacher">Teacher</option>
                    <option value="admin">Admin</option>
                </select>
                <select class="form-control filter-select">
                    <option value="">All Status</option>
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>
            </div>
            
            <!-- Users Table -->
            <div class="table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, String> user : users) { %>
                        <tr>
                            <td><%= user.get("id") %></td>
                            <td><%= user.get("name") %></td>
                            <td><%= user.get("email") %></td>
                            <td><%= user.get("role") %></td>
                            <td>
                                <span class="status-badge <%= "status-" + user.get("status").toLowerCase() %>">
                                    <%= user.get("status") %>
                                </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/edit-user?id=<%= user.get("id") %>" class="btn btn-primary btn-sm">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="${pageContext.request.contextPath}/admin/delete-user?id=<%= user.get("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this user?')">
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
        // Search functionality
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.querySelector('.search-box input');
            const roleFilter = document.querySelector('.filter-select:nth-child(2)');
            const statusFilter = document.querySelector('.filter-select:nth-child(3)');
            const tableRows = document.querySelectorAll('.data-table tbody tr');
            
            function filterUsers() {
                const searchTerm = searchInput.value.toLowerCase();
                const roleValue = roleFilter.value.toLowerCase();
                const statusValue = statusFilter.value.toLowerCase();
                
                tableRows.forEach(row => {
                    const name = row.cells[1].textContent.toLowerCase();
                    const email = row.cells[2].textContent.toLowerCase();
                    const role = row.cells[3].textContent.toLowerCase();
                    const status = row.cells[4].textContent.toLowerCase();
                    
                    const matchesSearch = name.includes(searchTerm) || email.includes(searchTerm);
                    const matchesRole = !roleValue || role === roleValue;
                    const matchesStatus = !statusValue || status === statusValue;
                    
                    row.style.display = (matchesSearch && matchesRole && matchesStatus) ? '' : 'none';
                });
            }
            
            searchInput.addEventListener('input', filterUsers);
            roleFilter.addEventListener('change', filterUsers);
            statusFilter.addEventListener('change', filterUsers);
        });
    </script>
</body>
</html>