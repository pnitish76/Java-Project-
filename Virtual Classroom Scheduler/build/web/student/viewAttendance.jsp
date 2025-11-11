<%@page import="java.util.*, models.Attendance" %>
<jsp:include page="../header.jsp" />
<h2>My Attendance</h2>
<ul>
<% List<Attendance> list = (List<Attendance>) request.getAttribute("attList");
   if (list!=null) for (Attendance a: list) { %>
     <li>Schedule ID: <%= a.getScheduleId() %> - <%= a.getStatus() %> on <%= a.getMarkedAt() %></li>
<% } %>
</ul>
<jsp:include page="../footer.jsp" />
