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

    PreparedStatement stmtEditora = con.prepareStatement("SELECT * FROM editora;");
    ResultSet editora = stmtEditora.executeQuery();

    String id = request.getParameter("id");

    PreparedStatement stmtLivro = con.prepareStatement("SELECT * FROM livro WHERE id = ?;");

    stmtLivro.setString(1, id);

    ResultSet livro = stmtLivro.executeQuery();

    livro.next();
    %>

    <jsp:include page="/componentes/Header.jsp"/> 

    <form class="form" action="atualizar.jsp" method="post">
        <input type="number" id="id" name="id" value="<%= id %>"/>
        <label for="titulo">Título</label>
        <input type="text" value="<%= livro.getString("titulo") %>" name="titulo" id="titulo" required/>
        
        <label for="autor">Autor</label>
        <input type="text" value="<%= livro.getString("autor") %>" name="autor" id="autor" required/>

        <label for="editora">Editora</label>
        <select name="editora" id="editora">
            <option value="">Selecionar editora</option>
            <% while (editora.next()) { %>
            <option 
                <% if (editora.getInt("id") == livro.getInt("idEditora")) { out.println("selected"); } %> 
                value="<%= editora.getInt("id") %>"
            ><%= editora.getString("nome") %></option>
            <% } %>
        </select>
        
        <label for="ano">Ano</label>
        <input type="number" value="<%= livro.getInt("ano") %>" name="ano" id="ano" required/>
        
        <label for="preco">Preço</label>
        <input type="number" value="<%= livro.getInt("preco") %>" step="0.01" name="preco" id="preco" required/>

        <label for="foto">Foto</label>
        <input type="file" name="foto" id="foto"/>

        <input type="submit" value="Cadastrar"/>
    </form>
</body>
</html>