class Line extends Shape  {
    int x1, x2, y1, y2;
    Boolean centerIsSet = false;
    
    Line(){}
    Line(int x1, int y1){
      this.x1 = x1;
      this.y1 = y1;
    }
    Line(int x1, int y1, int x2, int y2){
      this.x1 = x1;
      this.x2 = x2;
      this.y1 = y1;
      this.y2 = y2;
    }
    
    void Draw(){
      line(x1, y1, x2, y2);
    }
    
    void Log(){
      //System.out.println("x1: "+x1+" x2: "+x2+" y1: "+y1+" y2: "+y2);
      println("Line");
    }
    
    Boolean Contains(int x, int y) {return true;}
}
