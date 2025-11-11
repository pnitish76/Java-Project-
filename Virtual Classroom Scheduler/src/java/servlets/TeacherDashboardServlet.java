package servlets;

import dao.ScheduleDAO;
import models.ClassSchedule;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/teacher/dashboard")
public class TeacherDashboardServlet extends HttpServlet {
    private ScheduleDAO scheduleDAO = new ScheduleDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        User user = (User) session.getAttribute("user");
        List<ClassSchedule> schedules = scheduleDAO.getSchedulesByTeacher(user.getId());
        request.setAttribute("schedules", schedules);
        request.getRequestDispatcher("/teacher/teacherDashboard.jsp").forward(request, response);
    }
}
