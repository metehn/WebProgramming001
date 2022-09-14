package com.metehan.webprogramming001.entitymanager;

import com.metehan.webprogramming001.DatabaseUtilities;

import java.sql.*;

public class MemberManager {


    public boolean insert(Member member) throws ClassNotFoundException, SQLException {

        Connection connection = DatabaseUtilities.getConnection();

        String sql = "insert into SiteMember(memberName, memberPassword) values (?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,member.getMemberName());
        statement.setString(2, member.getMemberPassword());
        int affected = statement.executeUpdate();

//iso-8859-9

        connection.close();


        return affected >= 1 ? true : false;
    }

    public Member find(String memberName) throws SQLException, ClassNotFoundException {
        Member member = null;

        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/webdb?serverTimeZone=UTL&useSLL=false&useSSL=false";
        String user = "root";
        String password = "root";

        Connection connection = DriverManager.getConnection(url, user, password);

        String sql = "select * from SiteMember where memberName=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, memberName);

        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next()){
            long memberId = resultSet.getLong("memberId");
            String memberPassword = resultSet.getString("memberPassword");
            member = new Member(memberId, memberName, memberPassword);

        }
        connection.close();
        return member;
    }

    public boolean update(Member member) throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/webdb?serverTimeZone=UTL&useSLL=false&useSSL=false";
        String user = "root";
        String password = "root";

        Connection connection = DriverManager.getConnection(url, user, password);

        String sql = "update SiteMember set memberPassword=? where memberName=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,member.getMemberPassword());
        statement.setString(2,member.getMemberName());
        int affected = statement.executeUpdate();

//iso-8859-9
        connection.close();

        return affected >= 1 ? true : false;
    }

}
