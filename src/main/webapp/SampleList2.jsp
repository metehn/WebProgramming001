<%@ page import="java.util.ArrayList" %>
<%@ page import="com.metehan.webprogramming001.Sample" %>
<%@ page import="com.metehan.webprogramming001.SampleManager" %>
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
  <table>
    <%

      for(Sample sample : sampleList){
        String sampleName = sample.getSampleName();
        double sampleValue = sample.getSampleValue();
    %>
    <%=sampleName%> <%=" " + sampleValue%>  <br/>

    <%
      }
    %>
  </table>
  </body>
</html>
