/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.util.List;

/**
 *
 * @author Kim
 */
public class UserEntity {

    String name, lastname, username, email, university, status, country, password, school, subject;
    int id, matriculation_nr, year_of_study, user_type, action_points, practice_points, theory_points, virtual_points, project_points, total_points;
    String gender;
    boolean profile_complete;
    List<EventEntity> event_list;

    public UserEntity(String name, String lastname, String username, String email, String university, String country, int matriculation_nr, int year_of_study, String gender, String school, String subject) {
        this.name = name;
        this.lastname = lastname;
        this.username = username;
        this.email = email;
        this.university = university;
        this.country = country;
        this.status = status;
        this.password = password;
        this.matriculation_nr = matriculation_nr;
        this.year_of_study = year_of_study;
        this.user_type = user_type;
        this.gender = gender;
        this.subject = subject;
        this.school = school;

        action_points = 0;
        practice_points = 0;
        theory_points = 0;
        virtual_points = 0;
        project_points = 0;
        total_points = 0;

        event_list = null;
    }

    public UserEntity(int id, String firstName, String lastName, String email) 
    {
        name  = firstName;
        lastname = lastName;
        this.email = email;
        this.id = id;
    }
    
    public UserEntity()
    {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public void setName(String new_name) {
        name = new_name;
    }

    public String getName() {
        return name;
    }

    public void setLastname(String new_lastname) {
        lastname = new_lastname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setUsername(String new_username) {
        username = new_username;
    }

    public String getUsername() {
        return username;
    }

    public void setEmail(String new_email) {
        email = new_email;
    }

    public String getEmail() {
        return email;
    }

    public void setPassword(String new_password) {
        password = new_password;
    }

    public String getPassword() {
        return password;
    }

    public void setUniversity(String new_university) {
        university = new_university;
    }

    public String getUniversity() {
        return university;

    }

    public void setSchool(String new_school) {
        school = new_school;
    }

    public String getSchool() {
        return school;
    }

    public void setSubject(String new_subject) {
        subject = new_subject;
    }

    public String getSubject() {
        return subject;
    }

    public void setCountry(String new_country) {
        country = new_country;
    }

    public String getCountry() {
        return country;

    }

    public void setYearOfStudy(int new_year_of_study) {
        year_of_study = new_year_of_study;
    }

    public int getYearOfStudy() {
        return year_of_study;

    }

    public void setMatric(int new_matric) {
        matriculation_nr = new_matric;
    }

    public int getMatric() {
        return matriculation_nr;

    }

    /* Only get method as these are less likely to need changing */
    public void setGender(String new_gender) {
        gender = new_gender;
    }

    public String getGender() {
        return gender;
    }

    public int getUserType() {
        return user_type;
    }

    /* Add points */
    public void addActionPoints(int add_points) {
        action_points = action_points + add_points;
    }

    public void addPracticePoints(int add_points) {
        practice_points = practice_points + add_points;
    }

    public void addTheoryPoints(int add_points) {
        theory_points = theory_points + add_points;
    }

    public void addVirtualPoints(int add_points) {
        virtual_points = virtual_points + add_points;
    }

    public void addProjectPoints(int add_points) {
        project_points = project_points + add_points;
    }

    public void addTotalPoints(int add_points) {
        total_points = total_points + add_points;
    }


    /* Get methods for the points */
    public int getActionPoints() {
        return action_points;
    }

    public int getPracticePoints() {
        return practice_points;
    }

    public int getTheoryPoints() {
        return theory_points;
    }

    public int getVitrualPoints() {
        return virtual_points;
    }

    public int getProjectPoints() {
        return project_points;
    }

    public int getTotalPoints() {
        return action_points + practice_points + theory_points + virtual_points + project_points;
    }

    public int getProjectPercentage() {
        float ap = project_points;
        int percent = 0;
        float points = ap / 70;
        points = points * 100;
        percent = (int) points;
        if (percent > 100) {
            return 100;
        }
        return percent;
    }

    public int getActionPercentage() {
        float ap = action_points;
        int percent = 0;
        float points = ap / 70;
        points = points * 100;
        percent = (int) points;
        if (percent > 100) {
            return 100;
        }

        return percent;
    }

    public int getVirtualPercentage() {
        float ap = virtual_points;
        int percent = 0;
        float points = ap / 70;
        points = points * 100;
        percent = (int) points;
        if (percent > 100) {
            return 100;
        }
        return percent;
    }

    public int getPracticePercentage() {
        float ap = practice_points;
        int percent = 0;
        float points = ap / 70;
        points = points * 100;
        percent = (int) points;
        if (percent > 100) {
            return 100;
        }
        return percent;
    }

    public int getTheoryPercentage() {
        float ap = theory_points;
        int percent = 0;
        float points = ap / 70;
        points = points * 100;
        percent = (int) points;
        if (percent > 100) {
            return 100;
        }
        return percent;
    }

    //Set methods for the points. 
    public void setActionPoints(int new_actionpoints) {
        action_points = new_actionpoints;
    }

    public void setTheory_points(int theory_points) {
        this.theory_points = theory_points;
    }

    public void setVirtual_points(int virtual_points) {
        this.virtual_points = virtual_points;
    }

    public void setProject_points(int Project_points) {
        this.project_points = Project_points;
    }

    public void setPractice_points(int Practice_points) {
        this.practice_points = Practice_points;
    }

    public void addEvent(EventEntity add_to_list) {
        event_list.add(add_to_list);
    }

}
