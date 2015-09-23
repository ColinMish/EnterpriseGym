package Models;

import java.sql.*;

/**
 *
 * @author Kim
 */
public class StoredProcedure {

    public String user = "davidkenny";
    public String pass = "root1";

    public StoredProcedure() {

    }

    public void runAddTheme() throws SQLException {
        Connection con = null;
        try {

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;
            ResultSet rs = null;
            String q = "SELECT count(*) FROM theme";
            ps = con.prepareStatement(q);
            rs = ps.executeQuery();

            rs.next();
            int rows = rs.getInt(1);

            if (rows == 0) {
                /* Run  stored procedure */
                PreparedStatement theme = con.prepareCall("{call SPAddThemes()}");
                theme.execute();
            } else {
                System.out.println("Themes already in the database");
            }
        } catch (Exception e) {
        }
    }
}
