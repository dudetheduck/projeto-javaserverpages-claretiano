<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar novo livro</title>
    <link rel="stylesheet" href="/style.css">
    <script src="https://kit.fontawesome.com/50a16afc25.js" crossorigin="anonymous"></script>
</head>
<body>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <%@ page language="java" import="java.sql.*" %>
    <%
    Boolean admin = (Boolean)session.getAttribute("admin");
    if (admin == null || admin == false) {
        response.sendRedirect("/");
    }

    Class.forName("com.mysql.jdbc.Driver");
        
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/base_dados","root","");

    PreparedStatement stmt = con.prepareStatement("SELECT * FROM editora;");

    ResultSet editora = stmt.executeQuery();
    %>

    <jsp:include page="/componentes/Header.jsp"/> 

    <form class="form" action="salvar.jsp" method="post">
        <label for="titulo">Título</label>
        <input type="text" name="titulo" id="titulo" required/>
        
        <label for="autor">Autor</label>
        <input type="text" name="autor" id="autor" required/>

        <label for="editora">Editora</label>
        <select name="editora" id="editora">
            <option value="">Selecionar editora</option>
            <% while (editora.next()) { %>
            <option value="<%= editora.getInt("id") %>"><%= editora.getString("nome") %></option>
            <% } %>
        </select>
        
        <label for="ano">Ano</label>
        <input type="number" value="<%= new java.util.Date().getYear() + 1900 %>" name="ano" id="ano" required/>
        
        <label for="preco">Preço</label>
        <input type="number" step="0.01" name="preco" id="preco" required/>

        <label for="foto">Foto</label>
        <input type="file" name="foto" id="foto"/>

        <input type="submit" value="Cadastrar"/>
    </form>
</body>
</html>