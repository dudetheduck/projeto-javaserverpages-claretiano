<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1" import="java.sql.*" %>

<%

    try {
        Class.forName("com.mysql.jdbc.Driver");
            
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/base_dados","root","");
    
        String user = request.getParameter("user");
        String password = request.getParameter("password");

        String sql = "INSERT INTO usuario (nome, senha) VALUES (?, ?);";

        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, user);
        stmt.setString(2, password);
        stmt.execute();
        stmt.close();

        session.setAttribute("nome", user);
        session.setAttribute("admin", false);
        
        con.close();
        response.sendRedirect("/");

    } catch(Exception e) {
        out.print("ERRO!" + e);
    }

%>