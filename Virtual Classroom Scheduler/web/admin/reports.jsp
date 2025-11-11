<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - Virtual Classroom Scheduler</title>
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
        
        .reports-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }
        
        .report-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary);
        }
        
        .report-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .report-icon {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 15px;
        }
        
        .report-card h3 {
            margin-bottom: 10px;
            color: var(--dark);
        }
        
        .report-card p {
            color: var(--gray);
            margin-bottom: 20px;
            line-height: 1.5;
        }
        
        .report-actions {
            display: flex;
            gap: 10px;
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
        
        .recent-reports {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .section-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .reports-list {
            list-style: none;
        }
        
        .report-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .report-item:last-child {
            border-bottom: none;
        }
        
        .report-info h4 {
            margin-bottom: 5px;
            color: var(--dark);
        }
        
        .report-meta {
            display: flex;
            gap: 15px;
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .report-date {
            font-weight: 600;
            color: var(--primary);
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
            
            .reports-grid {
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
                <li><a href="reports.jsp" class="active"><i class="fas fa-chart-bar"></i><span>Reports</span></a></li>
                <li><a href="settings.jsp"><i class="fas fa-cog"></i><span>Settings</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>Reports & Analytics</h1>
                <div class="user-info">
                    <div class="user-avatar">A</div>
                    <div>
                        <div style="font-weight: 600;">Admin User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Administrator</div>
                    </div>
                </div>
            </div>
            
            <div class="reports-grid">
                <div class="report-card">
                    <div class="report-icon">
                        <i class="fas fa-clipboard-check"></i>
                    </div>
                    <h3>Attendance Report</h3>
                    <p>Generate comprehensive attendance reports for classes, students, or specific time periods with detailed analytics.</p>
                    <div class="report-actions">
                        <a href="generate-attendance-report.jsp" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Generate
                        </a>
                        <a href="view-attendance-reports.jsp" class="btn btn-info">
                            <i class="fas fa-eye"></i> View All
                        </a>
                    </div>
                </div>
                
                <div class="report-card">
                    <div class="report-icon">
                        <i class="fas fa-chalkboard-teacher"></i>
                    </div>
                    <h3>Class Schedule Report</h3>
                    <p>View and export class schedules, room allocations, and teacher assignments for better resource planning.</p>
                    <div class="report-actions">
                        <a href="generate-schedule-report.jsp" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Generate
                        </a>
                        <a href="view-schedule-reports.jsp" class="btn btn-info">
                            <i class="fas fa-eye"></i> View All
                        </a>
                    </div>
                </div>
                
                <div class="report-card">
                    <div class="report-icon">
                        <i class="fas fa-user-graduate"></i>
                    </div>
                    <h3>Student Performance</h3>
                    <p>Track student performance, attendance patterns, and academic progress with visual analytics and insights.</p>
                    <div class="report-actions">
                        <a href="generate-student-report.jsp" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Generate
                        </a>
                        <a href="view-student-reports.jsp" class="btn btn-info">
                            <i class="fas fa-eye"></i> View All
                        </a>
                    </div>
                </div>
                
                <div class="report-card">
                    <div class="report-icon">
                        <i class="fas fa-chart-pie"></i>
                    </div>
                    <h3>Statistical Overview</h3>
                    <p>Get overall statistics including attendance rates, class utilization, and system usage metrics.</p>
                    <div class="report-actions">
                        <a href="generate-statistics-report.jsp" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Generate
                        </a>
                        <a href="view-statistics.jsp" class="btn btn-info">
                            <i class="fas fa-eye"></i> View All
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="recent-reports">
                <h2 class="section-title">
                    <i class="fas fa-history"></i>
                    Recently Generated Reports
                </h2>
                
                <ul class="reports-list">
                    <li class="report-item">
                        <div class="report-info">
                            <h4>Monthly Attendance Summary - November 2023</h4>
                            <div class="report-meta">
                                <span class="report-date">Generated: Dec 1, 2023</span>
                                <span>Type: Attendance Report</span>
                                <span>Format: PDF</span>
                            </div>
                        </div>
                        <div class="report-actions">
                            <a href="#" class="btn btn-success btn-sm">
                                <i class="fas fa-download"></i> Download
                            </a>
                        </div>
                    </li>
                    
                    <li class="report-item">
                        <div class="report-info">
                            <h4>Class Schedule - Fall Semester 2023</h4>
                            <div class="report-meta">
                                <span class="report-date">Generated: Nov 28, 2023</span>
                                <span>Type: Schedule Report</span>
                                <span>Format: Excel</span>
                            </div>
                        </div>
                        <div class="report-actions">
                            <a href="#" class="btn btn-success btn-sm">
                                <i class="fas fa-download"></i> Download
                            </a>
                        </div>
                    </li>
                    
                    <li class="report-item">
                        <div class="report-info">
                            <h4>Student Performance Analysis - Q3 2023</h4>
                            <div class="report-meta">
                                <span class="report-date">Generated: Nov 25, 2023</span>
                                <span>Type: Performance Report</span>
                                <span>Format: PDF</span>
                            </div>
                        </div>
                        <div class="report-actions">
                            <a href="#" class="btn btn-success btn-sm">
                                <i class="fas fa-download"></i> Download
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const reportCards = document.querySelectorAll('.report-card');
            reportCards.forEach((card, index) => {
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