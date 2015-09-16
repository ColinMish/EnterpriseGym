package Entities;

import java.sql.Time;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Kim
 */
public class EventEntity {
    
    String name, description, location;
    int event_type, points_given;
    List <UserEntity> participants;
    Date date;
    Time time;
    
    public EventEntity (String name, int event_type, String description, int points_given, Date date, Time time, String location) {
        this.name = name;
        this.event_type = event_type;
        this.description = description;
        this.points_given = points_given;
        this.date = date;
        this.time = time;
        this.location = location;

    }
    
    public void setName(String new_name){
        name = new_name;
    }
    
    public String getName(){
        return name;
    }

    public void setEvent_type(int new_event_type){
        event_type = new_event_type;
    }
    
    public int getEvent_type(){
        return event_type;
    }
    
    public void setDescription(String new_description){
        description = new_description;
    }
    
    public String getDescription(){
        return description;
    }
   
    public void setPoints_given(int new_points_given){
        points_given = new_points_given;
    }
    
    public int getPoints_given(){
        return points_given;
    }
    
    public void setDate(Date new_date){
        date = new_date;
    }
    
    public Date getDate(){
        return date;
    }
    
    public void setTime(Time new_time){
        time = new_time;
    }
    
    public Time getTime(){
        return time;
    }
    
    public void setLocation(String new_location){
        location = new_location;
    }
    
    public String getLocation(){
        return location;
    }
    
    public void addParticipant(UserEntity add_to_list){
        participants.add(add_to_list);
    }
    
    /* add participant to the list */
    public void viewList(){
        
        for(int i = 0; i <= participants.size(); i++){
            System.out.println(i + ". " + participants.get(i).getName() + " " + participants.get(i).getLastame());
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
}