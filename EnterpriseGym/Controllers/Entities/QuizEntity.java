/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.util.List;

/**
 *
 * @author Dave
 */
public class QuizEntity {
    
    private String quizTitle;
    private List<QuizQuestionEntity> questions;
    private int points;

    public QuizEntity(String quizTitle, List<QuizQuestionEntity> questions, int points) {
        this.quizTitle = quizTitle;
        this.questions = questions;
        this.points = points;
    }

    public String getQuizTitle() {
        return quizTitle;
    }

    public void setQuizTitle(String quizTitle) {
        this.quizTitle = quizTitle;
    }

    public List<QuizQuestionEntity> getQuestions() {
        return questions;
    }

    public void setQuestions(List<QuizQuestionEntity> questions) {
        this.questions = questions;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
    
    
}
