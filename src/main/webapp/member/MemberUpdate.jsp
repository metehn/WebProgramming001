<%@ page import="com.metehan.webprogramming001.entitymanager.Member" %>
<%@ page import="com.metehan.webprogramming001.entitymanager.MemberManager" %>
<%
  String update = request.getParameter("update");
  String username = (String) session.getAttribute("username");
  String password = (String) session.getAttribute("password");
  Member member = null;
  String message = "Lütfen yeni şifrenizi giriniz!";

  if(username == null || password==null){
    session.setAttribute("callback", "MemberUpdate.jsp");
    response.sendRedirect("MemberLogin.jsp");
    return;
  }


  if(update!= null){
    String userPassword = request.getParameter("password");
    member = new Member(0,username, userPassword);

    MemberManager manager = new MemberManager();
    boolean updated = manager.update(member);
    message = "İşlem: " + updated;
  }


%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <h1> Şifre Güncelle</h1>

  <%=message%> <br/>

  <form>
   <input type="password" name="password"/> <br/>
    <input type="submit" value="Güncelle" name="update"/> <br/>
  </form>


  </body>
</html>
