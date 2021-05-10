<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>

<%
    try {
        Boolean admin = (Boolean)session.getAttribute("admin");
        if (admin == null || admin == false) {
            response.sendRedirect("/");
        }
        
        Class.forName("com.mysql.jdbc.Driver");
            
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/base_dados","root","");
    
        String nome = request.getParameter("nome");
        String cidade = request.getParameter("cidade");

        String sql = "INSERT INTO editora (nome, cidade) VALUES (?, ?);";

        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, nome);
        stmt.setString(2, cidade);
        stmt.execute();
        stmt.close();

        con.close();
        response.sendRedirect("/");

    } catch(Exception e) {
        out.print("ERRO!" + e);
    }
%>