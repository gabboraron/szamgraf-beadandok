class Bezier extends Curve {
  
  
  
  void Draw() {  
     
    beginShape(LINES);
    for (int index = 0; index < bases.size() - 2; index+=2) {
       
      for (int i = 0; i < detailness; i++) {
        float t1 = 1.0 / detailness * i;
        float t2 = 1.0 / detailness * (i+1);            
        
        PVector p1 = Eval(index, t1);      
        PVector p2 = Eval(index, t2);      
        
        vertex(p1.x, p1.y);
        vertex(p2.x, p2.y);
      }
    }
    endShape();
  }
  
  PVector Eval(int index, float t) {
    PVector P0 = bases.get(index);
    PVector P1 = bases.get(index+1);
    PVector P2 = bases.get(index+2);
    
    PVector A = P0.copy().mult(1-t).add(P1.copy().mult(t));
    PVector B = P1.copy().mult(1-t).add(P2.copy().mult(t));
    
    return A.copy().mult(1-t).add(B.copy().mult(t));
  }
}
