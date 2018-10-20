<%@ page import="DBUtil.Entry" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DBUtil.User" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 10/20/2017
  Time: 12:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<%! List<Entry> entryList = new ArrayList<Entry>();
    String date = "";
    String valid;
    int discussion;
    String username;
    User user;

%>
<% entryList = (List<Entry>)request.getSession().getAttribute("entry");
    valid = (String) request.getSession().getAttribute("valid");
    discussion = (int) request.getSession().getAttribute("discussion");
    username = (String) request.getSession().getAttribute("username");
    user = (User) request.getSession().getAttribute("user");
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

<div class="container" style="padding-top: 5em">
    <%
        if(entryList.size()>0){
            for(int i=0;i<entryList.size(); i++){
                Entry entry = entryList.get(i);
//                        <a class="pull-left" href="#">
//                <img class="media-object" src="http://placekitten.com/150/150">
//            </a>
    %>
    <div class="well">
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object discussionId" src="img/1.png">
            </a>
            <div class="media-body">
                <h4 class="media-heading">Entry added by <%=entry.getUser()%> on <%=entry.getDate()%></h4>
                <p><%=entry.getContent()%></p>
                <%
                    if (user.getType().equals("instructor")){
                %>
                <p><a class="btn btn-default" href="DeleteEntryServlet?date=<%=entry.getDate()%>&entryUser=<%=entry.getUser()%>&username=<%=user.getUsername()%>&discussionId=<%=entry.getDiscussion()%>&valid=<%=valid%>" role="button">Delete</a></p>
                <%
                    }//if
                %>
            </div>
        </div>
    </div>

    <%
            }//for
        } else {//da if
    %>
    <div class="well">
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object" src="img/1.png">
            </a>
            <div class="media-body">
                <h4 class="media-heading">No entry for this discussion.</h4>

            </div>
        </div>
    </div>
    <%

            }
    %>
    <%
        if (valid.equals("true")){
            Date dNow = new Date( );
            SimpleDateFormat ft =
                    new SimpleDateFormat("MMM dd, yyyy hh:mm:ss a",Locale.ENGLISH);
            date = ft.format(dNow);
    %>
    <form action="AddEntryServlet" method="post">
        <div class="container">
            Add an entry:
            <textarea cols="150" rows="5" name="content"></textarea><br>
            <input type="hidden" name="date" value="<%=date%>">
            <input type="hidden" name="username" value="<%=username%>">
            <input type="hidden" name="discussion" value="<%=discussion%>">
            <input type="submit" value="submit">
        </div>
    </form>
    <%
        }

    %>

</div>
</body>
</html>
