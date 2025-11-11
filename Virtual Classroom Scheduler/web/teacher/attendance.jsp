<%@page import="java.util.*, models.Attendance" %>
<jsp:include page="../header.jsp" />
<h2>Mark Attendance</h2>
<% List<Attendance> attList = (List<Attendance>) request.getAttribute("attList"); %>
<form method="post" action="${pageContext.request.contextPath}/attendance/mark">
    <input type="hidden" name="scheduleId" value="${param.scheduleId}" />
    <label>Student ID: <input type="number" name="studentId" required></label>
    <label>Status:
      <select name="status">
        <option value="present">Present</option>
        <option value="absent">Absent</option>
      </select>
    </label>
    <button type="submit">Mark</button>
</form>

<h3>Existing Records</h3>
<ul>
<% if (attList!=null) for (Attendance a: attList) { %>
    <li>Student <%= a.getStudentId() %> - <%= a.getStatus() %> at <%= a.getMarkedAt() %></li>
<% } %>
</ul>
<jsp:include page="../footer.jsp" />
