package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtil {
    /*

    private static final String USER = "olelyt_admin";
    private static final String PASS = "Ol131285";
    private static final String URL = "jdbc:mysql://mysql3000.mochahost.com:3306/olelyt_antibodies?noAccessToProcedureBodies=true";
    private static final String DRIVER = "com.mysql.jdbc.Driver";
*/

       /*
    private static final String USER = "root";
    private static final String PASS = "";
    private static final String URL = "jdbc:mysql://localhost:3306/antibodies";
    private static final String DRIVER = "com.mysql.jdbc.Driver";
*/


    private static final String USER = "olelytjv_admin";
    private static final String PASS = "Ol131285...";
    private static final String URL = "jdbc:mysql://olelyt.jvmhost.net:3306/olelytjv_antibodies";
    private static final String DRIVER = "com.mysql.jdbc.Driver";



/*    private static final String USER = "olytovco_admin";
    private static final String PASS = "Ol131285...";
    private static final String URL = "jdbc:mysql://olytov.com:3306/olytovco_antibodies";
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