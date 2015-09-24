/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import java.util.LinkedList;

/**
 *
 * @author Dave
 */
public class SearchResultsObject {
    private LinkedList data;
    
    public SearchResultsObject()
    {
        data = new LinkedList();
    }
    
    public void addArray(LinkedList newArray)
    {
        data.add(newArray);
    }
}
