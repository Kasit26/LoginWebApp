<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/devopsclass", "ranjit", "Sunday@2019");
    Statement st = con.createStatement();
    } catch (SQLException e) {
        // Handle the exception
        System.out.println("Error connecting to database: " + e.getMessage());
    }
    int i = st.executeUpdate("insert into USER(first_name, last_name, email, username, password, regdate) values ('" + firstName + "','" + lastName + "','" + email + "','" + userName + "','" + password + "', CURDATE())");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
       
    } else {
        response.sendRedirect("index.jsp");
    }
%>
