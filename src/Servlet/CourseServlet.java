package Servlet;
import DBUtil.*;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CourseServlet", urlPatterns={"/CourseServlet"})
public class CourseServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String course = request.getParameter("course");
        String username = request.getParameter("username");
        DBUtil db = DBUtil.getDB();
        List<Discussion> list = db.queryDiscussion(course);
        List<User> userList = db.queryUser(username);
        User user = userList.get(0);

        request.getSession().setAttribute("discussion", list);
        request.getSession().setAttribute("course", course);
        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("ViewDiscussions.jsp").forward(request,response);//跳转
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
