package Servlet;

import DBUtil.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddEntryServlet")
public class AddEntryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("content");
        String username = request.getParameter("username");
        String date = request.getParameter("date");
        int discussion = Integer.valueOf(request.getParameter("discussion"));
        DBUtil db = DBUtil.getDB();
        db.AddEntry(discussion,username,content,date);
        List<Entry> list = db.queryEntry(discussion);
        List<User> userList = db.queryUser(username);
        User user = userList.get(0);
        request.getSession().setAttribute("user", user);

        request.getSession().setAttribute("entry", list);
        request.getSession().setAttribute("discussion",discussion);
        request.getRequestDispatcher("ViewEntry.jsp").forward(request,response);//跳转

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
