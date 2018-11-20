<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 10/15/2017
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>SignIn</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script language="javascript">
        function isValid(form)
        {

            if (form.username.value=="")
            {
                alert("Username can not be null");
                return false;
            }
            if (form.password.value=="")
            {
                alert("Password can not be null！");
                return false;
            }
            if (form.username.value.toString().length<6){
                console.log(form.username.value.toString().length);
                alert("Username has at least 6 characters！");
                return false;
            }
            if (form.password.value.toString().length<6){
                alert("Password has at least 6 characters！");
                return false;
            }

            return true;
        }



    </script>
        </head>
  <body>

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
    </div>
  </nav>

  <%!
    List<String> info;
  %>

  <form class="form-horizontal col-md-offset-3" style="padding-top: 10em" action="SignInServlet" method="post" onSubmit="return isValid(this);">
    <div class="form-group">
      <label for="username" class="col-sm-2 control-label" >Username</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="username" placeholder="Username" name="username">
      </div>
    </div>
    <div class="form-group">
      <label for="password" class="col-sm-2 control-label">Password</label>
      <div class="col-sm-6">
        <input type="password" class="form-control" id="password" placeholder="Password" name="password">
      </div>
    </div >
    <div class="form-group">
      <label for="type" class="col-sm-2 control-label">Type</label>
      <div class="col-sm-6">
        <select class="form-control " id="type" name="type">
          <option value="instructor" selected>Instructor</option>
          <option value="beginner">Beginner</option>
          <option value="intermediate">Intermediate user</option>
          <option value="expert">Expert user</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-4 col-sm-10">
        <button type="submit" class="btn btn-default">Sign in</button>
      </div>
    </div>
    <%
      info=(List<String>)request.getAttribute("info");
      if(info!=null){
        Iterator<String> iter=info.iterator();
        while(iter.hasNext()){
    %>
    <h4 class="col-md-offset-3" ><%=iter.next()%></h4>
    <%
        }
      }
    %>
  </form>
  </body>
  <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
