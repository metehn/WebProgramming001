<%@ page import="com.metehan.webprogramming001.SampleManager" %>
<%@ page import="com.metehan.webprogramming001.Sample" %>
<%


    long sampleId = Long.parseLong(request.getParameter("sampleId"));
    SampleManager manager = new SampleManager();
    Sample sample = manager.find(sampleId);
    //http://localhost:8080/WebProgramming001-1.0-SNAPSHOT/SampleFind.jsp?sampleId=2
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Örnek Bulma</h1>
    Örnek No: <%= sample.getSampleId()%> <br/>
    Örnek Adı: <%= sample.getSampleName()%> <br/>
    Örnek Değeri: <%= sample.getSampleValue()%> <br/>
    </body>
</html>
