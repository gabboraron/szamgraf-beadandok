import java.io.Serializable;

abstract class Shape implements Serializable {
  
  PVector position = new PVector();  
  PVector fill_color = new PVector(0, 0, 0);
  PVector stroke_color = new PVector(0, 0, 0);  
  PVector select_fill_color = new PVector(255, 0, 0);
  PVector select_stroke_color = new PVector(255, 0, 0);
  
  Boolean selected = false;
  Boolean isAColour = false;
  
  int shape_color_r;
  int shape_color_g;
  int shape_color_b;
  int shape_rotation_angle = 0;
  
  void addColor(int r, int g  , int b){
    shape_color_r = r;
    shape_color_g = g;
    shape_color_b = b;
  }
  
  int detailness = 10;
  
  abstract void Draw();
  abstract Boolean Contains(int x, int y);
  abstract void Log();
}
