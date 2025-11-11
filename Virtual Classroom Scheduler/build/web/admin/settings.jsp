<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings - Virtual Classroom Scheduler</title>
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
        
        .settings-container {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }
        
        .settings-sidebar {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            height: fit-content;
        }
        
        .settings-nav {
            list-style: none;
        }
        
        .settings-nav li {
            margin-bottom: 10px;
        }
        
        .settings-nav a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 15px;
            color: var(--dark);
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .settings-nav a:hover, .settings-nav a.active {
            background: var(--light);
            color: var(--primary);
        }
        
        .settings-nav i {
            width: 20px;
            text-align: center;
        }
        
        .settings-content {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .section-title {
            font-size: 1.5rem;
            margin-bottom: 25px;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
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
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        
        .form-text {
            color: var(--gray);
            font-size: 0.9rem;
            margin-top: 5px;
        }
        
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .btn-primary {
            background: var(--primary);
            color: white;
        }
        
        .btn-primary:hover {
            background: #5a0db5;
        }
        
        .btn-secondary {
            background: var(--light);
            color: var(--dark);
            border: 2px solid #e1e1e1;
        }
        
        .btn-secondary:hover {
            background: #e9ecef;
        }
        
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }
        
        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 34px;
        }
        
        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        
        input:checked + .slider {
            background-color: var(--primary);
        }
        
        input:checked + .slider:before {
            transform: translateX(26px);
        }
        
        .toggle-label {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 15px;
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
            
            .settings-container {
                grid-template-columns: 1fr;
            }
            
            .settings-sidebar {
                order: 2;
            }
            
            .settings-content {
                order: 1;
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
            
            .form-row {
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
                <li><a href="admin-dashboard.jsp"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                <li><a href="users.jsp"><i class="fas fa-users"></i><span>Manage Users</span></a></li>
                <li><a href="schedules.jsp"><i class="fas fa-calendar-alt"></i><span>Class Schedules</span></a></li>
                <li><a href="attendance.jsp"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="reports.jsp"><i class="fas fa-chart-bar"></i><span>Reports</span></a></li>
                <li><a href="settings.jsp" class="active"><i class="fas fa-cog"></i><span>Settings</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>System Settings</h1>
                <div class="user-info">
                    <div class="user-avatar">A</div>
                    <div>
                        <div style="font-weight: 600;">Admin User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Administrator</div>
                    </div>
                </div>
            </div>
            
            <div class="settings-container">
                <div class="settings-sidebar">
                    <ul class="settings-nav">
                        <li><a href="#general" class="active"><i class="fas fa-cog"></i>General Settings</a></li>
                        <li><a href="#notifications"><i class="fas fa-bell"></i>Notifications</a></li>
                        <li><a href="#security"><i class="fas fa-shield-alt"></i>Security</a></li>
                        <li><a href="#backup"><i class="fas fa-database"></i>Backup & Restore</a></li>
                        <li><a href="#integrations"><i class="fas fa-plug"></i>Integrations</a></li>
                        <li><a href="#appearance"><i class="fas fa-palette"></i>Appearance</a></li>
                    </ul>
                </div>
                
                <div class="settings-content">
                    <div id="general">
                        <h2 class="section-title"><i class="fas fa-cog"></i>General Settings</h2>
                        
                        <div class="form-group">
                            <label for="institutionName">Institution Name</label>
                            <input type="text" id="institutionName" class="form-control" value="University of Technology">
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="timezone">Timezone</label>
                                <select id="timezone" class="form-control">
                                    <option value="est">Eastern Standard Time (EST)</option>
                                    <option value="pst">Pacific Standard Time (PST)</option>
                                    <option value="cst">Central Standard Time (CST)</option>
                                    <option value="gmt">Greenwich Mean Time (GMT)</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="dateFormat">Date Format</label>
                                <select id="dateFormat" class="form-control">
                                    <option value="mm/dd/yyyy">MM/DD/YYYY</option>
                                    <option value="dd/mm/yyyy">DD/MM/YYYY</option>
                                    <option value="yyyy-mm-dd">YYYY-MM-DD</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="academicYear">Academic Year</label>
                            <select id="academicYear" class="form-control">
                                <option value="2023-2024">2023-2024</option>
                                <option value="2024-2025">2024-2025</option>
                                <option value="2025-2026">2025-2026</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="maxClassSize">Maximum Class Size</label>
                            <input type="number" id="maxClassSize" class="form-control" value="30" min="1" max="100">
                            <div class="form-text">Maximum number of students allowed per class</div>
                        </div>
                        
                        <button class="btn btn-primary">Save General Settings</button>
                    </div>
                    
                    <div id="notifications" style="display: none;">
                        <h2 class="section-title"><i class="fas fa-bell"></i>Notification Settings</h2>
                        
                        <div class="toggle-label">
                            <label>Email Notifications</label>
                            <label class="toggle-switch">
                                <input type="checkbox" checked>
                                <span class="slider"></span>
                            </label>
                        </div>
                        
                        <div class="toggle-label">
                            <label>Push Notifications</label>
                            <label class="toggle-switch">
                                <input type="checkbox" checked>
                                <span class="slider"></span>
                            </label>
                        </div>
                        
                        <div class="toggle-label">
                            <label>SMS Notifications</label>
                            <label class="toggle-switch">
                                <input type="checkbox">
                                <span class="slider"></span>
                            </label>
                        </div>
                        
                        <div class="form-group">
                            <label>Notification Types</label>
                            <div style="display: flex; flex-direction: column; gap: 10px; margin-top: 10px;">
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" checked> Class Schedule Changes
                                </label>
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" checked> Attendance Alerts
                                </label>
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" checked> System Updates
                                </label>
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox"> Assignment Deadlines
                                </label>
                            </div>
                        </div>
                        
                        <button class="btn btn-primary">Save Notification Settings</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const settingsLinks = document.querySelectorAll('.settings-nav a');
            const settingsSections = document.querySelectorAll('.settings-content > div');
            
            settingsLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    
                    const targetId = this.getAttribute('href').substring(1);
                    
                    settingsLinks.forEach(l => l.classList.remove('active'));
                    this.classList.add('active');
                    
                    settingsSections.forEach(section => {
                        section.style.display = 'none';
                    });
                    
                    document.getElementById(targetId).style.display = 'block';
                });
            });
        });
    </script>
</body>
</html>