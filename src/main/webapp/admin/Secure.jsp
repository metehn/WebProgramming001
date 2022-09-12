<%
    String username = (String) session.getAttribute("username");
    if(username == null){
        session.setAttribute("callback", "Secure.jsp");
        response.sendRedirect("Login.jsp");
        return; // Bunu yapmak faydalı. Geriye kalan kısmı gereksiz yere çalıştırmamış olur!
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1> Güvenli</h1>
    </body>
</html>
