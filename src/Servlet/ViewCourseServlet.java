package Servlet;

import DBUtil.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewCourseServlet")
public class ViewCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        System.out.println("username:" + username);
        DBUtil db = DBUtil.getDB();
        List<User> list = db.queryUser(username);
        User user = list.get(0);
        request.getSession().setAttribute("user", user);
        request.getSession().setAttribute("type", user.getType());
        List<CourseTaken> courseList = db.queryCourse(username);
        request.getSession().setAttribute("courses", courseList);
        // 转发到ViewCourse.jsp页面
        request.getRequestDispatcher("ViewCourse.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
