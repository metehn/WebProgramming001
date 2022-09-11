package com.metehan.webprogramming001;

import com.metehan.webprogramming001.Sample;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class SampleManager {


    public boolean insert(Sample sample) throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/webdb?serverTimeZone=UTL&useSLL=false&useSSL=false";
        String user = "root";
        String password = "root";

        Connection connection = DriverManager.getConnection(url, user, password);

        String sql = "insert into Sample(sampleName, sampleValue) values (?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, sample.getSampleName());
        statement.setDouble(2, sample.getSampleValue());
        int affected = statement.executeUpdate();

//iso-8859-9

        connection.close();


        return affected >= 1 ? true : false;
    }

    public List<Sample> list() throws ClassNotFoundException, SQLException {

        List<Sample> sampleList = new ArrayList<>();
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/webdb?serverTimeZone=UTL&useSLL=false&useSSL=false";
        String user = "root";
        String password = "root";

        Connection connection = DriverManager.getConnection(url, user, password);

        String sql = "select * from Sample";
        PreparedStatement statement = connection.prepareStatement(sql);

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()){

            long sampleId= resultSet.getLong("sampleId");
            String sampleName = resultSet.getString("sampleName");
            double sampleValue = resultSet.getDouble("sampleValue");
            Sample sample = new Sample(sampleId, sampleName, sampleValue);
            sampleList.add(sample);
        }
        connection.close();
        return sampleList;
    }
    public Sample find(long sampleId) throws SQLException, ClassNotFoundException {
        Sample sample = null;

        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/webdb?serverTimeZone=UTL&useSLL=false&useSSL=false";
        String user = "root";
        String password = "root";

        Connection connection = DriverManager.getConnection(url, user, password);

        String sql = "select * from Sample where sampleId=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setLong(1, sampleId);

        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next()){
            String sampleName = resultSet.getString("sampleName");
            double sampleValue = resultSet.getDouble("sampleValue");
            sample = new Sample(sampleId, sampleName, sampleValue);

        }
        connection.close();
        return sample;
    }

}
