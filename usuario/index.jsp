<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livraria - Login</title>
    <link rel="stylesheet" href="/style.css">
    <script src="https://kit.fontawesome.com/50a16afc25.js" crossorigin="anonymous"></script>
</head>

<body>
    <%@ page language="java" contentType="text/html; charset=UTF-8" %>

    <jsp:include page="/componentes/Header.jsp"/> 

    <fieldset>
        <form name="login" action="entrar.jsp" method="POST">
            <legend>Login</legend>
            <div>
                <input type="text" name="user" placeholder="Usuário">
                <br>
            </div>
            <div>
                <input type="password" name="password" placeholder="Senha">
                <br>
            </div>
            <div>
                <button type="submit">Entrar</button>
            </div>
        </form>
    </fieldset>
</body>
</html>