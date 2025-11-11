package servlets;

import dao.ScheduleDAO;
import models.ClassSchedule;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

@WebServlet("/admin/add-schedule")
public class AddScheduleServlet extends HttpServlet {
    private ScheduleDAO scheduleDAO = new ScheduleDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/addClass.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int teacherId = Integer.parseInt(request.getParameter("teacherId"));
            Date classDate = Date.valueOf(request.getParameter("classDate"));
            Time start = Time.valueOf(request.getParameter("startTime"));
            Time end = Time.valueOf(request.getParameter("endTime"));

            ClassSchedule s = new ClassSchedule();
            s.setTitle(title); s.setDescription(description); s.setTeacherId(teacherId);
            s.setClassDate(classDate); s.setStartTime(start); s.setEndTime(end);

            boolean ok = scheduleDAO.addSchedule(s);
            if (ok) response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            else {
                request.setAttribute("error", "Could not add schedule");
                request.getRequestDispatcher("/admin/addClass.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input");
            request.getRequestDispatcher("/admin/addClass.jsp").forward(request, response);
        }
    }
}
