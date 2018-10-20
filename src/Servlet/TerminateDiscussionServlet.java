package Servlet;

import DBUtil.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TerminateDiscussionServlet")
public class TerminateDiscussionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int discussion = Integer.valueOf(request.getParameter("discussionId"));
        String coursename = request.getParameter("course");
        String username = request.getParameter("username");
        DBUtil db = DBUtil.getDB();
        db.UpdateValid(discussion);
        List<User> userList = db.queryUser(username);
        User user = userList.get(0);
        List<Discussion> list = db.queryDiscussion(coursename);
        request.getSession().setAttribute("discussion", list);
        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("ViewDiscussions.jsp").forward(request,response);//跳转

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
