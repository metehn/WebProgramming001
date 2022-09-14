<%@ page import="com.metehan.webprogramming001.entitymanager.Member" %><%
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    if(username == null || password == null){
        session.setAttribute("callback", "MemberHome.jsp");
        response.sendRedirect("MemberLogin.jsp");
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

    <a href="MemberUpdate.jsp">Bul</a> <br/>

 <a href="MemberLogout.jsp">Çıkış yap!</a>


    </body>
</html>
