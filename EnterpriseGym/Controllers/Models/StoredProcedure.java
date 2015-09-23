
package Models;
import static Models.UserModel.getCurrentDate;
import java.sql.*;


/**
 *
 * @author Kim
 */
public class StoredProcedure {
    
    public String user = "davidkenny";
    public String pass = "root1";
    
    public StoredProcedure(){
        
    }
    
    
    public boolean isTableEmpty(String table, Connection c){
        boolean isEmpty = true;
        
        
        
        return isEmpty;
    }
    
    
    public void runProcedure(){
          Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;

            String InsertIntoAccount = "";

            ps.executeUpdate();
            
        } catch (Exception e) {  }
    }
    
    
}
