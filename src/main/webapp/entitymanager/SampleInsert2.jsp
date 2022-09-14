<%@ page import="com.metehan.webprogramming001.entitymanager.Sample" %>
<%@ page import="com.metehan.webprogramming001.entitymanager.SampleManager" %>
<%

    String update = request.getParameter("update");
    String message = "Lütfen bilgileri giriniz.";

    if (update != null) {
        String sampleName = request.getParameter("sampleName");
        double sampleValue = Double.parseDouble(request.getParameter("sampleValue"));

        Sample sample = new Sample(0, sampleName, sampleValue);
        SampleManager manager = new SampleManager();
        boolean updated = manager.insert(sample);
//iso-8859-9
        message = "Kayıt güncellendi " + sampleName + " " + sampleValue + " " + (updated?"Evet":"Hayır");
    }

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Örnek Ekleme</h1>

    <i><%=message%> </i>
    <form>
        Örnek Adı: <input type="text" name="sampleName"/> <br/>
        Örnek Değer: <input type="text" name="sampleValue"/> <br/>
        <input type="submit" value="Ekle" name="update"/> <br/>
    </form>

    <br/>
    <a href="SampleList2.jsp">Listeye Dön</a>
    </body>
</html>
