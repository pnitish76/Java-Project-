<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User - Virtual Classroom Scheduler</title>
    <style>
        /* Include all CSS from admin-dashboard.jsp */
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
                <h1>Add New User</h1>
                <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-primary">
                    <i class="fas fa-arrow-left"></i> Back to Users
                </a>
            </div>
            
            <!-- Add User Form -->
            <div class="form-container">
                <form method="post" action="${pageContext.request.contextPath}/admin/add-user">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="firstName">First Name *</label>
                            <input type="text" id="firstName" name="firstName" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name *</label>
                            <input type="text" id="lastName" name="lastName" class="form-control" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address *</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="role">User Role *</label>
                            <select id="role" name="role" class="form-control" required>
                                <option value="">Select Role</option>
                                <option value="student">Student</option>
                                <option value="teacher">Teacher</option>
                                <option value="admin">Administrator</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="status">Status *</label>
                            <select id="status" name="status" class="form-control" required>
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="password">Password *</label>
                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password *</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="department">Department</label>
                        <input type="text" id="department" name="department" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn btn-success" style="padding: 12px 30px;">
                            <i class="fas fa-save"></i> Create User
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-warning" style="padding: 12px 30px;">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Password confirmation validation
        document.addEventListener('DOMContentLoaded', function() {
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmPassword');
            const form = document.querySelector('form');
            
            function validatePassword() {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity("Passwords don't match");
                } else {
                    confirmPassword.setCustomValidity('');
                }
            }
            
            password.addEventListener('change', validatePassword);
            confirmPassword.addEventListener('keyup', validatePassword);
            
            form.addEventListener('submit', function(e) {
                validatePassword();
                if (!form.checkValidity()) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>