<%@ page import="com.metehan.webprogramming001.inventory.entity.Product" %>
<%@ page import="com.metehan.webprogramming001.inventory.manager.ProductManager" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.metehan.webprogramming001.inventory.manager.CategoryManager" %>
<%@ page import="com.metehan.webprogramming001.inventory.entity.Category" %>
<%
    List<Product> productList = new ArrayList<>();
    ProductManager productManager = new ProductManager();

    String filter = request.getParameter("filter");
    long selectedCategoryId = 0;

    if (filter != null) {

        selectedCategoryId = Long.parseLong(request.getParameter("categoryId"));
    }

    if (selectedCategoryId == 0) {

        productList = productManager.list();
    } else {

        productList = productManager.listByCategory(selectedCategoryId);
    }
    CategoryManager categoryManager = new CategoryManager();
    List<Category> categoryList = categoryManager.list();

    // Category nullCategory = new Category(0, "--Tümünü Göster--");
    // categoryList.add(nullCategory);

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <h1>Örnek Listeleme</h1>

    <form method="post">
        Kategori:
        <select name="categoryId">

            <option value="0" <%=selectedCategoryId == 0 ? "selected" : ""%> >
                Tümünü Seçiniz
            </option>

            <%
                for (Category category : categoryList) {
            %>

            <option value="<%=category.getCategoryId()%>" <%=category.getCategoryId() == selectedCategoryId ? "selected" : ""%> >
                <%=category.getCategoryName()%>
            </option>
            <%
                }
            %>
        </select>


        <br/>

        <input type="submit" value="Filtrele" name="filter">

        <br/>

        <table border="1">
            <tr>
                <td> Ürün No</td>
                <td> Ürün Adı</td>
                <td> Ürün Fiyatı</td>
                <td> Kategori No</td>
                <td> Kategori Adı</td>


            </tr>

            <%

                for (Product product : productList) {

            %>

            <tr>
                <td><%=product.getProductId()%>
                </td>
                <td><%=product.getProductName()%>
                </td>
                <td><%=product.getProductPrice()%>
                </td>
                <td><%=product.getCategoryId()%>
                </td>
                <td><%=product.getCategoryName()%>
                </td>

            </tr>

            <%
                }
            %>
        </table>
    </form>
    <br/>
    <a href="ProducDetail.jsp">Ekle</a>
    </body>
</html>
