<%@page import="java.util.*, models.ClassSchedule" %>
<jsp:include page="../header.jsp" />
<h2>All Schedules</h2>
<ul>
<% List<ClassSchedule> list = (List<ClassSchedule>) request.getAttribute("schedules");
   if (list!=null) for (ClassSchedule s : list) { %>
     <li><b><%= s.getTitle() %></b> on <%= s.getClassDate() %> | Teacher: <%= s.getTeacherId() %>
         | <a href="${pageContext.request.contextPath}/attendance/view?scheduleId=<%= s.getId() %>">Attendance</a>
     </li>
<% } %>
</ul>
<jsp:include page="../footer.jsp" />
