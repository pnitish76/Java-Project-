<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
    // Sample schedule data
    List<Map<String, String>> schedule = new ArrayList<>();
    
    Map<String, String> class1 = new HashMap<>();
    class1.put("id", "1");
    class1.put("course", "Mathematics 101");
    class1.put("code", "MATH101");
    class1.put("instructor", "Dr. Sarah Smith");
    class1.put("room", "Room 101");
    class1.put("day", "Monday");
    class1.put("startTime", "09:00");
    class1.put("endTime", "10:30");
    class1.put("type", "Lecture");
    class1.put("color", "#6a11cb");
    schedule.add(class1);
    
    Map<String, String> class2 = new HashMap<>();
    class2.put("id", "1");
    class2.put("course", "Mathematics 101");
    class2.put("code", "MATH101");
    class2.put("instructor", "Dr. Sarah Smith");
    class2.put("room", "Room 101");
    class2.put("day", "Wednesday");
    class2.put("startTime", "09:00");
    class2.put("endTime", "10:30");
    class2.put("type", "Lecture");
    class2.put("color", "#6a11cb");
    schedule.add(class2);
    
    Map<String, String> class3 = new HashMap<>();
    class3.put("id", "1");
    class3.put("course", "Mathematics 101");
    class3.put("code", "MATH101");
    class3.put("instructor", "Dr. Sarah Smith");
    class3.put("room", "Room 101");
    class3.put("day", "Friday");
    class3.put("startTime", "09:00");
    class3.put("endTime", "10:30");
    class3.put("type", "Lecture");
    class3.put("color", "#6a11cb");
    schedule.add(class3);
    
    Map<String, String> class4 = new HashMap<>();
    class4.put("id", "2");
    class4.put("course", "Physics 201");
    class4.put("code", "PHYS201");
    class4.put("instructor", "Dr. Michael Brown");
    class4.put("room", "Lab 205");
    class4.put("day", "Tuesday");
    class4.put("startTime", "11:00");
    class4.put("endTime", "12:30");
    class4.put("type", "Lab");
    class4.put("color", "#2575fc");
    schedule.add(class4);
    
    Map<String, String> class5 = new HashMap<>();
    class5.put("id", "2");
    class5.put("course", "Physics 201");
    class5.put("code", "PHYS201");
    class5.put("instructor", "Dr. Michael Brown");
    class5.put("room", "Room 205");
    class5.put("day", "Thursday");
    class5.put("startTime", "11:00");
    class5.put("endTime", "12:30");
    class5.put("type", "Lecture");
    class5.put("color", "#2575fc");
    schedule.add(class5);
    
    Map<String, String> class6 = new HashMap<>();
    class6.put("id", "3");
    class6.put("course", "Computer Science");
    class6.put("code", "CS101");
    class6.put("instructor", "Prof. Jennifer Wilson");
    class6.put("room", "Lab 301");
    class6.put("day", "Monday");
    class6.put("startTime", "14:00");
    class6.put("endTime", "15:30");
    class6.put("type", "Lab");
    class6.put("color", "#28a745");
    schedule.add(class6);
    
    Map<String, String> class7 = new HashMap<>();
    class7.put("id", "3");
    class7.put("course", "Computer Science");
    class7.put("code", "CS101");
    class7.put("instructor", "Prof. Jennifer Wilson");
    class7.put("room", "Lab 301");
    class7.put("day", "Wednesday");
    class7.put("startTime", "14:00");
    class7.put("endTime", "15:30");
    class7.put("type", "Lab");
    class7.put("color", "#28a745");
    schedule.add(class7);
    
    Map<String, String> class8 = new HashMap<>();
    class8.put("id", "4");
    class8.put("course", "English Literature");
    class8.put("code", "ENG202");
    class8.put("instructor", "Dr. Robert Johnson");
    class8.put("room", "Room 105");
    class8.put("day", "Tuesday");
    class8.put("startTime", "13:00");
    class8.put("endTime", "14:30");
    class8.put("type", "Lecture");
    class8.put("color", "#ffc107");
    schedule.add(class8);
    
    Map<String, String> class9 = new HashMap<>();
    class9.put("id", "4");
    class9.put("course", "English Literature");
    class9.put("code", "ENG202");
    class9.put("instructor", "Dr. Robert Johnson");
    class9.put("room", "Room 105");
    class9.put("day", "Thursday");
    class9.put("startTime", "13:00");
    class9.put("endTime", "14:30");
    class9.put("type", "Lecture");
    class9.put("color", "#ffc107");
    schedule.add(class9);
    
    // Get current date and time
    Calendar cal = Calendar.getInstance();
    String[] daysArray = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
    String currentDay = daysArray[cal.get(Calendar.DAY_OF_WEEK) - 1];
    int currentHour = cal.get(Calendar.HOUR_OF_DAY);
    int currentMinute = cal.get(Calendar.MINUTE);
    
    // Get view type (weekly or daily)
    String viewType = request.getParameter("view");
    if (viewType == null) {
        viewType = "weekly";
    }
    
    // Get selected day for daily view
    String selectedDay = request.getParameter("day");
    if (selectedDay == null) {
        selectedDay = currentDay;
    }
    
    // Time slots for the schedule
    String[] timeSlots = {"08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00"};
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule - Virtual Classroom Scheduler</title>
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
        
        .schedule-controls {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .view-toggle {
            display: flex;
            background: var(--light);
            border-radius: 10px;
            padding: 5px;
        }
        
        .view-btn {
            padding: 8px 20px;
            border: none;
            background: transparent;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .view-btn.active {
            background: var(--primary);
            color: white;
        }
        
        .date-navigation {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .current-date {
            font-weight: 600;
            color: var(--dark);
            min-width: 200px;
            text-align: center;
        }
        
        .nav-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 1px solid #ddd;
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .nav-btn:hover {
            background: var(--light);
        }
        
        .day-selector {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .day-btn {
            padding: 8px 15px;
            border: 1px solid #ddd;
            background: white;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        
        .day-btn.active {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }
        
        .day-btn.today {
            border-color: var(--primary);
            color: var(--primary);
        }
        
        .schedule-container {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        /* Weekly Schedule Styles */
        .weekly-schedule {
            width: 100%;
            border-collapse: collapse;
        }
        
        .weekly-schedule th {
            padding: 15px;
            background: var(--light);
            color: var(--gray);
            font-weight: 600;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        
        .weekly-schedule th:first-child {
            width: 80px;
        }
        
        .weekly-schedule td {
            padding: 10px;
            border-bottom: 1px solid #eee;
            vertical-align: top;
            height: 80px;
        }
        
        .weekly-schedule td:first-child {
            text-align: center;
            font-weight: 600;
            color: var(--gray);
            background: var(--light);
        }
        
        .time-slot {
            position: relative;
            height: 100%;
        }
        
        .class-event {
            position: absolute;
            left: 5px;
            right: 5px;
            border-radius: 8px;
            padding: 8px;
            color: white;
            font-size: 0.8rem;
            overflow: hidden;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .class-event:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }
        
        .class-event.current {
            box-shadow: 0 0 0 2px white, 0 0 0 4px var(--primary);
        }
        
        .event-title {
            font-weight: 600;
            margin-bottom: 2px;
        }
        
        .event-details {
            font-size: 0.7rem;
            opacity: 0.9;
        }
        
        /* Daily Schedule Styles */
        .daily-schedule {
            padding: 20px;
        }
        
        .daily-header {
            text-align: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .daily-header h3 {
            color: var(--dark);
            font-size: 1.5rem;
        }
        
        .daily-timeline {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        
        .time-row {
            display: flex;
            gap: 15px;
            align-items: flex-start;
        }
        
        .time-label {
            width: 80px;
            text-align: right;
            font-weight: 600;
            color: var(--gray);
            padding: 10px 0;
        }
        
        .time-slot-daily {
            flex: 1;
            min-height: 80px;
            border-left: 1px solid #eee;
            position: relative;
            padding-left: 15px;
        }
        
        .current-time-line {
            position: absolute;
            left: 0;
            right: 0;
            height: 2px;
            background: var(--danger);
            z-index: 10;
        }
        
        .current-time-line::before {
            content: '';
            position: absolute;
            left: -8px;
            top: -3px;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: var(--danger);
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
        
        .today-btn {
            background: var(--primary);
            color: white;
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
            
            .weekly-schedule {
                font-size: 0.8rem;
            }
            
            .class-event {
                font-size: 0.7rem;
                padding: 5px;
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
            
            .schedule-controls {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .date-navigation {
                width: 100%;
                justify-content: space-between;
            }
            
            .day-selector {
                width: 100%;
                justify-content: center;
            }
            
            .weekly-schedule th:first-child {
                width: 60px;
            }
            
            .weekly-schedule td:first-child {
                font-size: 0.8rem;
            }
        }
        
        @media (max-width: 576px) {
            .day-btn {
                padding: 6px 10px;
                font-size: 0.8rem;
            }
            
            .view-btn {
                padding: 6px 12px;
                font-size: 0.8rem;
            }
            
            .weekly-schedule {
                display: block;
                overflow-x: auto;
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
                <li><a href="attendance.jsp"><i class="fas fa-clipboard-check"></i><span>Attendance</span></a></li>
                <li><a href="assignments.jsp"><i class="fas fa-tasks"></i><span>Assignments</span></a></li>
                <li><a href="grades.jsp"><i class="fas fa-chart-line"></i><span>Grades</span></a></li>
                <li><a href="schedule.jsp" class="active"><i class="fas fa-calendar-alt"></i><span>Schedule</span></a></li>
                <li><a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <div class="header">
                <h1>Class Schedule</h1>
                <div class="user-info">
                    <div class="user-avatar">S</div>
                    <div>
                        <div style="font-weight: 600;">Student User</div>
                        <div style="font-size: 0.9rem; color: var(--gray);">Computer Science</div>
                    </div>
                </div>
            </div>
            
            <div class="page-header">
                <h2>My Weekly Schedule</h2>
                <div style="display: flex; gap: 10px;">
                    <button class="btn btn-primary" onclick="printSchedule()">
                        <i class="fas fa-print"></i> Print Schedule
                    </button>
                </div>
            </div>
            
            <div class="schedule-controls">
                <div class="view-toggle">
                    <button class="view-btn <%= "weekly".equals(viewType) ? "active" : "" %>" onclick="changeView('weekly')">
                        <i class="fas fa-calendar-week"></i> Weekly
                    </button>
                    <button class="view-btn <%= "daily".equals(viewType) ? "active" : "" %>" onclick="changeView('daily')">
                        <i class="fas fa-calendar-day"></i> Daily
                    </button>
                </div>
                
                <div class="date-navigation">
                    <button class="nav-btn" onclick="navigateWeek(-1)">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <div class="current-date" id="currentDate">
                        <%= new SimpleDateFormat("MMMM yyyy").format(new Date()) %>
                    </div>
                    <button class="nav-btn" onclick="navigateWeek(1)">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                    <button class="btn today-btn" onclick="goToToday()">
                        <i class="fas fa-calendar-day"></i> Today
                    </button>
                </div>
                
                <% if ("daily".equals(viewType)) { %>
                <div class="day-selector">
                    <% for (String day : daysArray) { %>
                        <button class="day-btn <%= day.equals(selectedDay) ? "active" : "" %> <%= day.equals(currentDay) ? "today" : "" %>" 
                                onclick="selectDay('<%= day %>')">
                            <%= day.substring(0, 3) %>
                        </button>
                    <% } %>
                </div>
                <% } %>
            </div>
            
            <div class="schedule-container">
                <% if ("weekly".equals(viewType)) { %>
                    <!-- Weekly Schedule View -->
                    <table class="weekly-schedule">
                        <thead>
                            <tr>
                                <th>Time</th>
                                <th>Monday</th>
                                <th>Tuesday</th>
                                <th>Wednesday</th>
                                <th>Thursday</th>
                                <th>Friday</th>
                                <th>Saturday</th>
                                <th>Sunday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (String timeSlot : timeSlots) { 
                                String[] timeParts = timeSlot.split(":");
                                int slotHour = Integer.parseInt(timeParts[0]);
                                int slotMinute = Integer.parseInt(timeParts[1]);
                            %>
                            <tr>
                                <td><%= timeSlot %></td>
                                <% for (String day : new String[]{"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}) { %>
                                <td>
                                    <div class="time-slot">
                                        <% 
                                            // Check if there's a class at this time slot
                                            for (Map<String, String> cls : schedule) {
                                                if (cls.get("day").equals(day)) {
                                                    String[] startParts = cls.get("startTime").split(":");
                                                    String[] endParts = cls.get("endTime").split(":");
                                                    int startHour = Integer.parseInt(startParts[0]);
                                                    int startMinute = Integer.parseInt(startParts[1]);
                                                    int endHour = Integer.parseInt(endParts[0]);
                                                    int endMinute = Integer.parseInt(endParts[1]);
                                                    
                                                    // Check if this time slot is within the class time
                                                    if (slotHour >= startHour && slotHour < endHour) {
                                                        // Calculate position and height
                                                        int startPosition = 0;
                                                        int duration = (endHour - startHour) * 60 + (endMinute - startMinute);
                                                        int heightPercent = (int) ((duration / 60.0) * 100);
                                                        
                                                        // Check if this is the current class
                                                        boolean isCurrent = day.equals(currentDay) && 
                                                                           currentHour >= startHour && currentHour < endHour;
                                        %>
                                        <div class="class-event <%= isCurrent ? "current" : "" %>" 
                                             style="top: <%= startPosition %>%; height: <%= heightPercent %>%; background: <%= cls.get("color") %>;"
                                             onclick="showClassDetails('<%= cls.get("id") %>')">
                                            <div class="event-title"><%= cls.get("code") %></div>
                                            <div class="event-details">
                                                <%= cls.get("course") %><br>
                                                <%= cls.get("room") %>
                                            </div>
                                        </div>
                                        <% 
                                                    }
                                                }
                                            }
                                        %>
                                    </div>
                                </td>
                                <% } %>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } else { %>
                    <!-- Daily Schedule View -->
                    <div class="daily-schedule">
                        <div class="daily-header">
                            <h3><%= selectedDay %>, <%= new SimpleDateFormat("MMMM d, yyyy").format(new Date()) %></h3>
                        </div>
                        
                        <div class="daily-timeline">
                            <% 
                                // Filter classes for selected day
                                List<Map<String, String>> dailyClasses = new ArrayList<>();
                                for (Map<String, String> cls : schedule) {
                                    if (cls.get("day").equals(selectedDay)) {
                                        dailyClasses.add(cls);
                                    }
                                }
                                
                                if (!dailyClasses.isEmpty()) {
                            %>
                                <% for (String timeSlot : timeSlots) { 
                                    String[] timeParts = timeSlot.split(":");
                                    int slotHour = Integer.parseInt(timeParts[0]);
                                    int slotMinute = Integer.parseInt(timeParts[1]);
                                %>
                                <div class="time-row">
                                    <div class="time-label"><%= timeSlot %></div>
                                    <div class="time-slot-daily">
                                        <% 
                                            // Check if current time matches this slot
                                            if (selectedDay.equals(currentDay) && currentHour == slotHour) {
                                        %>
                                        <div class="current-time-line" style="top: <%= (currentMinute / 60.0) * 100 %>%;"></div>
                                        <% } %>
                                        
                                        <% 
                                            // Check for classes at this time
                                            for (Map<String, String> cls : dailyClasses) {
                                                String[] startParts = cls.get("startTime").split(":");
                                                String[] endParts = cls.get("endTime").split(":");
                                                int startHour = Integer.parseInt(startParts[0]);
                                                int startMinute = Integer.parseInt(startParts[1]);
                                                int endHour = Integer.parseInt(endParts[0]);
                                                int endMinute = Integer.parseInt(endParts[1]);
                                                
                                                if (slotHour >= startHour && slotHour < endHour) {
                                                    // Check if this is the current class
                                                    boolean isCurrent = selectedDay.equals(currentDay) && 
                                                                       currentHour >= startHour && currentHour < endHour;
                                        %>
                                        <div class="class-event <%= isCurrent ? "current" : "" %>" 
                                             style="background: <%= cls.get("color") %>; margin-bottom: 5px; position: relative;"
                                             onclick="showClassDetails('<%= cls.get("id") %>')">
                                            <div class="event-title"><%= cls.get("course") %> (<%= cls.get("code") %>)</div>
                                            <div class="event-details">
                                                <i class="fas fa-clock"></i> <%= cls.get("startTime") %> - <%= cls.get("endTime") %><br>
                                                <i class="fas fa-map-marker-alt"></i> <%= cls.get("room") %><br>
                                                <i class="fas fa-user-tie"></i> <%= cls.get("instructor") %><br>
                                                <span class="event-type"><%= cls.get("type") %></span>
                                            </div>
                                        </div>
                                        <% 
                                                }
                                            }
                                        %>
                                    </div>
                                </div>
                                <% } %>
                            <% } else { %>
                                <div class="empty-state">
                                    <i class="fas fa-calendar-times"></i>
                                    <h3>No Classes Scheduled</h3>
                                    <p>You have no classes scheduled for <%= selectedDay %>.</p>
                                </div>
                            <% } %>
                        </div>
                    </div>
                <% } %>
            </div>
            
            <!-- Upcoming Classes Section -->
            <div style="margin-top: 30px;">
                <div class="schedule-container">
                    <div class="table-header" style="padding: 20px 25px; border-bottom: 1px solid #eee;">
                        <h3>Upcoming Classes This Week</h3>
                    </div>
                    <div style="padding: 20px;">
                        <% 
                            // Get upcoming classes (today and future)
                            List<Map<String, String>> upcomingClasses = new ArrayList<>();
                            int currentDayIndex = java.util.Arrays.asList(daysArray).indexOf(currentDay);
                            
                            for (Map<String, String> cls : schedule) {
                                int classDayIndex = java.util.Arrays.asList(daysArray).indexOf(cls.get("day"));
                                if (classDayIndex >= currentDayIndex) {
                                    upcomingClasses.add(cls);
                                }
                            }
                            
                            // Sort by day and time
                            Collections.sort(upcomingClasses, new Comparator<Map<String, String>>() {
                                public int compare(Map<String, String> c1, Map<String, String> c2) {
                                    int dayCompare = Integer.compare(
                                        java.util.Arrays.asList(daysArray).indexOf(c1.get("day")),
                                        java.util.Arrays.asList(daysArray).indexOf(c2.get("day"))
                                    );
                                    if (dayCompare != 0) return dayCompare;
                                    return c1.get("startTime").compareTo(c2.get("startTime"));
                                }
                            });
                            
                            if (!upcomingClasses.isEmpty()) {
                        %>
                        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 15px;">
                            <% for (Map<String, String> cls : upcomingClasses) { 
                                boolean isToday = cls.get("day").equals(currentDay);
                            %>
                            <div class="class-event" style="background: <%= cls.get("color") %>; padding: 15px; border-radius: 10px; color: white; margin-bottom: 0;">
                                <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 10px;">
                                    <div class="event-title" style="font-size: 1rem;"><%= cls.get("course") %></div>
                                    <span style="background: rgba(255,255,255,0.2); padding: 4px 8px; border-radius: 12px; font-size: 0.8rem;">
                                        <%= cls.get("type") %>
                                    </span>
                                </div>
                                <div class="event-details">
                                    <div><i class="fas fa-calendar-day"></i> <%= cls.get("day") %> | <%= cls.get("startTime") %> - <%= cls.get("endTime") %></div>
                                    <div><i class="fas fa-map-marker-alt"></i> <%= cls.get("room") %></div>
                                    <div><i class="fas fa-user-tie"></i> <%= cls.get("instructor") %></div>
                                </div>
                                <% if (isToday) { %>
                                <div style="margin-top: 10px; text-align: center;">
                                    <span style="background: rgba(255,255,255,0.3); padding: 4px 10px; border-radius: 12px; font-size: 0.8rem;">
                                        <i class="fas fa-clock"></i> Happening Today
                                    </span>
                                </div>
                                <% } %>
                            </div>
                            <% } %>
                        </div>
                        <% } else { %>
                        <div class="empty-state" style="padding: 30px 20px;">
                            <i class="fas fa-calendar-check"></i>
                            <h3>No Upcoming Classes</h3>
                            <p>You have no more classes scheduled for this week.</p>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function changeView(viewType) {
            const url = new URL(window.location.href);
            url.searchParams.set('view', viewType);
            window.location.href = url.toString();
        }
        
        function selectDay(day) {
            const url = new URL(window.location.href);
            url.searchParams.set('day', day);
            url.searchParams.set('view', 'daily');
            window.location.href = url.toString();
        }
        
        function navigateWeek(direction) {
            // In a real application, this would navigate to previous/next week
            alert('Week navigation would go here in a full implementation');
        }
        
        function goToToday() {
            const url = new URL(window.location.href);
            url.searchParams.set('view', 'weekly');
            url.searchParams.delete('day');
            window.location.href = url.toString();
        }
        
        function showClassDetails(classId) {
            alert('Class details for ID: ' + classId + ' would be shown here');
            // In a real application, this would open a modal or navigate to class details
        }
        
        function printSchedule() {
            window.print();
        }
        
        document.addEventListener('DOMContentLoaded', function() {
            // Add animation to class events
            const classEvents = document.querySelectorAll('.class-event');
            classEvents.forEach((event, index) => {
                event.style.opacity = '0';
                event.style.transform = 'scale(0.9)';
                setTimeout(() => {
                    event.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    event.style.opacity = '1';
                    event.style.transform = 'scale(1)';
                }, index * 100);
            });
        });
    </script>
</body>
</html>