<%@ page import="com.metehan.webprogramming001.entitymanager.Sample" %>
<%@ page import="com.metehan.webprogramming001.entitymanager.SampleManager" %>
<%
    //Programı ilk çalıştırdığımızda hata verecek çünkü sampleId değerini vermiyoruz. Elle vermemiz gerekiyor, aşağıdaki gibi ?sampleId= yazarsan çalışacaktır
    //http://localhost:8080/WebProgramming001-1.0-SNAPSHOT/entitymanager/SampleUpdate.jsp?sampleId=7
    String insert = request.getParameter("insert");
    String message = "Lütfen bilgileri giriniz.";
    Sample sample = null;
    if (insert != null) {
        long sampleId = Long.parseLong(request.getParameter("sampleId"));
        String sampleName = request.getParameter("sampleName");
        double sampleValue = Double.parseDouble(request.getParameter("sampleValue"));

        sample = new Sample(sampleId, sampleName, sampleValue);
        SampleManager manager = new SampleManager();
        boolean inserted = manager.update(sample);
//iso-8859-9
        message = "Kayıt eklendi " + sampleName + " " + sampleValue + " " + (inserted?"Evet":"Hayır");
    }else{

        long sampleId = Long.parseLong(request.getParameter("sampleId"));
        SampleManager manager = new SampleManager();
        sample = manager.find(sampleId);

    }

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Örnek Güncelle</h1>

    <i> <%=message%> </i>
    <form>
        <input type="hidden" name="sampleId" value="<%=sample.getSampleId()%>"/> <br/>  <!-- tag disabled=true ise html o veriyi göndermiyor hata veriyor. Bu yüzden gözükmeyen bir değer yaptık html bunu gönderecek -->
        Örnek No: <input type="text" name="sampleId" value="<%=sample.getSampleId()%>" disabled="true"/> <br/>
        Örnek Adı: <input type="text" name="sampleName" value="<%=sample.getSampleName()%>"/> <br/>
        Örnek Değer: <input type="text" name="sampleValue" value="<%=sample.getSampleValue()%>"/> <br/>
        <input type="submit" value="Ekle" name="insert"/>
    </form>

    <br/>
    <a href="SampleList2.jsp">Listeye Dön</a>
    </body>
</html>
