<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Schedule - Virtual Classroom Scheduler</title>
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
        
        .form-container {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            max-width: 800px;
            margin: 0 auto;
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
        
        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
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
            
            .form-row {
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
            
            .form-actions {
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
                <h1>Add Class Schedule</h1>
                <div class="user-info">
                    <div class="user-avatar">A</div>
                    <div>
                        <div style="font-weight: 600;">Admin User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Administrator</div>
                    </div>
                </div>
            </div>
            
            <div class="page-header">
                <h2>Create New Schedule</h2>
                <a href="schedules.jsp" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to Schedules
                </a>
            </div>
            
            <div class="form-container">
                <form method="post" action="${pageContext.request.contextPath}/admin/add-schedule">
                    <div class="form-group">
                        <label for="className">Class Name *</label>
                        <input type="text" id="className" name="className" class="form-control" required placeholder="e.g., Mathematics 101">
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="teacher">Teacher *</label>
                            <select id="teacher" name="teacher" class="form-control" required>
                                <option value="">Select Teacher</option>
                                <option value="1">Dr. Sarah Smith</option>
                                <option value="2">Dr. Michael Brown</option>
                                <option value="3">Prof. Jennifer Wilson</option>
                                <option value="4">Dr. Robert Johnson</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="subject">Subject *</label>
                            <input type="text" id="subject" name="subject" class="form-control" required placeholder="e.g., Advanced Calculus">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="date">Date *</label>
                            <input type="date" id="date" name="date" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="startTime">Start Time *</label>
                            <input type="time" id="startTime" name="startTime" class="form-control" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="duration">Duration (minutes) *</label>
                            <input type="number" id="duration" name="duration" class="form-control" min="30" max="180" value="60" required>
                            <div class="form-text" id="endTimePreview"></div>
                        </div>
                        <div class="form-group">
                            <label for="room">Room *</label>
                            <select id="room" name="room" class="form-control" required>
                                <option value="">Select Room</option>
                                <option value="room-101">Room 101</option>
                                <option value="room-102">Room 102</option>
                                <option value="room-201">Room 201</option>
                                <option value="lab-205">Lab 205</option>
                                <option value="lab-301">Lab 301</option>
                                <option value="auditorium">Auditorium</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="form-control" rows="4" placeholder="Class description, topics to be covered, etc."></textarea>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="maxStudents">Maximum Students</label>
                            <input type="number" id="maxStudents" name="maxStudents" class="form-control" min="1" max="100" value="30">
                        </div>
                        <div class="form-group">
                            <label for="recurring">Recurring Class</label>
                            <select id="recurring" name="recurring" class="form-control">
                                <option value="none">No Recurrence</option>
                                <option value="daily">Daily</option>
                                <option value="weekly">Weekly</option>
                                <option value="monthly">Monthly</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Additional Options</label>
                        <div style="display: flex; flex-direction: column; gap: 10px; margin-top: 10px;">
                            <label style="display: flex; align-items: center; gap: 10px;">
                                <input type="checkbox" name="attendanceRequired" checked> Attendance Tracking Required
                            </label>
                            <label style="display: flex; align-items: center; gap: 10px;">
                                <input type="checkbox" name="notifications"> Send Notifications to Students
                            </label>
                            <label style="display: flex; align-items: center; gap: 10px;">
                                <input type="checkbox" name="recording"> Record Class Session
                            </label>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Create Schedule
                        </button>
                        <a href="schedules.jsp" class="btn btn-secondary">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const dateInput = document.getElementById('date');
            const today = new Date().toISOString().split('T')[0];
            dateInput.min = today;
            
            const startTimeInput = document.getElementById('startTime');
            const durationInput = document.getElementById('duration');
            const endTimePreview = document.getElementById('endTimePreview');
            
            function updateEndTimePreview() {
                if (startTimeInput.value && durationInput.value) {
                    const [hours, minutes] = startTimeInput.value.split(':').map(Number);
                    const totalMinutes = hours * 60 + minutes + parseInt(durationInput.value);
                    const endHours = Math.floor(totalMinutes / 60) % 24;
                    const endMinutes = totalMinutes % 60;
                    const endTime = `${endHours.toString().padStart(2, '0')}:${endMinutes.toString().padStart(2, '0')}`;
                    
                    endTimePreview.textContent = `Ends at: ${endTime}`;
                    endTimePreview.style.color = 'var(--primary)';
                    endTimePreview.style.fontWeight = '600';
                } else {
                    endTimePreview.textContent = '';
                }
            }
            
            startTimeInput.addEventListener('change', updateEndTimePreview);
            durationInput.addEventListener('input', updateEndTimePreview);
            
            updateEndTimePreview();
        });
    </script>
</body>
</html>