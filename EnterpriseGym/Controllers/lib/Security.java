/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import static lib.Convertors.byteArrayToHexString;

/**
 *
 * @author Dave
 */
public class Security {

    /**
     * Returns a salted PBKDF2 hash of the password.
     *
     * @param password the password to hash
     * @return a salted PBKDF2 hash of the password
     * @throws java.security.NoSuchAlgorithmException
     * @throws java.security.spec.InvalidKeySpecException
     */
//    public static String createHash(String password, )
//        throws NoSuchAlgorithmException, InvalidKeySpecException
//    {
//    }
    public static byte[] generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[64];
        random.nextBytes(salt);
        return salt;
    }

//    public static String hashPassword(String password, byte[] salt) throws UnsupportedEncodingException {
//        byte[] hash = new byte[password.getBytes("UTF-8").length + salt.length]; //Salt password
//        return toSHA2(hash);
//    }

    public static String hashPassword(String password, String salt) throws UnsupportedEncodingException {
        byte[] hash = new byte[password.getBytes("UTF-8").length + salt.getBytes("UTF-8").length]; //Salt password
        return toSHA2(hash);
    }

    public static String toSHA2(byte[] convertme) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
        }
        return byteArrayToHexString(md.digest(convertme));
    }
}
