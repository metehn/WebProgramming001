<%@ page import="com.metehan.webprogramming001.Sample" %>
<%@ page import="com.metehan.webprogramming001.SampleManager" %>
<%
    String insert = request.getParameter("insert");
    String message = "Lütfen bilgileri giriniz.";

    if (insert != null) {
        String sampleName = request.getParameter("sampleName");
        double sampleValue = Double.parseDouble(request.getParameter("sampleValue"));

        Sample sample = new Sample(0, sampleName, sampleValue);
        SampleManager manager = new SampleManager();
        boolean inserted = manager.insert(sample);
//iso-8859-9
        message = "Kayıt eklendi " + sampleName + " " + sampleValue + " " + (inserted?"Evet":"Hayır");
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
