<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Schedule - Virtual Classroom Scheduler</title>
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
                <h1>Add New Class Schedule</h1>
                <a href="${pageContext.request.contextPath}/admin/schedules" class="btn btn-primary">
                    <i class="fas fa-arrow-left"></i> Back to Schedules
                </a>
            </div>
            
            <!-- Add Schedule Form -->
            <div class="form-container">
                <form method="post" action="${pageContext.request.contextPath}/admin/add-schedule">
                    <div class="form-group">
                        <label for="className">Class Name *</label>
                        <input type="text" id="className" name="className" class="form-control" required>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="teacher">Teacher *</label>
                            <select id="teacher" name="teacher" class="form-control" required>
                                <option value="">Select Teacher</option>
                                <option value="1">Dr. Sarah Smith</option>
                                <option value="2">Dr. Michael Brown</option>
                                <option value="3">Prof. Jennifer Wilson</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="subject">Subject *</label>
                            <input type="text" id="subject" name="subject" class="form-control" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="date">Date *</label>
                            <input type="date" id="date" name="date" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="time">Time *</label>
                            <input type="time" id="time" name="time" class="form-control" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="duration">Duration (minutes) *</label>
                            <input type="number" id="duration" name="duration" class="form-control" min="30" max="180" value="60" required>
                        </div>
                        <div class="form-group">
                            <label for="room">Room *</label>
                            <input type="text" id="room" name="room" class="form-control" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="form-control" rows="4"></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="maxStudents">Maximum Students</label>
                        <input type="number" id="maxStudents" name="maxStudents" class="form-control" min="1" max="100" value="30">
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn btn-success" style="padding: 12px 30px;">
                            <i class="fas fa-save"></i> Create Schedule
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/schedules" class="btn btn-warning" style="padding: 12px 30px;">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Set minimum date to today
        document.addEventListener('DOMContentLoaded', function() {
            const dateInput = document.getElementById('date');
            const today = new Date().toISOString().split('T')[0];
            dateInput.min = today;
            
            // Auto-calculate end time based on duration
            const timeInput = document.getElementById('time');
            const durationInput = document.getElementById('duration');
            
            function updateEndTimePreview() {
                if (timeInput.value && durationInput.value) {
                    const [hours, minutes] = timeInput.value.split(':').map(Number);
                    const totalMinutes = hours * 60 + minutes + parseInt(durationInput.value);
                    const endHours = Math.floor(totalMinutes / 60) % 24;
                    const endMinutes = totalMinutes % 60;
                    const endTime = `${endHours.toString().padStart(2, '0')}:${endMinutes.toString().padStart(2, '0')}`;
                    
                    // Update a preview element if exists, or create one
                    let preview = document.getElementById('endTimePreview');
                    if (!preview) {
                        preview = document.createElement('div');
                        preview.id = 'endTimePreview';
                        preview.style.marginTop = '5px';
                        preview.style.color = '#6c757d';
                        preview.style.fontSize = '0.9rem';
                        durationInput.parentNode.appendChild(preview);
                    }
                    preview.textContent = `Ends at: ${endTime}`;
                }
            }
            
            timeInput.addEventListener('change', updateEndTimePreview);
            durationInput.addEventListener('input', updateEndTimePreview);
        });
    </script>
</body>
</html>