<%@ page import="DBUtil.Discussion" %>
<%@ page import="java.util.*" %>
<%@ page import="DBUtil.User" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 10/19/2017
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<%! List<Discussion> discussionList = new ArrayList<Discussion>();
    User user;
    String date = "";
    String course;
    String username = "";
%>
<% discussionList = (List<Discussion>)request.getSession().getAttribute("discussion");
    user = (User) request.getSession().getAttribute("user");
    course = (String) request.getSession().getAttribute("course");
    System.out.println("ViewDiscussions.jsp:"+course);
    username = (String) request.getSession().getAttribute("username");

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


<div class="row col-md-offset-3" style="padding-top: 7em">
    <div class="col-lg-6">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for...">
            <span class="input-group-btn">
        <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Creator <span class="caret"></span></button>
        <ul class="dropdown-menu dropdown-menu-right">
          <li><a href="#">Creator</a></li>
          <li><a href="#">Course Name</a></li>
          <li><a href="#">Topic</a></li>
          <li><a href="#">Date&Time</a></li>
        </ul>
      </div><!-- /btn-group -->
      </span>
        </div><!-- /input-group -->
    </div><!-- /.col-lg-6 -->
</div><!-- /.row -->


<div class="container" style="padding-top: 5em">

    <%
        if(discussionList.size()>0){
            for(int i=0;i<discussionList.size(); i++){
                Discussion discussion = discussionList.get(i);
//                        <a class="pull-left" href="#">
//                <img class="media-object" src="http://placekitten.com/150/150">
//            </a>
            %>
    <div class="well">
        <div class="media">
            <div class="media-body">
                <a href="DiscussionServlet?discussionId=<%=discussion.getId()%>&valid=<%=discussion.getValid()%>&username=<%=user.getUsername()%>"><h4 class="media-heading">Topic:<%=discussion.getTopic()%></h4></a>

                <p class="text-right">Created By <%=discussion.getCreator()%></p>
                <p>Course name: <%=discussion.getCoursename()%></p>
                <p>Created on: <%=discussion.getDate()%></p>
                <%
                    if(user.getType().equals("instructor")&&!discussion.getValid().equals("false")){
                %>
                <p><a class="btn btn-default" href="TerminateDiscussionServlet?discussionId=<%=discussion.getId()%>&course=<%=discussion.getCoursename()%>&username=<%=user.getUsername()%>" role="button">Terminate</a></p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <%
            }
        if (user.getType().equals("instructor")&&(course!=null)){
    %>
    <%
        Date dNow = new Date( );
        SimpleDateFormat ft =
                new SimpleDateFormat("MMM dd, yyyy hh:mm:ss a",Locale.ENGLISH);
        date = ft.format(dNow);
    %>
    <div class="well">
        <div class="media">

            <div class="media-body">
                <form action="AddDiscussionServlet" method="post">
                    <div class="container">
                        Create a discussion:<br>
                        <input type="hidden" name="date" value="<%=date%>">
                        <input type="hidden" name="creator" value="<%=user.getUsername()%>">
                        <input type="hidden" name="coursename" value="<%=course%>">
                        Topic: <input type="text" name="topic"><br>
                        <input type="submit" value="submit">
                    </div>
                </form>

            </div>
        </div>
    </div>
    <%
        }
        }else {
    %>
    <div class="well">
        <div class="media">

            <div class="media-body">
                <h4 class="media-heading">No discussions for this course.</h4>

            </div>
        </div>
    </div>
    <%
            if (user.getType().equals("instructor")&&!(course==null)){
    %>
    <%
        Date dNow = new Date( );
        SimpleDateFormat ft =
                new SimpleDateFormat("MMM dd, yyyy hh:mm:ss a",Locale.ENGLISH);
        date = ft.format(dNow);
    %>
    <div class="well">
        <div class="media">

            <div class="media-body">
                <form action="AddDiscussionServlet" method="post">
                    <div class="container">
                        Create a discussion:<br>
                        <input type="hidden" name="date" value="<%=date%>">
                        <input type="hidden" name="creator" value="<%=user.getUsername()%>">
                        <input type="hidden" name="coursename" value="<%=course%>">
                        Topic: <input type="text" name="topic">
                        <input type="submit" value="submit">
                    </div>
                </form>

            </div>
        </div>
    </div>
    <%
            }

        }

    %>



</div>
</body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>



