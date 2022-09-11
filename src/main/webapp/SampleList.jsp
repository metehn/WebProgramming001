<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/webdb?serverTimeZone=UTL&useSLL=false&useSSL=false";
    String user = "root";
    String password = "root";

    Connection connection = DriverManager.getConnection(url, user, password);

    String sql = "select * from Sample";
    PreparedStatement statement = connection.prepareStatement(sql);

    ResultSet resultSet = statement.executeQuery();


%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Örnek Listeleme</h1>
   <table>
       <%
           while (resultSet.next()) {
               String sampleName = resultSet.getString("sampleName");
               double sampleValue = resultSet.getFloat("sampleValue");
       %>
       <%=sampleName%> <%=" " + sampleValue%>  <br/>

       <%
           }
       %>
   </table>
    </body>
</html>
<%
    connection.close();
%>