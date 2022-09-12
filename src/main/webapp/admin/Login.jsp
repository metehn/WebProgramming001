<%
    String login = request.getParameter("login");
    String message = "Lütfen giriş yapınız.";
    if (login != null) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String rootUsername = config.getServletContext().getInitParameter("username");
        String rootPassword = config.getServletContext().getInitParameter("password");

        if (rootUsername.equals(username) && rootPassword.equals(password)) {
            session.setAttribute("username", username);
            String callback = (String) session.getAttribute("callback");
            if(callback==null){
                callback ="Home.jsp";
            }
            response.sendRedirect(callback);
            return;
        } else {
            message = "Kullanıcı adı ya da şifre hatalı";
        }

    }

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Giriş</h1>

    <%=message%>

    <form action="Login.jsp" method="POST">
        <table>
            <tr>
                <td> Kullanıcı</td>
                <td><input type="text" name="username"/></td>
            </tr>
            <tr>
                <td> Şifre</td>
                <td><input type="password" name="password"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Giriş" name="login"/></td>
            </tr>
        </table>
    </form>

    </body>
</html>
