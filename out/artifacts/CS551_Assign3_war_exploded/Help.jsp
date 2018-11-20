<%@ page import="DBUtil.CourseTaken" %>
<%@ page import="java.util.List" %>
<%@ page import="DBUtil.User" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 10/21/2017
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Help</title>
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

<div class="container " style="padding-top: 5em">
    <section>
        <h2>All users</h2>
        <ul>
            <li>
                login - use a valid set of username, password, type(instructor, beginner, intermediate, expert) to login.<br>
                * You are not allowed to create, modify or delete any account.<br>
                * You do not have the option of changing the password or user types (beginner, intermediate, expert, instructor).
            </li>
            <li>
                View profile - login -> click"ViewProfile" on navbar
            </li>
            <li>
                View courses - login -> click"ViewCourse" on navbar
            </li>
            <li>
                View a discussion - login -> click "view detail" for the course you want to view<br>
                Or you can also click "ViewDiscussion" on the navbar.
            </li>
            <li>Add an entry - login -> click "view detail" -> click"Topic" -> enter your content in the textarea
                -> click"submit"<br>
                * Only not terminated discussions can add entry.
            </li>

        </ul>
    </section>
    <section>
        <h2>
            Instructors
        </h2>
        <ul>
            <li>Create a discussion - login -> click "view detail" for the course you want to add the discussion
                -> type the topic at the bottom -> submit<br>
                * you can only create a discussion from a ViewCourse page
            </li>
            <li>Terminate a discussion - login -> click "view detail" for the course you want to terminate
            -> click"Terminate"<br>
            * No users will be able to add entry to this discussion if you terminated it.
            </li>
            <li>Delete an entry - login -> click "view detail" -> click"Topic" -> "delete"<br>
            * An instructor who is the creator of the discussion is the only person who can delete any entry of a
            discussion.
            </li>
            <li>
                An instructor can view any discussion.
            </li>

        </ul>
    </section>
    <section>
        <h2>
            Beginners
        </h2>
        <ul>
            <li>
                A beginner only has one course and they can only participate in the discussion for the course they registered.
            </li>
        </ul>
    </section>
    <section>
        <h2>
            Intermediate users
        </h2>
        <ul>
            <li>
                An intermediate user is allowed to participate in more than one discussion (search and view discussions
                as well as add text to the discussions - again text only but no image) but for only those courses in which
                the user has registered.
            </li>
        </ul>
    </section>
    <section>
        <h2>
            Expert users
        </h2>
        <ul>
            <li>
                Add an image to a discussion - Not done...
            </li>
            <li>
                An expert user is able to add text/image to a discussion associated with only the courses he/she
                registered in.
            </li>
            <li>
                An expert user is able to search and view the discussions for other courses.
            </li>
        </ul>
    </section>
</div>





</body>
</html>
