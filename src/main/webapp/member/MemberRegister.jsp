<%@ page import="com.metehan.webprogramming001.entitymanager.Member" %>
<%@ page import="com.metehan.webprogramming001.entitymanager.MemberManager" %><%
  String register = request.getParameter("register");
  String message = "Lütfen giriş yapınız.";
  if (register != null) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String passwordConfirmation = request.getParameter("passwordConfirmation");
    if(password.equals(passwordConfirmation)){

        Member member = new Member(0,username,password);
        MemberManager manager = new MemberManager();

        Member memberTemp = manager.find(username);

        if(memberTemp ==null){
            boolean registered = manager.insert(member);

            message = "Kayıt: " + registered;
        }else{
            message = "Böyle bir kullanıcı adı zaten var!";
        }



    }else{

      message = "Şifre ve doğrulama şifresi eşleşmiyor!";
    }
  }



%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>

    <h1>Üye Kayıt</h1>
    <%=message%>
    <form action="MemberRegister.jsp" method="POST">
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
          <td> Şifre Doğrulama</td>
          <td><input type="password" name="passwordConfirmation"/></td>
        </tr>

        <tr>
          <td><input type="submit" value="Kayıt Ol" name="register"/></td>
        </tr>
      </table>
    </form>


    </body>
</html>
