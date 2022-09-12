<%
    String username = (String) session.getAttribute("username");
    if(username == null){
        session.setAttribute("callback", "Home.jsp");
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
    <h1> Ana sayfa</h1>
    Hoşgeldin  <b><%=username%> </b> <br/>

 <a href="Logout.jsp">Çıkış yap!</a>


    </body>
</html>
