package servlets;

import dao.AttendanceDAO;
import models.Attendance;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/attendance/view")
public class ViewAttendanceServlet extends HttpServlet {
    private AttendanceDAO attendanceDAO = new AttendanceDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        if ("student".equals(user.getRole())) {
            List<Attendance> list = attendanceDAO.getAttendanceByStudent(user.getId());
            request.setAttribute("attList", list);
            request.getRequestDispatcher("/student/viewAttendance.jsp").forward(request, response);
        } else {
            String sid = request.getParameter("scheduleId");
            if (sid != null) {
                int scheduleId = Integer.parseInt(sid);
                List<Attendance> list = attendanceDAO.getAttendanceBySchedule(scheduleId);
                request.setAttribute("attList", list);
                request.getRequestDispatcher("/teacher/attendance.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/teacher/dashboard");
            }
        }
    }
}
