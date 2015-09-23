/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

/**
 *
 * @author Dave
 * @param <X>
 * @param <Y>
 * @param <Z>
 */
public class JsonHighChartConvertor<X, Y, Z> {

    private X name;
    private Y y;
    private Z z;

    public JsonHighChartConvertor(X name, Y y) {
        this.name = name;
        this.y = y;
    }

        public JsonHighChartConvertor(X name, Y y, Z z) {
        this.name = name;
        this.y = y;
        this.z = z;
    }
    
    public X item1() {
        return name;
    }

    public Y item2() {
        return y;
    }
    
    public Z item3()
    {
        return z;
    }

    public void setItem1(X x) {
        this.name = x;
    }

    public void setItem2(Y y) {
        this.y = y;
    }
    
    public void setItem3(Z z)
    {
        this.z = z;
    }
}
