package DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class DBUtil {

    private static final DBUtil db = new DBUtil();

    private DBUtil() {
        connect();
    }

    public static DBUtil getDB() {
        return db;
    }


    public static Connection connect() {
        Connection conn = null;

        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            conn =
                    DriverManager.getConnection("jdbc:mysql://localhost:3306/db_test1","root", "123456");

            // Do something with the Connection


        } catch (SQLException ex) {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return conn;

    }

    public static void closeConnection(Connection conn){
        // 判断conn是否为空
        if(conn != null){
            try {
                conn.close();	// 关闭数据库连接
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
//find a user by username when login
    public List<User> queryUser(String username) {
        List<User> res = new ArrayList<User>();
        Connection conn = connect();
        String sql = "select * from user where username = ? ";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, username);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Retrieve by column name
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setType(rs.getString("type"));
                res.add(user);
            }
        } catch (Exception e) {
        e.printStackTrace();
    }finally{
        // 关闭数据库连接
        closeConnection(conn);
    }
        return res;
    }

//find the courses for a certain user
    public List<CourseTaken> queryCourse(String username) {
        List<CourseTaken> res = new ArrayList<CourseTaken>();
        Connection conn = connect();
        String sql = "select * from coursetaken where username = ? ";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, username);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Retrieve by column name
                CourseTaken courseTaken = new CourseTaken();
                courseTaken.setCourse(rs.getString("course"));
                courseTaken.setUsername(rs.getString("username"));
                courseTaken.setTime(rs.getString("time"));
                courseTaken.setRoom(rs.getString("room"));
                courseTaken.setInstructor(rs.getString("instructor"));
                res.add(courseTaken);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
        return res;
    }


    //find all the discussion for a certain course
    public List<Discussion> queryDiscussion(String coursename) {
        List<Discussion> res = new ArrayList<Discussion>();
        Connection conn = connect();
        String sql = "select * from discussion where coursename = ? ";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, coursename);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Retrieve by column name
                Discussion discussion = new Discussion();
                discussion.setId(Integer.valueOf(rs.getString("discussionid")));
                discussion.setDate(rs.getString("date"));
                discussion.setCreator(rs.getString("creator"));
                discussion.setCoursename(rs.getString("coursename"));
                discussion.setTopic(rs.getString("topic"));
                discussion.setValid(rs.getString("valid"));
                res.add(discussion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
        return res;
    }

    //find all the discussion for a certain course
    public List<Discussion> queryMoreDiscussion(List<CourseTaken> courseList) {
        List<Discussion> res = new ArrayList<Discussion>();
        Connection conn = connect();
        try {
            for(int i=0; i<courseList.size(); i++){
                String sql = "select * from discussion where coursename = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1,courseList.get(i).getCourse());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    // Retrieve by column name
                    Discussion discussion = new Discussion();
                    discussion.setId(Integer.valueOf(rs.getString("discussionid")));
                    discussion.setDate(rs.getString("date"));
                    discussion.setCreator(rs.getString("creator"));
                    discussion.setCoursename(rs.getString("coursename"));
                    discussion.setTopic(rs.getString("topic"));
                    discussion.setValid(rs.getString("valid"));
                    res.add(discussion);
                }
            }
            // 执行查询获取结果集

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
        return res;
    }

    public List<Discussion> queryAllDiscussion() {
        List<Discussion> res = new ArrayList<Discussion>();
        Connection conn = connect();
        String sql = "select * from discussion";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Retrieve by column name
                Discussion discussion = new Discussion();
                discussion.setId(Integer.valueOf(rs.getString("discussionid")));
                discussion.setDate(rs.getString("date"));
                discussion.setCreator(rs.getString("creator"));
                discussion.setCoursename(rs.getString("coursename"));
                discussion.setTopic(rs.getString("topic"));
                discussion.setValid(rs.getString("valid"));
                res.add(discussion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
        return res;
    }



    //find all the discussion for a certain course
    public List<Entry> queryEntry(int discussion) {
        List<Entry> res = new ArrayList<Entry>();
        Connection conn = connect();
        String sql = "select * from entry where discussion = ? ";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, discussion);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Retrieve by column name
                Entry entry = new Entry();
                entry.setEntryId(Integer.valueOf(rs.getString("entryid")));
                entry.setDiscussion(Integer.valueOf(rs.getString("discussion")));
                entry.setUser(rs.getString("user"));
                entry.setContent(rs.getString("content"));
                entry.setImg(rs.getString("img"));
                entry.setDate(rs.getString("date"));
                res.add(entry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
        return res;
    }

    //find the number of students for a certain course
    public int queryStudentNum(String coursename) {
        int res=0;
        Connection conn = connect();
        String sql = "select count(username) as num from coursetaken where course = ? ";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, coursename);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Retrieve by column name
                res = rs.getInt("num");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
        return res;
    }

    //terminate a discussion
    public void UpdateValid(int discussion) {
        Connection conn = connect();
        String sql = "UPDATE discussion set valid = 'false' where discussionid = ? ";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, discussion);
            // 执行查询获取结果集
            int rs = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
    }


    //add a entry in the ViewEntry.jsp
    public void AddEntry(int discussion,String username,String content,String date){
        // 获取数据库连接Connection对象
        Connection conn = connect();
        // 插入用户注册信息的SQL语句
        String sql = "insert into entry(discussion,user,content,date) values(?,?,?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,discussion);
            ps.setString(2, username);
            ps.setString(3, content);
            ps.setString(4, date);

            // 执行更新操作
            ps.executeUpdate();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
    }


    //add a discussion in the ViewDiscussions.jsp
    public void AddDiscussion(String date,String creator,String coursename,String topic,String valid){
        // 获取数据库连接Connection对象
        Connection conn = connect();
        // 插入用户注册信息的SQL语句
        String sql = "insert into discussion(date,creator,coursename,topic,valid) values(?,?,?,?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, date);
            ps.setString(2, creator);
            ps.setString(3, coursename);
            ps.setString(4, topic);
            ps.setString(5, valid);

            // 执行更新操作
            ps.executeUpdate();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
    }

    //delete an entry
    public void deleteEntry(String date, String username) {
        Connection conn = connect();
        String sql = "DELETE from entry where date = ? and user = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1,date);
            ps.setString(2,username);
            // 执行查询获取结果集
            int rs = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            closeConnection(conn);
        }
    }


    public static void main(String[] args) {
        DBUtil db = DBUtil.getDB();
        Date dNow = new Date( );
        SimpleDateFormat ft =
                new SimpleDateFormat("MMM dd, yyyy hh:mm:ss a",Locale.ENGLISH);
        String date = ft.format(dNow);
        db.UpdateValid(3);
//        CourseTaken CourseTaken = list.get(0);
//        System.out.println("usrname:"+ CourseTaken.getUsername()+", password:" + CourseTaken.getRoom());

    }









}
