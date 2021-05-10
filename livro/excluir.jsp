<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.UUID" %>

<%
    Boolean admin = (Boolean)session.getAttribute("admin");
    if (admin == null || admin == false) {
        response.sendRedirect("/");
    }

    Class.forName("com.mysql.jdbc.Driver");
        
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/base_dados","root","");

    String id = request.getParameter("id");

    String sql = "DELETE FROM livro WHERE id = ?;";

    PreparedStatement stmt = con.prepareStatement(sql);

    stmt.setString(1, id);
    stmt.execute();
    stmt.close();

    con.close();

    response.sendRedirect("/");
%>