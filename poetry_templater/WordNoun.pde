
public class WordNoun extends Word{
   public WordNoun(String _w, String _pos) {
    super(_w, _pos);
 }

 public void render(int x, int y) {
  textFont(font2, 16);
  fill(0,0,0,3);
 
  text(word, x, y);
 } 
  
}
