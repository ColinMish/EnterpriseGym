/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Entities.Account;
import Entities.UserEntity;
import java.sql.*;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import lib.Convertors;
import lib.Security;

/**
 *
 * @author davidkenny
 */
public class UserModel {
    
    public String user = "davidkenny";
    public String pass = "root1";
    
    public static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
    
    public boolean register(String username, String password, String email, String first,
            String last, String gender, String country, String university, String school,
            String subject, int year, int matriculation, String salt) {
        Connection con = null;
        try {
            int id = createAccount(username, password, salt, false);
            return createUser(id, username, email, first, last, gender, country, university, school, subject, year, matriculation, false);
        } catch (Exception e) {
            System.out.println("connection to db failed");
            return false;
        }
    }
    
    public boolean setResetToken(String email, String searchToken) {
        
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            
            PreparedStatement ps1 = null;
            
            String UpdateToken = "UPDATE account SET reset_token = ?  WHERE idaccount = (SELECT iduser FROM user WHERE email = ?)";
            
            ps1 = con.prepareStatement(UpdateToken);
            ps1.setString(1, searchToken);
            ps1.setString(2, email);
            
            ps1.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Failed to set reset token");
        }
        
        return false;
    }
    
    public boolean setPassword(String username, String newPassword) {
        Connection con = null;
        String saltAsString = getSalt(username);
        try {
            newPassword = Security.hashPassword(newPassword, saltAsString);
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            PreparedStatement ps = null;
            String sqlOption2 = "UPDATE account SET password=? WHERE username=?";
            ps = con.prepareStatement(sqlOption2);
            
            ps.setString(1, username);
            ps.setString(2, newPassword);
            
            ps.executeUpdate();
            return true;
            
        } catch (Exception e) {
            System.out.println("connection to db failed");
            System.out.println("Password reset for user " + username + " failed");
            e.printStackTrace();
            return false;
        }
    }
    
    public int createAccount(String username, String password, String salt, boolean temp) {
        Connection con = null;
        int id = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            
            PreparedStatement ps = null;
            PreparedStatement addAccount = null;
            
            String InsertIntoAccount = "INSERT INTO account (username,password,salt, date_joined, temp) VALUES (?,?,?,?,?)";
            addAccount = con.prepareStatement(InsertIntoAccount);
            addAccount.setString(1, username);
            addAccount.setString(2, password);
            addAccount.setString(3, salt);
            addAccount.setDate(4, getCurrentDate());
            addAccount.setBoolean(5, temp);
            addAccount.executeUpdate();

            //Find out the id of the new account 
            PreparedStatement getAccountID = null;
            String selectAccount = "SELECT * FROM account WHERE username=?";
            
            getAccountID = con.prepareStatement(selectAccount);
            getAccountID.setString(1, username);
            
            ResultSet rs = getAccountID.executeQuery();
            if (rs.next()) {
                id = rs.getInt("idaccount");
                PreparedStatement getDefaultPermision = null;
                String getDefaultPermisionString = "SELECT idaccessToken FROM accessToken WHERE description=?";
                getDefaultPermision = con.prepareStatement(getDefaultPermisionString);
                getDefaultPermision.setString(2, "user");//TODO Change!
                ResultSet accessLevel = getDefaultPermision.executeQuery();
                accessLevel.next();
                int access = accessLevel.getInt("idaccessToken");
                String addPermisions = "INSERT INTO accessToken_has_account (accessToken_idaccessToken, account_idaccount) VALUES (?,?)";
                ps = null;
                ps = con.prepareStatement(addPermisions);
                ps.setInt(1, access);
                ps.setInt(2, id);
                ps.executeUpdate();
            }
            con.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            
        }
        return id;
    }
    
    public boolean createUser(int accountid, String username, String email, String first, String last, String gender, String country, String university, String school, String subject, int year, int matriculation, boolean temp) {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            PreparedStatement ps = null;
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            if (!temp) {
                String sqlOption = "INSERT INTO user (email,first_name,last_name,gender,country,university,school,subject,year,matriculation, account_idaccount) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(sqlOption);
                
                ps.setString(1, email);
                ps.setString(2, first);
                ps.setString(3, last);
                ps.setString(4, gender);
                ps.setString(5, country);
                ps.setString(6, university);
                ps.setString(7, school);
                ps.setString(8, subject);
                //Default values
                ps.setInt(9, year);
                ps.setInt(10, matriculation);
                ps.setInt(11, accountid);
            } else {
                String sqlOption = "INSERT INTO user (first_name, last_name,email, account_idaccount) VALUES (?,?,?,?)";
                ps = con.prepareStatement(sqlOption);
                
                ps.setString(1, first);
                ps.setString(2, last);
                ps.setString(3, email);
                ps.setInt(4, accountid);
            }
            ps.executeUpdate();
            con.close();
            return true;
            
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("connection to db failed");
            return false;
        }
    }
    
    public boolean login(String username, String password) throws SQLException {
        Connection con = null;
        try {
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            
            ResultSet rsdoLogin = null;
            PreparedStatement psdoLogin = null;
            PreparedStatement ps2 = null;
            
            String sqlOption = "SELECT * FROM account where username=? and password=?";
            
            psdoLogin = con.prepareStatement(sqlOption);
            psdoLogin.setString(1, username);
            psdoLogin.setString(2, password);
            
            rsdoLogin = psdoLogin.executeQuery();
            
            if (rsdoLogin.next()) {
                String sqlOption2 = "UPDATE account SET date_active=? WHERE username=?";
	   // String sqlOption ="UPDATE fault set summary=? WHERE idfault=?";

                //is NULL
                // System.out.println("Statementprepd");
                ps2 = con.prepareStatement(sqlOption2);

                //use the result set to get the old values
                ps2.setDate(1, getCurrentDate());
                ps2.setString(2, username);
                
                ps2.executeUpdate();
                //ps.executeUpdate();
                con.close();
                return true;
            } else {
                
                return false;
            }
            
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            return false;
        }
        
    }
    
    public java.util.LinkedList<UserEntity> getDetails(String username) {
        java.util.LinkedList<UserEntity> userdetails = new java.util.LinkedList<>();
        
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            
            PreparedStatement ps1 = null;
            String sqlOption1 = "SELECT * FROM account WHERE username=?";
            
            ps1 = con.prepareStatement(sqlOption1);
            ps1.setString(1, username);
            
            ResultSet rs1 = ps1.executeQuery();
            rs1.next();
            int id = rs1.getInt("idaccount");
            System.out.println("The id is:" + id);
            
            PreparedStatement ps = null;
            String sqlOption = "SELECT * FROM user WHERE account_idaccount=?";
            
            ps = con.prepareStatement(sqlOption);
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            UserEntity user = new UserEntity();
            rs.next();
            user.setId(rs.getInt("iduser"));
            user.setName(rs.getString("first_name"));
            user.setLastname(rs.getString("last_name"));
            user.setUniversity(rs.getString("university"));
            user.setCountry(rs.getString("country"));
            user.setEmail(rs.getString("email"));
            user.setSchool(rs.getString("school"));
            user.setSubject(rs.getString("subject"));
            user.setUniversity(rs.getString("university"));
            user.setGender(rs.getString("gender"));
            user.setYearOfStudy(rs.getInt("year"));
            user.setMatric(rs.getInt("matriculation"));
            userdetails.add(user);
            con.close();
            return userdetails;
            
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("connection to db failed");
            return null;
        }
    }
    
    public UserEntity getPoints(String username) {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            
            PreparedStatement ps1 = null;
            String sqlOption1 = "SELECT * FROM account WHERE username=?";
            
            ps1 = con.prepareStatement(sqlOption1);
            ps1.setString(1, username);
            
            ResultSet rs1 = ps1.executeQuery();
            rs1.next();
            int id = rs1.getInt("idaccount");
            System.out.println("The id is:" + id);
            
            PreparedStatement ps = null;
            String sqlOption = "SELECT * FROM user WHERE account_idaccount=?";
            
            ps = con.prepareStatement(sqlOption);
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            UserEntity user = new UserEntity();
            rs.next();
            user.setActionPoints(rs.getInt("action_points"));
            user.setPractice_points(rs.getInt("practice_points"));
            user.setVirtual_points(rs.getInt("virtual_points"));
            user.setProject_points(rs.getInt("project_points"));
            user.setTheory_points(rs.getInt("theory_points"));
            con.close();
            return user;
            
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("connection to db failed");
            return null;
        }
        
    }
    
    public Boolean checkUserExists(String userName) { //needs to be looked at
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            st = con.createStatement();
            rs = st.executeQuery("select * from account where username='" + userName + "'");
            
            if (rs.next()) {
                System.out.println("true");
                rs.close();
                st.close();
                con.close();
                return true;
                
            } else {
                System.out.println("false:");
                rs.close();
                st.close();
                con.close();
                return false;
            }
            
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public Account getAccount(String username) {
        LinkedList accountTokens = new LinkedList();
        boolean temp = false;
        String dateJoined = "";
        int accountId = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet accountInfo;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            st = con.createStatement();
            accountInfo = st.executeQuery("select idaccount, temp, date_joined from account where username='" + username + "'");
            if (accountInfo.next()) {
                accountId = accountInfo.getInt(1);
                temp = accountInfo.getBoolean(2);
                dateJoined = accountInfo.getString(3);
            }
            st = con.createStatement();
            accountInfo = st.executeQuery("SELECT * FROM accessToken_has_account WHERE account_idaccount='" + accountId + "'");
            while (accountInfo.next()) {
                accountTokens.add(accountInfo.getInt("accessToken_idaccessToken"));
            }
            con.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
        }
        return new Account(accountId, username, accountTokens, temp, dateJoined);
    }
    
    public String getSalt(String username) {
        String salt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            st = con.createStatement();
            rs = st.executeQuery("SELECT salt from account where username='" + username + "'");
            if (rs.next()) {
                salt = rs.getString("salt");
            }
            con.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
        }
        return salt;
    }
    
    public String getEmailbyUsername(String username) {
        String email = null;
        int userId = getAccountIdFromUsername(username);
        if (userId == 0) {
            return null;
        }
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            st = con.createStatement();
            rs = st.executeQuery("select email from user where account_idaccount='" + userId + "'");
            if (rs.next()) {
                email = rs.getString("email");
            }
            con.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return email;
    }
    
    public int getAccountIdFromUsername(String username) {
        int userId = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            st = con.createStatement();
            rs = st.executeQuery("select idaccount from account where username='" + username + "'");
            if (rs.next()) {
                userId = rs.getInt("idaccount");
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return userId;
    }
    
    public boolean createTempAccount(String username, String password, String salt, String firstName, String lastName, String email) {
        Connection con = null;
        try {
            int id = createAccount(username, password, salt, true);
            return createUser(id, username, email, firstName, lastName, null, null, null, null, null, 0, 0, true);
        } catch (Exception e) {
            System.out.println("connection to db failed");
            return false;
        }
    }
    
    public Object getUserByAccount(int accountid) {
        UserEntity userEntity = null;
        String firstname = null;
        String lastname = null;
        String email = null;
        int id = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet userResults;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            st = con.createStatement();
            userResults = st.executeQuery("select * FROM user WHERE account_idaccount='" + accountid + "'");
            if (userResults.next()) {
                firstname = userResults.getString("first_name");
                lastname = userResults.getString("last_name");
                email = userResults.getString("email");
                id = userResults.getInt("iduser");
            }
            con.close();
            userEntity = new UserEntity(id, firstname, lastname, email);
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
        }
        return userEntity;
    }
    
    public String getUsernameFromAccountId(int accountNumber) {
        String username = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            st = con.createStatement();
            rs = st.executeQuery("select username from account where idaccount='" + accountNumber + "'");
            if (rs.next()) {
                username = rs.getString("username");
                con.close();
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return username;
    }

    /**
     * Sets all points in the user entity to the database
     *
     * @param newUser
     */
    public void addPoints(UserEntity newUser) {
        int userId = getUserIdByAccountId(newUser.getAccountNo());
        setActionPointsByUserId(userId, newUser.getActionPoints());
        setActionPointsByUserId(userId, newUser.getPracticePoints());
        setActionPointsByUserId(userId, newUser.getVirtualPoints());
        setActionPointsByUserId(userId, newUser.getProjectPoints());
        setActionPointsByUserId(userId, newUser.getTheoryPoints());
    }
    
    public void setActionPointsByUserId(int userId, int actionPoints) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            PreparedStatement st;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            String update = "UPDATE user SET action_points=? WHERE iduser=?";
            st = con.prepareStatement(update);
            st.setInt(1, actionPoints);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
        }
    }
    
    public void setPracticePointsByUserId(int userId, int practicePoints) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            PreparedStatement st;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            String update = "UPDATE user SET practice_points=? WHERE iduser=?";
            st = con.prepareStatement(update);
            st.setInt(1, practicePoints);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
        }
    }
    
    public void setVirtualPointsByUserId(int userId, int virtualPoints) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            PreparedStatement st;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            String update = "UPDATE user SET virtual_points=? WHERE iduser=?";
            st = con.prepareStatement(update);
            st.setInt(1, virtualPoints);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
        }
    }
    
    public void setProjectPointsByUserId(int userId, int projectPoints) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            PreparedStatement st;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            String update = "UPDATE user SET project_points=? WHERE iduser=?";
            st = con.prepareStatement(update);
            st.setInt(1, projectPoints);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
        }
    }
    
    public void setTheoryPointsByUserId(int userId, int theoryPoints) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            PreparedStatement st;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            String update = "UPDATE user SET theory_points=? WHERE iduser=?";
            st = con.prepareStatement(update);
            st.setInt(1, theoryPoints);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
        }
    }
    
    int getUserIdByAccountId(int accountID) {
        int userId = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            st = con.createStatement();
            rs = st.executeQuery("select iduser from user where account_idaccount='" + accountID + "'");
            if (rs.next()) {
                userId = rs.getInt("iduser");
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return userId;
    }
    
    public LinkedList<Account> getAllAccounts() {
        LinkedList<Account> accountList = new LinkedList();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            st = con.createStatement();
            rs = st.executeQuery("select username from account");
            while (rs.next()) {
                String username = rs.getString("username");
                Account account = getAccount(username);
                accountList.add(account);
            }
            con.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return accountList;
    }
    
    public LinkedList<String> getAllAccessTokens() {
        LinkedList<String> accessTokens = new LinkedList();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            st = con.createStatement();
            rs = st.executeQuery("select * from accessToken");
            while (rs.next()) {
                String description = rs.getString("description");
                accessTokens.add(description);
            }
            con.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return accessTokens;
    }
    
    public void updateUser(String Id, String firstname, String lastname, String email, String gender, String university, String school, String subject, String yearOfStudy, String matric) {
        int userId = Integer.parseInt(Id);
        HashMap<String, String> updates = getAllUpdateFields(firstname, lastname, email, gender, university, school, subject, yearOfStudy, matric);
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Statement st;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            String update = "UPDATE `user` SET ";
            Set<String> keys = updates.keySet();
            String[] keyArray = keys.toArray(new String[keys.size()]);
            
            for (int i = 0; i < keyArray.length; i++) {
                update += keyArray[i] + "=?";
                if (i != keyArray.length - 1) {
                    update += ", ";
                }
            }
            update += " WHERE iduser=?";
            PreparedStatement ps = con.prepareStatement(update);
            for (int i = 0; i < keyArray.length; i++) {
                ps.setString(i, keyArray[i]);
            }
            ps.executeUpdate();
            ps.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
        }
    }
    
    private HashMap getAllUpdateFields(String firstname, String lastname, String email, String gender, String university, String school, String subject, String yearOfStudy, String matric) {
        HashMap myUpdates = new HashMap();
        if (!isNullOrEmpty(firstname)) {
            myUpdates.put("firstname", firstname);
        }
        
        if (!isNullOrEmpty(lastname)) {
            myUpdates.put("lastname", lastname);
        }
        
        if (!isNullOrEmpty(email)) {
            myUpdates.put("email", email);
        }
        
        if (!isNullOrEmpty(gender)) {
            myUpdates.put("gender", gender);
        }
        
        if (!isNullOrEmpty(university)) {
            myUpdates.put("university", university);
        }
        
        if (!isNullOrEmpty(school)) {
            myUpdates.put("school", school);
        }
        
        if (!isNullOrEmpty(subject)) {
            myUpdates.put("subject", subject);
        }
        
        if (!isNullOrEmpty(yearOfStudy)) {
            myUpdates.put("yearOfStudy", yearOfStudy);
        }
        
        if (!isNullOrEmpty(matric)) {
            myUpdates.put("matric", matric);
        }
        return myUpdates;
    }
    
    private boolean isNullOrEmpty(String string) {
        return string == null || string.equals("");
    }
    
    @SuppressWarnings("element-type-mismatch")
    public void updateAccess(int accountId, int[] tokens) throws Exception {
        LinkedList newTokens = Convertors.convertIntArrayToLinkedList(tokens);
        try {
            LinkedList<Integer> oldTokens = getAccountTokens(accountId);
            for (int i = 0; i < tokens.length; i++) {
                if (oldTokens.size() != 0 && !newTokens.contains(oldTokens.get(i))) //if the old tokens list has an element not in the new
                {
                    //remove old token;
                    removeAccessToken(accountId, oldTokens.get(i));
                }
                if (newTokens.size() != 0 && !oldTokens.contains(newTokens.get(i)))//if the new token list has an element not in the old
                {
                    //add new token
                    addAccessToken(accountId, (int) newTokens.get(i));
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }
    
    private LinkedList getAccountTokens(int accountId) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        LinkedList accountTokens = new LinkedList();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            PreparedStatement ps;
            ResultSet rs;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            String statement = "SELECT * FROM `accessToken_has_account` WHERE `account_idaccount`=?";
            ps = con.prepareStatement(statement);
            ps.setInt(1, accountId);
            rs = ps.executeQuery();
            while (rs.next()) {
                accountTokens.add(rs.getInt("accessToken_idaccessToken"));
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
            throw e;
        }
        return accountTokens;
    }
    
    private void addAccessToken(int accountId, int token) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            PreparedStatement ps;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            String statement = "INSERT INTO `accessToken_has_account` (`accessToken_idaccessToken`, `account_idaccount`) VALUES (?, ?)";
            ps = con.prepareStatement(statement);
            ps.setInt(1, token);
            ps.setInt(2, accountId);
            ps.executeUpdate();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }
    
    private void removeAccessToken(int accountId, int token) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            PreparedStatement ps;
            Connection con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", "davidkenny", "root1");
            String statement = "DELETE FROM `accessToken_has_account` WHERE `accessToken_idaccessToken`=? and`account_idaccount`=?";
            ps = con.prepareStatement(statement);
            ps.setInt(1, token);
            ps.setInt(2, accountId);
            ps.executeUpdate();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }
    
    public java.util.LinkedList<UserEntity> getLeaders() {
        java.util.LinkedList<UserEntity> userdetails = new java.util.LinkedList<>();
        
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            
            PreparedStatement ps1 = null;
            String sqlOption1 = "SELECT * FROM user order by action_points + practice_points + virtual_points + project_points + theory_points desc limit 25";
            
            ps1 = con.prepareStatement(sqlOption1);
            ResultSet rs1 = ps1.executeQuery();
            
                  if(rs1.wasNull())
    	{
            return null;
    	}
    	else
    	{
    		while(rs1.next())
    		{
                UserEntity user = new UserEntity(); 
                user.setId(rs1.getInt("iduser"));
            user.setName(rs1.getString("first_name"));
            user.setLastname(rs1.getString("last_name"));
            user.setUniversity(rs1.getString("university"));
            user.setCountry(rs1.getString("country"));
            user.setEmail(rs1.getString("email"));
            user.setSchool(rs1.getString("school"));
            user.setSubject(rs1.getString("subject"));
            user.setUniversity(rs1.getString("university"));
            user.setGender(rs1.getString("gender"));
            user.setYearOfStudy(rs1.getInt("year"));
            user.setMatric(rs1.getInt("matriculation"));
            user.setActionPoints(rs1.getInt("action_points"));
            user.setPractice_points(rs1.getInt("practice_points"));
            user.setVirtual_points(rs1.getInt("virtual_points"));
            user.setProject_points(rs1.getInt("project_points"));
            user.setTheory_points(rs1.getInt("theory_points"));
            
    	    	userdetails.add(user);   	  	
    		}
                 con.close();
                return userdetails;
        }
          
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("connection to db failed");
            return null;
        }
    }
}
