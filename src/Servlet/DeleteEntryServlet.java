package Servlet;

import DBUtil.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteEntryServlet")
public class DeleteEntryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        System.out.println("DeleteEntryServletUsername:"+username);
        String entryUser = request.getParameter("entryUser");
        System.out.println("DeleteEntryServletEntryUser:"+entryUser);
        String date = request.getParameter("date");
        System.out.println("DeleteEntryServletDate:"+date);
        String valid = request.getParameter("valid");
        System.out.println("DeleteEntryServletValid:"+valid);
        int discussion = Integer.valueOf(request.getParameter("discussionId"));
        System.out.println("DeleteEntryServletDiscussion:"+discussion);
        DBUtil db = DBUtil.getDB();
        db.deleteEntry(date,entryUser);
        List<User> userList = db.queryUser(username);
        User user = userList.get(0);
        List<Entry> entryList = db.queryEntry(discussion);


        request.getSession().setAttribute("entry", entryList);
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
