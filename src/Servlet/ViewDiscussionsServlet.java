package Servlet;

import DBUtil.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewDiscussionsServlet")
public class ViewDiscussionsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        DBUtil db = DBUtil.getDB();
        List<User> list = db.queryUser(username);
        User user = list.get(0);
        if(user.getType().equals("beginner")||user.getType().equals("intermediate")){
            List<CourseTaken> courseList = db.queryCourse(username);
            List<Discussion> discussionList = db.queryMoreDiscussion(courseList);

            request.getSession().setAttribute("discussion", discussionList);
            request.getSession().setAttribute("user",user);
            request.getRequestDispatcher("ViewDiscussions.jsp").forward(request,response);//跳转
        }else{
            List<Discussion> discussionList = db.queryAllDiscussion();
            request.getSession().setAttribute("discussion", discussionList);
            request.getSession().setAttribute("user",user);
            request.getRequestDispatcher("ViewDiscussions.jsp").forward(request,response);//跳转

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
