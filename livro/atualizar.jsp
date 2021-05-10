<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.UUID" %>

<%
    Boolean admin = (Boolean)session.getAttribute("admin");
    if (admin == null || admin == false) {
        response.sendRedirect("/");
    }

    Class.forName("com.mysql.jdbc.Driver");
            
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/base_dados","root","");

    Integer id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : null;

    if (id == null) {
        response.sendRedirect("/");
    }

    String titulo = request.getParameter("titulo");
    String autor = request.getParameter("autor");
    Integer editora = request.getParameter("editora") != null ? Integer.parseInt(request.getParameter("editora")) : 1;
    Integer ano = request.getParameter("ano") != null ? Integer.parseInt(request.getParameter("ano")) : 2021;
    Float preco = request.getParameter("preco") != null ? Float.parseFloat(request.getParameter("preco")) : 0;
    String foto = request.getParameter("foto");

    String sql = "UPDATE livro SET titulo = ?, autor = ?, idEditora = ?, ano = ?, preco = ?, foto = ? WHERE id = ?;";

    PreparedStatement stmt = con.prepareStatement(sql);

    stmt.setString(1, titulo);
    stmt.setString(2, autor);
    stmt.setInt(3, editora);
    stmt.setInt(4, ano);
    stmt.setFloat(5, preco);
    stmt.setString(6, foto);
    stmt.setInt(7, id);
    stmt.execute();
    stmt.close();

    con.close();

    response.sendRedirect("/");
%>