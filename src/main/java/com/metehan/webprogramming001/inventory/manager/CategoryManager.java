package com.metehan.webprogramming001.inventory.manager;

import com.metehan.webprogramming001.DatabaseUtilities;
import com.metehan.webprogramming001.inventory.entity.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryManager {

    public List<Category> list() throws SQLException, ClassNotFoundException {
        List<Category> list = new ArrayList<>();
        Connection connection = DatabaseUtilities.getConnection();

        String sql = "select * from Category";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {

            Category Category = new Category(resultSet.getLong("categoryId"),
                    resultSet.getString("categoryName"));

            list.add(Category);

        }

        connection.close();
        return list;
    }

}
