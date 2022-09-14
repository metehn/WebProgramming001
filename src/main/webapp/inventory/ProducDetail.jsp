<%@ page import="com.metehan.webprogramming001.inventory.entity.Product" %>
<%@ page import="com.metehan.webprogramming001.inventory.manager.ProductManager" %>
<%@ page import="com.metehan.webprogramming001.inventory.manager.CategoryManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.metehan.webprogramming001.inventory.entity.Category" %>
<%

    String insert = request.getParameter("insert");
    String message = "Lütfen bilgileri giriniz.";
    CategoryManager categoryManager = new CategoryManager();
    List<Category> categoryList = categoryManager.list();
    if (insert != null) {

        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        long categoryId = Long.parseLong(request.getParameter("categoryId"));

        Product product = new Product(0, productName, productPrice);
        product.setCategoryId(categoryId);
        ProductManager productManager = new ProductManager();
        boolean inserted = productManager.insert(product);

//iso-8859-9
        message = "Kayıt güncellendi " + productName + " " + productPrice + " " + (inserted ? "Evet" : "Hayır");
    }

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1> Ürün Ekleme</h1>

    <i><%=message%>
    </i>
    <form method="POST">
        Örnek Adı: <input type="text" name="productName"/> <br/>
        Örnek Değer: <input type="text" name="productPrice"/> <br/>
        Kategori No:
        <select name="categoryId">
            <%
                for (Category category : categoryList) {
            %>

            <option value="<%=category.getCategoryId()%>">
                <%=category.getCategoryName()%>
            </option>
            <%
                }
            %>
        </select>
        <br/>
        <br/>
        <input type="submit" value="Ekle" name="insert"/>
        <br/>
        <br/>
        <a href="ProductSummary.jsp">Liste</a>
    </form>


    </body>
</html>
