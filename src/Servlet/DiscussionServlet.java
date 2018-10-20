package Servlet;

import DBUtil.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DiscussionServlet",urlPatterns={"/DiscussionServlet"})
public class DiscussionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int discussion = Integer.valueOf(request.getParameter("discussionId"));
        String valid = request.getParameter("valid");
        String username = request.getParameter("username");
        System.out.println("DiscussionServletUsername:"+username);
        DBUtil db = DBUtil.getDB();
        List<Entry> list = db.queryEntry(discussion);
        List<User> userList = db.queryUser(username);
        System.out.println("DiscussionServletUserList:"+userList.size());
        User user= userList.get(0);
        request.getSession().setAttribute("entry", list);
        request.getSession().setAttribute("discussion",discussion);
        request.getSession().setAttribute("valid",valid);
        request.getSession().setAttribute("username",username);
        request.getSession().setAttribute("user",user);
        request.getRequestDispatcher("ViewEntry.jsp").forward(request,response);//跳转

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
