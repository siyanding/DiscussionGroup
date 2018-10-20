<%@ page import="java.util.List" %>
<%@ page import="DBUtil.CourseTaken" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DBUtil.*" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 10/19/2017
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>ViewCourse</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="offcanvas.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body style="background-color: rgb(238,238,238)">
<%! List<CourseTaken> courseList =new ArrayList<CourseTaken>();
    User user;

%>
<% courseList = (List<CourseTaken>)request.getSession().getAttribute("courses");
    user = (User)request.getSession().getAttribute("user");
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



<div class="container" >

    <div class="row">

        <div class="col-md-12" style="padding-top: 5em; ">
            <div class="row">
                <%
                    if(courseList.size()>0){

                        for(int i=0;i<courseList.size(); i++){
                            CourseTaken courseTaken = courseList.get(i);
                %>
                <div class="col-xs-6 col-lg-4" style="border: 2em">
                    <h2><%=courseTaken.getCourse()%></h2>
                    <p>Time:<%=courseTaken.getTime()%></p>
                    <p>Room:<%=courseTaken.getRoom()%></p>

                    <%
                        if(!user.getType().equals("instructor")){
                    %>
                    <p>Instructor:<%=courseTaken.getInstructor()%></p>
                    <%
                        }
                    %>
                    <p><a class="btn btn-default" href="CourseServlet?course=<%=courseTaken.getCourse()%>&username=<%=user.getUsername()%>" role="button">View details</a></p>
                </div><!--/.col-xs-6.col-lg-4-->
                <%
                        }
                    }else{
                %>
                <div class="col-xs-6 col-lg-4">
                    <h2>You don't have any classes.</h2>

                </div><!--/.col-xs-6.col-lg-4-->
                <%
                        }
                %>

            </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->
    </div><!--/row-->
</div><!--/.container-->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
<script src="offcanvas.js"></script>
</body>
</html>
