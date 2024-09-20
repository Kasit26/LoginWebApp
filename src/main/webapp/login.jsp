<%@ page import="java.sql.*" %>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/devopsclass", "ranjit", "Sunday@2019");
        
        String sql = "SELECT * FROM USER WHERE username = ? AND password = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, userName);
        pst.setString(2, password);
        
        ResultSet rs = pst.executeQuery();
        
        if (rs.next()) {
            session.setAttribute("userid", userName);
            response.sendRedirect("success.jsp");
        } else {
            out.println("Invalid password <a href='index.jsp'>try again</a>");
        }
        
        rs.close();
        pst.close();
        con.close();
    } catch (ClassNotFoundException e) {
        out.println("JDBC Driver not found: " + e.getMessage());
    } catch (SQLException e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
