class Circle extends Shape {
    int x, y;
    float r1, r2;
    
    Boolean centerIsSet = false;
    Boolean isItAnEllipse = true;
    
    Circle(){}
    Circle(int x, int y){
      this.x = x;
      this.y = y;
    }
    Circle(int x, int y, int r){
      this.x = x;
      this.y = y;
      this.r1 = r;
      this.r2 = r;
    }
    
    void setCircleRadius(float val){
      r1 = val;
      r2 = val;
    }
    
    void setEllipseRadius(float val1, float val2){
      //if(val1<0){val1 = (-1.0)*val1;}
      //if(val2<0){val2 = (-1.0)*val2;}
      
      if(val1>x){
        val1 = val1-x;
      }else{
        val1 = x-val1;
      }
      
      if(val2<y){
        val2 = y-val2;  
      }else{
        val2 = val2-y;
      }
      
      r1 = val1;
      r2 = val2;
    }
    
    void Draw(){
      //stroke(shape_color_r, shape_color_g, shape_color_b);
      //fill(shape_color_r, shape_color_g, shape_color_b);
      ellipse(x, y, r1, r2);
    }
    void Log(){
     println("Circle");
    }
    
    Boolean Contains(int x, int y) {return true;}
}
