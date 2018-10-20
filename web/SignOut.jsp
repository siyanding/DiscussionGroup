<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 10/21/2017
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SignOut</title>
</head>
<body>
<%
    request.getSession().setAttribute("username", null);
    request.getSession().invalidate();
    request.getRequestDispatcher("SignIn.jsp").forward(request, response);
%>

</body>
</html>
