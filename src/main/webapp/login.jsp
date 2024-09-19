<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/devopsclass", "ranjit", "Sunday@2019");
        Statement st = con.createStatement();
    } catch (SQLException e) {
        // Handle the exception
        System.out.println("Error connecting to database: " + e.getMessage());
    }
    ResultSet rs;
    rs = st.executeQuery("select * from USER where username='" + userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userid", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
