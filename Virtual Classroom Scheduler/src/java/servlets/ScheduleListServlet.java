package servlets;

import dao.ScheduleDAO;
import models.ClassSchedule;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/schedules")
public class ScheduleListServlet extends HttpServlet {
    private ScheduleDAO scheduleDAO = new ScheduleDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ClassSchedule> list = scheduleDAO.getAllSchedules();
        request.setAttribute("schedules", list);
        request.getRequestDispatcher("/teacher/scheduleList.jsp").forward(request, response);
    }
}
