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

    private String username;
    private LinkedList accessLevel;

    public Account(String username, LinkedList accessLevel) {
        this.username = username;
        this.accessLevel = accessLevel;
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

    public void setAccessLevel(LinkedList accessLevel) {
        this.accessLevel = accessLevel;
    }

    public boolean hasAccessLevel(int level) {
        return accessLevel.contains(level);
    }
}
