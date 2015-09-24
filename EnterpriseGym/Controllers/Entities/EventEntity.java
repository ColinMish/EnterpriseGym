package Entities;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Kim
 */
public class EventEntity {
    
    String name, description, location,startdate,enddate;
    int event_type, points_given,length;
    List <UserEntity> participants;
    int id;
    
    public EventEntity (String name, int event_type, String description, int points_given, String location) 
    {
        this.name = name;
        this.event_type = event_type;
        this.description = description;
        this.points_given = points_given;
        this.location = location;

    }
    
    public EventEntity()
    {
        
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }
    
    public void setName(String new_name){
        name = new_name;
    }
    
    public String getName(){
        return name;
    }
    
    public void setID(int new_id)
    {
        id = new_id;
    }
    
    public int getID()
    {
        return id;
    }

    public void setEvent_type(int new_event_type){
        event_type = new_event_type;
    }
    
    public int getEvent_type(){
        return event_type;
    }
    
    public String getEvent_type_name(){
        String eventName = "";
        
        switch (event_type) {
            case 1:
                eventName = "Action";
                break;
            case 2:
                eventName = "Practice";
                break;
            case 3:
                eventName = "Theory";
                break;
            case 4:
                eventName = "Virtual";
                break;
            case 5:
                eventName = "Project";
                break;
            default: break;
        }
        
        return eventName;
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
            System.out.println(i + ". " + participants.get(i).getName() + " " + participants.get(i).getLastname());
        }
        
    }
    
}