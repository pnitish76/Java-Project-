<jsp:include page="../header.jsp" />
<h2>Add Class Schedule</h2>
<form method="post" action="${pageContext.request.contextPath}/admin/add-schedule">
    <label>Title: <input type="text" name="title" required></label><br>
    <label>Description: <textarea name="description"></textarea></label><br>
    <label>Teacher ID: <input type="number" name="teacherId" required></label><br>
    <label>Date: <input type="date" name="classDate" required></label><br>
    <label>Start Time: <input type="time" name="startTime" required></label><br>
    <label>End Time: <input type="time" name="endTime" required></label><br>
    <button type="submit">Add</button>
</form>
<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p style="color:red"><%= error %></p>
<%
    }
%>
<jsp:include page="../footer.jsp" />
