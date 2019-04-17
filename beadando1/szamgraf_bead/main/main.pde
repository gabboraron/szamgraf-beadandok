ArrayList<Shape> shapes = new ArrayList<Shape>();
Shape selected_shape = null;

Boolean drawmode = true;
FileOperator fileIo;

void setup() {
  size(1400, 800);
  println("    MENU\n 0-Draw mode off\n 1-line\n 2-circle\n 3-rectangle\n 4-polygon\n 5-Catmull-Rom Spline\n f-save to file \n");
  initColorPalette();
  setCurrentColor(255,0,0);
}

void draw() {
  //update();
  background(224, 224, 224);
  
  //draw the existing
  for(Shape s: shapes){
    pushMatrix();
    //set coolor to shape's colour
    stroke(s.shape_color_r, s.shape_color_g, s.shape_color_b);
    fill(s.shape_color_r, s.shape_color_g, s.shape_color_b);
    //list all
    s.Draw();
    //s.Log();
    popMatrix();
  }
  
  for(Shape c:colors){
    c.Draw();
  }
  
  stroke(currentColor.shape_color_r, currentColor.shape_color_g, currentColor.shape_color_b);
  fill(currentColor.shape_color_r, currentColor.shape_color_g, currentColor.shape_color_b);
  currentColor.Draw();
  //rect(120, 120, 115, 110); //x,y,w,h
  //println("shape size: "+shapes.size());
}

void update() {
 if (selected_shape != null) {
  selected_shape.selected = false;
  selected_shape = null;
 }  
}

//menu
int value = 0;
void keyPressed() {
  if(key == '0'){
      System.out.println("Draw mode OFF\n"); // exit from draw mode
      value = 0;
      cancelTheBeginnedShape();      //cancel if something beginned
  }
  if(key == '1'){ 
      println("Draw a line: select the start point of the line and the end point!\n");  // line
      value = 1;
  }
  if(key == '2'){ 
      println("Draw a circle: select the center point of circle, move the mouse to the radius and then press Ctrl \n OR \n Draw an ellipse: select the center point of ellipse, move the mouse to the radius and click with Lmbtn.\n");  // circle
      value = 2;
  }
  if(key == '3'){ 
      println("Draw a rectangle: select the first point of rectangle, move the mouse to the second point and then click.\n");  // rectangle
      value = 3;
  }
  if(key == '4'){ 
      println("Draw a polygon: select the first point of rectangle, move the mouse to the second point and then click, then move the cusros to the third point and then click and so on.\nSave the polygon with Ctrl, cancel with 0\n");  // polygon
      value = 4;
  }
  if(key == '5'){ 
      println("Draw a Catmull-Rom Spline: select the first point and the second and the third will give you an angle, and so on\n Save with Ctrl, Cancel with 0");  // Catmull Rom
      value = 5;
  }
  if((key == 'F') || (key == 'f')){ 
      println("Save shapes into file");  // Save shapes into file
      value = 6;
      fileIo = new FileOperator(0,shapes);
  }
  //System.out.println("key: " + key);
  
 //exit from draw modes
  if(key == CODED){
    //circle to ellipse
    if((keyCode == CONTROL) && (c.centerIsSet)){
      c.isItAnEllipse = false;
      c.setCircleRadius(sqrt((mouseX+c.x)^2+(mouseY+c.y)^2));
      shapes.add(c);
      c = new Circle();
      System.out.println("  Circle saved\n");
    }
    //Save a polygon if it is a polygon
     else if((keyCode == CONTROL) && (p.savable())){
      p = new Polygon();
      System.out.println("  Polygon finished\n");
    }
    //End a polygon if it isn't a polygon yet
    else if((keyCode == CONTROL) && (p.savable())){
      p = new Polygon();
      System.out.println("  Polygon cacelled\n");
    }
    //End a Catmull Rom
    else if(keyCode == CONTROL){
      cr = new CatmullRomManager();
      System.out.println("  CatmullRom spline saved\n");
    }
    
  }
}

ShapeTypes current;
Line l = new Line();
Circle c = new Circle();
Rectangle r = new Rectangle();
Polygon p = new Polygon();
CatmullRomManager cr = new CatmullRomManager();
void mousePressed() {
  if(value == 1){                //LINE
    if(l.centerIsSet){
      if (mouseButton == LEFT) {
        l.x2 = mouseX;
        l.y2 = mouseY;
        //println("end point added");
        l.centerIsSet = false;
        
        l.addColor(currentColor.shape_color_r,currentColor.shape_color_g,currentColor.shape_color_b);
        shapes.add(l);
        //l.Log();
        l = new Line();  
      }
    } else {
      if (mouseButton == LEFT) {
        l.x1 = mouseX;
        l.y1 = mouseY;
        l.centerIsSet = true;
        //println("start point added");
        current = ShapeTypes.Line;
      }
    }
  } else if(value == 2){        //CIRCLE
    if(c.centerIsSet){
      if (mouseButton == LEFT) {
        if(c.isItAnEllipse){
          c.setEllipseRadius(float(mouseX),float(mouseY)); 
        }else{
          c.setCircleRadius(sqrt((mouseX-c.x)^2+((-1)*mouseY-(-1)*c.y)^2));
        }
        
        c.addColor(currentColor.shape_color_r,currentColor.shape_color_g,currentColor.shape_color_b);
        shapes.add(c);
        c = new Circle();
      }
    }else{
      if (mouseButton == LEFT) {
        c.x = mouseX;
        c.y = mouseY;
        c.centerIsSet = true;
        println("circle center set");
        current = ShapeTypes.Circle;
      }
    }
  } else if(value == 3){              //RECTANGLE
    if(r.rectStarted){
      if (mouseButton == LEFT) {
        r.addHeight(mouseY);
        r.addLength(mouseX);
        //r.h = r.y-mouseY;
        //r.w = r.x-mouseX;
        
        r.addColor(currentColor.shape_color_r,currentColor.shape_color_g,currentColor.shape_color_b);
        shapes.add(r);
        r = new Rectangle();
      }
    }else{
      if (mouseButton == LEFT) {
        r.x = float(mouseX);
        r.y = float(mouseY);
        r.rectStarted = true;  
        current = ShapeTypes.Rectangle;
      }
    }
  } else if(value == 4){              //POLYGON
    if(p.started()){
      if (mouseButton == LEFT) {
        p.addPoint(mouseX,mouseY);
        //println("point addd to polygon");
        //shapes.add(p);
        //p = new Polygon();
      }
    }else{     
      if (mouseButton == LEFT) {
        p.addPoint(mouseX,mouseY);
        
        p.addColor(currentColor.shape_color_r,currentColor.shape_color_g,currentColor.shape_color_b);
        shapes.add(p);
        //println("New polygon added");
        current = ShapeTypes.Polygon;
      }
    }
  } else if(value == 5){              //Catmull
    if(cr.isNew){
      cr.addPoint(mouseX,mouseY);
      cr.isNew = false;
      
      cr.addColor(currentColor.shape_color_r,currentColor.shape_color_g,currentColor.shape_color_b);
      shapes.add(cr);
      current = ShapeTypes.CatmullRom;
    }else{
      cr.addPoint(mouseX,mouseY);
    }
  }
  if (mouseButton == RIGHT) {        //Cancel the beginned shape
    cancelTheBeginnedShape();
  }
  
  //color picker
  if (mouseButton == LEFT) {
   for (Shape c : colors) {
     if (c.Contains(mouseX, mouseY)) {
       setCurrentColor(c.shape_color_r,c.shape_color_g,c.shape_color_b);
       println("Color changed to: "+c.shape_color_r+" "+c.shape_color_g+" "+c.shape_color_b);
       break;
     }
   }
  }
}

void cancelTheBeginnedShape(){
  if(current != null){  //if this condition not exist then the Rmbtn removes the last created, act like a back    
    if(((current == ShapeTypes.Polygon) || (current == ShapeTypes.CatmullRom)) && (shapes.size() != 0)){
      /*println("Current elements: \n");
      for(Shape s : shapes){
        s.Log();
      }
      //shapes.remove(shapes.size()-1);
      println("\nsize: " + shapes.size());*/
      shapes.remove(shapes.size()-1);
      println("size after resize: " + shapes.size());
      /*println("\nshape or catmull removed\nCurrent elements: \n");
      for(Shape s : shapes){
        s.Log();
      }*/
    }
    l = new Line();
    c = new Circle();
    r = new Rectangle();
    p = new Polygon();
    cr = new CatmullRomManager();
    
    println("Shape cancelled\n");
    current = null;
  }
}

Shape currentColor = new Circle(5,110,10);
ArrayList<Shape> colors = new ArrayList<Shape>();
void initColorPalette(){
  Shape s1 = new Rectangle(0,0,10);
  s1.addColor(0,0,0);
  s1.isAColour = true;
  colors.add(s1);
  
  Shape s2 = new Rectangle(0,10,10);
  s2.addColor(255,255,255);
  s2.isAColour = true;
  colors.add(s2);
  
  Shape s = new Rectangle(0,20,10);
  s.addColor(255,0,0);
  s.isAColour = true;
  colors.add(s);
  
  Shape s3 = new Rectangle(0,30,10);
  s3.addColor(0,255,0);
  s3.isAColour = true;
  colors.add(s3);
  
  Shape s4 = new Rectangle(0,40,10);
  s4.addColor(0,0,255);
  s4.isAColour = true;
  colors.add(s4);
  
  Shape s5 = new Rectangle(0,50,10);
  s5.addColor(255,255,0);
  s5.isAColour = true;
  colors.add(s5);
  
  Shape s6 = new Rectangle(0,60,10);
  s6.addColor(0,255,255);
  s6.isAColour = true;
  colors.add(s6);
  
  Shape s7 = new Rectangle(0,70,10);
  s7.addColor(255,204,0);
  s7.isAColour = true;
  colors.add(s7);
  
  Shape s8 = new Rectangle(0,80,10);
  s8.addColor(0,242,105);
  s8.isAColour = true;
  colors.add(s8);
  
  Shape s9 = new Rectangle(0,90,10);
  s9.addColor(77,75,114);
  s9.isAColour = true;
  colors.add(s9);  
}

void setCurrentColor(int r,int g,int b){
  currentColor.addColor(r,g,b);
}
