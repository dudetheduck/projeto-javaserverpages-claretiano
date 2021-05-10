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
    <%
    Boolean admin = (Boolean)session.getAttribute("admin");
    if (admin == null || admin == false) {
        response.sendRedirect("/");
    }
    %>

    <jsp:include page="/componentes/Header.jsp"/> 
    
    <form class="form" action="salvar.jsp" method="post">
        <label for="nome">Nome</label>
        <input type="text" name="nome" id="nome" required/>
        
        <label for="cidade">Cidade</label>
        <input type="text" name="cidade" id="cidade" required/>

        <input type="submit" value="Cadastrar"/>
    </form>
</body>
</html>