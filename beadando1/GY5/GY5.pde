ArrayList<Base> bases = new ArrayList<Base>();

Base selected = null;

Bezier bezier = new Bezier();
CatmullRom catmullrom = new CatmullRom();

void setup() {
  size(800, 600);
}

void draw() {
  update();
  background(255, 255, 255);
  
  stroke(255, 0, 0);
  bezier.Draw();
  stroke(0, 0, 255);
  catmullrom.Draw();
  
  for (Base b : bases) {
   b.Draw(); 
  }
}

void update() {  
  if (selected != null) {
   selected.Move(mouseX, mouseY); 
  }
}
void mouseReleased() {
  if (selected != null) {
    selected.deselect();
    selected = null;
  }
}
void mousePressed() {
  if (mouseButton == LEFT) {
    Base to = new Base(new PVector(mouseX, mouseY));
    bases.add(to);
    
    bezier.bases.add(to.getPos());
    catmullrom.bases.add(to.getPos());
  } else  {
    for (Base b : bases) {
     if (b.Contains(mouseX, mouseY)) {
       b.select();
       selected = b;
       break;
     }
    }
  }
}
