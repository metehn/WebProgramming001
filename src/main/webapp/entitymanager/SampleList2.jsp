<%@ page import="java.util.ArrayList" %>
<%@ page import="com.metehan.webprogramming001.entitymanager.Sample" %>
<%@ page import="com.metehan.webprogramming001.entitymanager.SampleManager" %>
<%@ page import="java.util.List" %>

<%
    List<Sample> sampleList = new ArrayList<>();
    SampleManager manager = new SampleManager();
    sampleList = manager.list();
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Örnek Listeleme</h1>
    <table border="1">
        <tr>
            <td> Örnek No</td>
            <td> Örnek Adı</td>
            <td> Örnek Değer</td>


        </tr>

        <%

            for (Sample sample : sampleList) {

        %>

        <tr>
            <td><%=sample.getSampleId()%>
            </td>
            <td><%=sample.getSampleName()%>
            </td>
            <td><%=sample.getSampleValue()%>
            </td>
            <td><a href="SampleFind.jsp?sampleId=<%=sample.getSampleId()%>">Bul</a></td>
            <td><a href="SampleUpdate.jsp?sampleId=<%=sample.getSampleId()%>">Güncelle</a></td>
            <td><a href="SampleDelete.jsp?sampleId=<%=sample.getSampleId()%>">Sil</a></td>
        </tr>

        <%
            }
        %>
    </table>

    <br/>
    <a href="SampleInsert2.jsp">Ekle</a>
    </body>
</html>
