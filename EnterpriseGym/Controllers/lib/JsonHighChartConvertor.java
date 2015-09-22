/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

/**
 *
 * @author Dave
 */
public class JsonHighChartConvertor<X, Y> {

    private X name;
    private Y y;

    public JsonHighChartConvertor(X name, Y y) {
        this.name = name;
        this.y = y;
    }

    public X item1() {
        return name;
    }

    public Y item2() {
        return y;
    }

    public void setItem1(X x) {
        this.name = x;
    }

    public void setItem2(Y y) {
        this.y = y;
    }
}
