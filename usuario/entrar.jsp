<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1" import="java.sql.*" %>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
            
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/base_dados","root","");
    
        String user = request.getParameter("user");
        String password = request.getParameter("password");

        String sql = "SELECT nome, admin FROM usuario WHERE nome = ? and senha = ?;";

        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, user);
        stmt.setString(2, password);

        ResultSet usuario = stmt.executeQuery();
        usuario.next();

        session.setAttribute("nome", usuario.getString("nome"));
        session.setAttribute("admin", usuario.getBoolean("admin"));

        stmt.close();
        con.close();

        response.sendRedirect("/");
    } catch(Exception e) {
        out.print("ERRO!" + e);
    }

%>