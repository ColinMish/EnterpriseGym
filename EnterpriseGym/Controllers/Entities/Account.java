/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.util.LinkedList;

/**
 *
 * @author Dave
 */
public class Account {

    private int id;
    private String username;
    private LinkedList accessLevel;
    private boolean temp;
    private int id;

    public Account(int id, String username, LinkedList accessLevel, boolean temp) {
        this.id = id;
        this.username = username;
        this.accessLevel = accessLevel;
        this.temp = temp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
        this.id= id;     
    }
    
    public boolean isTemp() {
        return temp;
    }

    public void setTemp(boolean temp) {
        this.temp = temp;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public LinkedList getAllAccessLevels() {
        return accessLevel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAccessLevel(LinkedList accessLevel) {
        this.accessLevel = accessLevel;
    }

    public boolean hasAccessLevel(int level) {
        return accessLevel.contains(level);
    }
}
