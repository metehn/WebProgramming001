<%@ page import="com.metehan.webprogramming001.entitymanager.SampleManager" %>
<%

    //Linke bunu yaz
    //http://localhost:8080/WebProgramming001-1.0-SNAPSHOT/entitymanager/SampleDelete.jsp?sampleId=7
    String message = "Lütfen bilgileri giriniz.";

    SampleManager manager = new SampleManager();
    long sampleId = Long.parseLong(request.getParameter("sampleId"));
    boolean deleted = manager.delete(sampleId);
    message += " " + deleted;

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Örnek Silme</h1>
    <%=message%><br/>
    Örnek Id: <input type="text" name="sampleId"/> <br/>
    <input type="submit" value="Sil" name="delete"/> <br/>

    <br/>
    <a href="SampleList2.jsp">Listeye Dön</a>
    </body>
</html>
