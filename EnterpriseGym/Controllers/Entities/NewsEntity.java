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
public class NewsEntity {
    
    private String title;
    private String Content;
    private byte[] image;

    public NewsEntity(String tile, String Content) {
        this.title = tile;
        this.Content = Content;
        //remove after database is hooked up
        this.Content = "Lorem ipsum dolor sit amet, mauris maecenas, ac etiam sollicitudin parturient mauris id, pharetra ac aliquam, lorem purus lectus purus vestibulum quis lacus. Libero fringilla mauris conubia augue velit molestie, wisi amet ipsum lacinia quam quis facilisis. Pulvinar tellus pede sit, vel sed orci vitae ab vel nunc, sed id convallis quis cum. Sollicitudin tristique suspendisse. Lacus donec ante justo feugiat sed class, varius a, feugiat imperdiet ligula nulla. Malesuada sed porta dolore vitae a, ultricies at fringilla magna, ipsum mauris amet, egestas dolor nulla odio eget, tincidunt libero malesuada metus. Ac dapibus varius nec. Pulvinar nec lacinia dignissim ut, sed vitae, rutrum in blandit vestibulum consectetuer, amet donec non maecenas, dis quis. Eu felis ut. Ad venenatis non elit porttitor suspendisse in. Ultrices interdum pellentesque, dictum ipsum sollicitudin fusce, consequat ut." + 
"Pellentesque ac quis diam quis faucibus posuere, at morbi non etiam ipsum amet rutrum, quam aliquam nullam, donec gravida ridiculus. Platea in quis, arcu nulla accumsan sed sed nunc, quisque pede, sollicitudin turpis tincidunt sem at laoreet ac. Sed sit et maecenas inceptos mattis pellentesque, nec aenean tempus laoreet amet, sodales sollicitudin vitae orci, amet tincidunt in euismod, tempora odio velit vestibulum nunc sollicitudin. Eu molestie cras eget, dapibus convallis velit mauris cras, lacinia mauris eget praesent augue aliquam, nunc hymenaeos molestie hendrerit pede mi mauris. Curabitur mi, vitae leo vitae nunc, integer commodo, tincidunt consectetuer vestibulum ultricies. Et senectus. Lectus reprehenderit orci rhoncus vestibulum sem, volutpat conubia pellentesque vestibulum orci, at ipsum velit dolor, tincidunt sed nunc, pede tellus donec vel etiam a. Curabitur ornare sed metus ultricies a, consectetuer consequat, duis elit vestibulum vestibulum nunc, nibh nisl erat dolor deserunt vel, nisl aliquam." +
"Vel convallis magna dis nihil, ligula nec mauris dui quam mattis diam. Sit sagittis, ac nec nunc elementum. Litora at leo et tincidunt, risus mauris a penatibus phasellus cras sequi. Mauris et ut vel arcu leo, maecenas nibh felis magna tortor sollicitudin, ornare ac ornare similique quis tristique ac, ultrices sagittis proin. Sem sed quam libero praesent taciti in." +
"Maecenas nulla risus ut, vitae quam est ultrices sed est vestibulum. Bibendum pede, mauris eget consectetuer ac libero nibh cursus. Quis est mattis pede eu libero, in faucibus arcu, ut eu urna feugiat in. Porttitor cursus nonummy laoreet sollicitudin aenean curabitur, ornare consequat iaculis eget, ipsum nunc rutrum. Fugiat aliquam, morbi proin quis id ullamcorper elementum maecenas, magnis ante pede, magna ipsum, penatibus aliquam non libero curabitur qui. Sem risus adipiscing neque neque, at nec vestibulum minim cras, sodales congue a porttitor ut nullam, sed tincidunt scelerisque, porttitor lacinia. Ut vestibulum integer diam a cras euismod, magna aperiam quisque, laboriosam elementum mauris mi mi, quis velit nibh nibh. Faucibus luctus est faucibus, cursus faucibus laoreet vestibulum ac, accumsan aliquam nonummy dis libero ipsum. Tempus vivamus velit, aliquam maecenas nunc accumsan, magnam aliquam ipsum, venenatis ligula lorem, metus ultricies inceptos tincidunt convallis dolor. A at justo imperdiet suspendisse. Fusce maecenas, porttitor in interdum, felis ac tortor rhoncus sagittis nulla. Ad vel turpis vehicula, sodales sed, ipsum quis.";
    }
   
    
    
    public String getTitle() {
        return title;
    }

    public String getContent() {
        return Content;
    }

    public byte[] getImage() {
        return image;
    } 

    public void setTitle(String tile) {
        this.title = tile;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }
    
    
}
