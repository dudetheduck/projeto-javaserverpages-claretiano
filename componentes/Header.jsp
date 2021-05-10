<%@ page contentType="text/html; charset=UTF-8" %>
<header>
    <div><a href="/index.jsp"><i class="fas fa-book-reader"></i> Livraria</a></div>
    <ul>
        <%
        String nome = (String)session.getAttribute("nome");
        Boolean admin = (Boolean)session.getAttribute("admin");
        %>

        <li><a href="/">Livros</a></li>

        <% if (admin != null && admin == true) { %>
            <li><a href="/livro/adicionar.jsp">Novo Livro</a></li>
            <li><a href="/editora/adicionar.jsp">Nova Editora</a></li>
        <% } %>

        <form action="/" method="get" id="divSearch">
            <% request.setCharacterEncoding("UTF-8"); %>
            <input type="text" id="q" name="q" placeholder="Buscar..." value="<%= request.getParameter("q") != null ? new String(request.getParameter("q").getBytes("ISO-8859-1"), "UTF-8") : "" %>">
            <i class="fas fa-search" id="icon"></i>
        </form>

        <%
        if (nome == null) {
        %>
            <li><a href="/usuario">Login</a></li>
            <li><a href="/usuario/cadastro.jsp">Signup</a></li>
        <% } else { %>
            <li>Olá, <%= nome %></li>
            <li><a href="/usuario/sair.jsp">Sair</a></li>
        <% } %>
    </ul>
</header>