package Servlet;

import DBUtil.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddDiscussionServlet")
public class AddDiscussionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        String creator = request.getParameter("creator");
        String coursename = request.getParameter("coursename");
        String topic = request.getParameter("topic");
        String valid = "true";
        DBUtil db = DBUtil.getDB();
        db.AddDiscussion(date,creator,coursename,topic,valid);
        List<User> userList = db.queryUser(creator);
        User user = userList.get(0);

        List<Discussion> list = db.queryDiscussion(coursename);
        request.getSession().setAttribute("discussion", list);
        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("ViewDiscussions.jsp").forward(request,response);//跳转

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
