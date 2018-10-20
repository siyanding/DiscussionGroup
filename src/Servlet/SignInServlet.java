package Servlet;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;


import DBUtil.*;


@WebServlet(name = "SignInServlet")
public class SignInServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        DBUtil db = DBUtil.getDB();
        List<User> list = db.queryUser(username);
        List<String> info=new ArrayList<String>();
        if(list.isEmpty()){
            info.add("Username doesn't exist ");
            request.setAttribute("info", info);//保存错误信息
            request.getRequestDispatcher("SignIn.jsp").forward(request,response);//跳转
        }else if (!list.get(0).getPassword().equals(password)){
            info.add("Password is wrong ");
            request.setAttribute("info", info);//保存错误信息
            request.getRequestDispatcher("SignIn.jsp").forward(request,response);//跳转
        }else if (!list.get(0).getType().equals(type)){
            info.add("Username doesn't match type ");
            request.setAttribute("info", info);//保存错误信息
            request.getRequestDispatcher("SignIn.jsp").forward(request,response);//跳转
        }else {
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setType(type);
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("type", type);
            List<CourseTaken> courseList = db.queryCourse(username);
            request.getSession().setAttribute("courses", courseList);
            // 转发到ViewCourse.jsp页面
            request.getRequestDispatcher("ViewCourse.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }
}

