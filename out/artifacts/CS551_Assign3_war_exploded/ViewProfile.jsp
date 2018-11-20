<%@ page import="DBUtil.*" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 10/23/2017
  Time: 12:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>ViewProfile</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<%!
    User user;
    List<CourseTaken> courseList;
%>
<%
    user = (User) request.getSession().getAttribute("user");
    courseList = (List<CourseTaken>) request.getSession().getAttribute("courses");
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Course Discussion Groups</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse pull-right">
            <ul class="nav navbar-nav">
                <li><a href="SignOut.jsp">Sign Out</a></li>
                <li><a href="HelpServlet?username=<%=user.getUsername()%>">Help</a></li>
                <li><a href="ViewCourseServlet?username=<%=user.getUsername()%>">ViewCourse</a></li>
                <li><a href="ViewDiscussionsServlet?username=<%=user.getUsername()%>">ViewDiscussion</a></li>
                <li><a href="ViewProfileServlet?username=<%=user.getUsername()%>">ViewProfile</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container col-md-offset-5" style="padding-top: 10em">
    <section>
        <header><h3>Username: <%=user.getUsername()%></h3></header>
        <ul>
            <li><h4>Type: <%=user.getType()%></h4></li>
            <li><h4>Course:
                <ul>
                    <%
                        if(courseList.size()>0){
                            for(int i=0;i<courseList.size();i++){
                    %>
                    <li><%=courseList.get(i).getCourse()%></li>
                    <%

                            }
                        }
                    %>

                </ul>
            </h4></li>
        </ul>
    </section>

</div>

</body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
