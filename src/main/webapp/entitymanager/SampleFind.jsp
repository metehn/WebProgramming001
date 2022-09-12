<%@ page import="com.metehan.webprogramming001.entitymanager.SampleManager" %>
<%@ page import="com.metehan.webprogramming001.entitymanager.Sample" %>
<%
    //http://localhost:8080/WebProgramming001-1.0-SNAPSHOT/SampleFind.jsp?sampleId=2

        Sample sample = null;

        long sampleId = Long.parseLong(request.getParameter("sampleId"));
        SampleManager manager = new SampleManager();
        sample = manager.find(sampleId);


%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Örnek Bulma</h1>


    Örnek No: <%= sample==null?" ":sample.getSampleId()%> <br/>
    Örnek Adı: <%= sample==null?" ":sample.getSampleName()%> <br/>
    Örnek Değeri: <%= sample==null?" ":sample.getSampleValue()%> <br/>

    <br/>
    <a href="SampleList2.jsp">Listeye Dön</a>

    </body>
</html>
