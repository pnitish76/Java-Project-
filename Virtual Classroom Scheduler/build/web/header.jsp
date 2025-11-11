<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
%>
<div style="background:#eee;padding:10px;margin-bottom:10px;">
    <a href="${pageContext.request.contextPath}">Home</a>
    <% if (user != null) { %>
        | Welcome, <%= user.getFullName()!=null?user.getFullName():user.getUsername() %>
        | <a href="${pageContext.request.contextPath}/logout">Logout</a>
    <% } else { %>
        | <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
    <% } %>
</div>
