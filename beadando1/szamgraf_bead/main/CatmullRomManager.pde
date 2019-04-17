class CatmullRomManager extends Shape {
  ArrayList<Base> bases = new ArrayList<Base>();
  Bezier bezier = new Bezier();
  CatmullRom catmullrom = new CatmullRom();
  
  Boolean isNew = true;
  
  void addPoint(int x, int y){
    Base to = new Base(new PVector(x, y));
    bases.add(to);  
    
    bezier.bases.add(to.getPos());
    catmullrom.bases.add(to.getPos());
  }
  
  void Draw() {    
    //stroke(255, 0, 0);
    bezier.Draw();
    //stroke(0, 0, 255);
    catmullrom.Draw();
    
    for (Base b : bases) {
     b.Draw(); 
    }
  }
  
  CatmullRomManager(){}
  void Log(){println("CatmullRom");}
  Boolean Contains(int x, int y) {return true;}
}
