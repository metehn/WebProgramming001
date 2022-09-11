<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%
    String insert = request.getParameter("insert");
    String message = "Lütfen bilgileri giriniz.";
    if (insert != null) {
        String sampleName = request.getParameter("sampleName");
        double sampleValue = Double.parseDouble(request.getParameter("sampleValue"));

        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/webdb?serverTimeZone=UTL&useSLL=false&useSSL=false";
        String user = "root";
        String password = "root";

        Connection connection = DriverManager.getConnection(url, user, password);

        String sql = "insert into Sample(sampleName, sampleValue) values (?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, sampleName);
        statement.setDouble(2, sampleValue);
        int affected = statement.executeUpdate();

//iso-8859-9
        message = affected + " kayıt eklendi " + sampleName + " " + sampleValue;
        connection.close();
    }

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Örnek Ekleme</h1>

    <i><%=message%>
    </i>
    <form>
        Örnek Adı: <input type="text" name="sampleName"/> <br/>
        Örnek Değer: <input type="text" name="sampleValue"/> <br/>
        <input type="submit" value="Ekle" name="insert"/> <br/>
    </form>

    </body>
</html>
