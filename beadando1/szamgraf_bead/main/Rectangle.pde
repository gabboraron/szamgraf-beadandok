class Rectangle extends Shape {
    float x, y, h, w;
    
    Boolean rectStarted = false;
    
    Rectangle(){}
    Rectangle(int x, int y, int hw){
      this.x = x;
      this.y = y;
      h = hw;
      w = hw;
    }
    
    void Draw(){
       stroke(shape_color_r, shape_color_g, shape_color_b);
       fill(shape_color_r, shape_color_g, shape_color_b);
       rect(x, y, w, h);
    }
    
    void addHeight(int val){
     if(val>y){
       h=val-y;
     }else{
       h=(y-val) * (-1);
     }     
    }
    
    void addLength(int val){
      if(val>x){
        w = val - x;
      }else{
        w = (x-val)*(-1);
      }
    }
    
    void Log(){println("Rectangle");}
    
   Boolean Contains(int x, int y) {
    float dx = abs(this.x - x);
    float dy = abs(this.y - y);
    return dx < w/2 && dy < h/2;
   }
}
