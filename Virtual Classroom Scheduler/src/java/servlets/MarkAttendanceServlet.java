package servlets;

import dao.AttendanceDAO;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/attendance/mark")
public class MarkAttendanceServlet extends HttpServlet {
    private AttendanceDAO attendanceDAO = new AttendanceDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String status = request.getParameter("status");

        User user = (User) request.getSession().getAttribute("user");
        int markedBy = user != null ? user.getId() : 0;

        attendanceDAO.markAttendance(scheduleId, studentId, status, markedBy);
        response.sendRedirect(request.getContextPath() + "/teacher/dashboard");
    }
}
