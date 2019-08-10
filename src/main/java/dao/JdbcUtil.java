package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtil {

    // For localhost testing

    private static final String USER = "root";
    private static final String PASS = "";
    private static final String URL = "jdbc:mysql://localhost:3306/antibodies";
    private static final String DRIVER = "com.mysql.jdbc.Driver";

/*
    private static final String USER = "olelytjv_admin";
    private static final String PASS = "Ol131285...";
    private static final String URL = "jdbc:mysql://localhost/olelytjv_antibodies?noAccessToProcedureBodies=true";
    private static final String DRIVER = "com.mysql.jdbc.Driver";
  */
    public static Connection getConnection() {

        Connection con = null;

        try {
            Class.forName(DRIVER);
            System.out.println("Connecting to database");
            con = DriverManager.getConnection(URL, USER, PASS);
            System.out.println(con.toString());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}