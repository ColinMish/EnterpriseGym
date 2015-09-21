/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

/**
 *
 * @author Dave
 */
public class QuizQuestionEntity {

    private String question;
    private int questionNumber;
    private String[] answer;
    private int correctAnswer;

    public QuizQuestionEntity(String question, int questionNumber, String[] answer, int correctAnswer) {
        this.question = question;
        this.questionNumber = questionNumber;
        this.answer = answer;
        this.correctAnswer = correctAnswer;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getQuestionNumber() {
        return questionNumber;
    }

    public void setQuestionNumber(int questionNumber) {
        this.questionNumber = questionNumber;
    }

    public String getAnswer(int number) {
        return answer[number];
    }

    public void setAnswer(String[] answer) {
        this.answer = answer;
    }

    public int getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(int correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

}
