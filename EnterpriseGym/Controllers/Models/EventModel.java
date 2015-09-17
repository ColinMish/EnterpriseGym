/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Entities.EventEntity;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Dave
 */
public class EventModel {
    
    public EventModel()
    {
        
    }
    
    public List<EventEntity>GetAllEvents()
    {
        List<EventEntity> eventList = new LinkedList();
        return eventList;
    }
    
    public EventEntity GetEventByName(String name)
    {
        EventEntity event = new EventEntity(name, 1, null, 1, null, null);
        return event;
    }
    
    public Boolean SetNewEvent(String name, int eventType, String desciption, int points, Date date, String location)
    {
        return false;
    }
    
    public List<EventEntity>GetEventsByDate(Date dateTime)
    {
        List<EventEntity> eventList = new LinkedList();
        return eventList;
    }
    
    public List<EventEntity>GetEventsByType(String eventType)
    {
        List<EventEntity> eventList = new LinkedList();
        return eventList;
    }
    
    public List<EventEntity>GetEventsByLocation(String location)
    {
        List<EventEntity> eventList = new LinkedList();
        return eventList;
    }
}
