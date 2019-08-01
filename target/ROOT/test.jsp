<%@ page import="java.sql.*" %>

<%

    String username="olelyt_admin";

    String password="Ol131285";

    String dbName="olelyt_antibodies";

    String dbHost="olelyt.com";



    try {

        Class.forName("com.mysql.jdbc.Driver");

    } catch(ClassNotFoundException msg) {

        out.println("Error loading driver:" + msg.getMessage());

    }

    try{

        String url ="jdbc:mysql://"+dbHost+":3306/"+dbName;

        Connection Conn = DriverManager.getConnection(url,username, password);

        Statement Stmt = Conn.createStatement();

        String query = "select now()";

        ResultSet res = Stmt.executeQuery(query);

        while(res.next())

        {

            out.println("Query result : "+res.getObject(1));

        }

    } catch(SQLException e) {

        String err1Msg = e.getMessage();

%>

<TD COLSPAN="2"><STRONG><EM>err1Msg = <%= err1Msg %></EM></STRONG></TD>

<%

    }



%>