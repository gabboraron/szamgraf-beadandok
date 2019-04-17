class Polygon extends Shape {
    ArrayList<Line> lines = new ArrayList<Line>();
    Line l = new Line();
    int x1, y1, x2, y2;
    Boolean fstPointAdded = false;
    
    Boolean started(){
      /*if(lines.size()>0){
        println("poly size: " + lines.size());
        return true;
      }
      println("poly size: " + lines.size());
      return false;*/
      return fstPointAdded;
    }
    
    Boolean savable(){
      if(lines.size()>2){
        return true;
      }
      return false;
    }
    
    Polygon(){}
    
    void addPoint(int x, int y){
      if(fstPointAdded){
        x2 = x;
        y2 = y;
        l = new Line(x1, y1, x2, y2);
        lines.add(l);
        x1 = x2;
        y1 = y2;
      } else {
        x1 = x;
        y1 = y;
        fstPointAdded = true;
      }
    }
    
    void Draw(){
       for(Line l : lines){
         l.Draw();
       }
    }
    
    void Log(){
     println("Polygon with " + lines.size() + " lines");
    }
    
    Boolean Contains(int x, int y) {return true;}
}
