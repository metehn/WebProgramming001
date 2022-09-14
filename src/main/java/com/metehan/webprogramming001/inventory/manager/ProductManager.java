package com.metehan.webprogramming001.inventory.manager;

import com.metehan.webprogramming001.DatabaseUtilities;
import com.metehan.webprogramming001.inventory.entity.Product;

import java.sql.*;
import java.util.*;

public class ProductManager {


    public boolean insert(Product product) throws SQLException, ClassNotFoundException {

        Connection connection = DatabaseUtilities.getConnection();
        String sql = "insert into Product(productName, productPrice, categoryId) values(?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, product.getProductName());
        statement.setDouble(2, product.getProductPrice());
        statement.setLong(3, product.getCategoryId());

        int affected = statement.executeUpdate();

        connection.close();
        return affected > 0;
    }

    public List<Product> list() throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<>();
        Connection connection = DatabaseUtilities.getConnection();

        //String sql = "select * from Product";
        String sql = "select productId, productName, productPrice, Product.categoryId, categoryName  from Product " +
                "inner join Category on Product.categoryId = Category.categoryId";

        PreparedStatement statement = connection.prepareStatement(sql);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {

            Product product = new Product(resultSet.getLong("productId"),
                    resultSet.getString("productName"),
                    resultSet.getDouble("productPrice"));
            product.setCategoryId(resultSet.getLong("categoryId"));
            product.setCategoryName(resultSet.getString("categoryName"));
            list.add(product);

        }

        connection.close();
        return list;
    }

    public List<Product> listByCategory(long categoryId) throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<>();
        Connection connection = DatabaseUtilities.getConnection();

        //String sql = "select * from Product where categoryId=?";
        String sql = "select productId, productName, productPrice, Product.categoryId, categoryName  from Product " +
                "inner join Category on Product.categoryId = Category.categoryId where Product.categoryId=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setLong(1, categoryId);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {

            Product product = new Product(resultSet.getLong("productId"),
                    resultSet.getString("productName"),
                    resultSet.getDouble("productPrice"));
            product.setCategoryId(resultSet.getLong("categoryId"));
            product.setCategoryName(resultSet.getString("categoryName"));

            list.add(product);

        }

        connection.close();
        return list;
    }


}