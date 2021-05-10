<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livraria</title>
    <link rel="stylesheet" href="/style.css">
    <script src="https://kit.fontawesome.com/50a16afc25.js" crossorigin="anonymous"></script>
</head>
<body>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <%@ page language="java" import="java.sql.*, java.text.NumberFormat, java.util.Locale" %>

    <jsp:include page="/componentes/Header.jsp"/> 

    <%
        Class.forName("com.mysql.jdbc.Driver");
            
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/base_dados","root","");
    
        PreparedStatement stmt;

        String searchString = request.getParameter("q");

        if (searchString == null) {
            stmt = con.prepareStatement("SELECT * FROM livro;");
        } else {
            stmt = con.prepareStatement("SELECT * FROM livro WHERE titulo like ?;");
            stmt.setString(1, "%"+new String(searchString.getBytes("ISO-8859-1"), "UTF-8")+"%");
        }

        ResultSet livro = stmt.executeQuery();

        Boolean admin = session.getAttribute("admin") == null ? false : (Boolean)session.getAttribute("admin");
    %>

    <table>
        <thead>
            <tr>
                <th style="width: 100px;">Capa</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Ano</th>
                <th>Preço</th>
                <% if (admin) { %>
                    <th>Ação</th>
                <% } %>
            </tr>
        </thead>
        <tbody>
            <% while (livro.next()) { %>
                <tr>
                    <td><img width="100px" src="/livro/foto/<%= livro.getString("foto") %>"/></td> 
                    <td><%= livro.getString("titulo") %></td> 
                    <td><%= livro.getString("autor") %></td> 
                    <td><%= livro.getString("ano") %></td> 
                    <td><%= NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(livro.getFloat("preco")) %></td> 
                    <% if (admin) { %>
                        <td>
                            <a href="livro/editar.jsp?id=<%= livro.getInt("id") %>" title="Editar"> <i class="fas fa-edit"></i> </a>
                            <a style="margin-left: 20px" href="livro/excluir.jsp?id=<%= livro.getInt("id") %>" title="Excluir"> <i class="fas fa-trash"></i> </a>
                        </td>
                    <% } %>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>