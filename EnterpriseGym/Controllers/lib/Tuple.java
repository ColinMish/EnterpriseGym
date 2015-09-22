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
public class Tuple<X, Y> {

    private X x;
    private Y y;

    public Tuple(X x, Y y) {
        this.x = x;
        this.y = y;
    }

    public X item1() {
        return x;
    }

    public Y item2() {
        return y;
    }

    public void setItem1(X x) {
        this.x = x;
    }

    public void setItem2(Y y) {
        this.y = y;
    }
}
