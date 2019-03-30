class SpaceShip {
  /*
 void Draw() {
   pushMatrix();
     translate(position.x, position.y, position.z);
     rotateY(-alpha - PI);
     rotateX(PI);
     scale(0.05);
     shape(body);
   popMatrix();
  }
*/
  
  PVector position = new PVector();
  float alpha, beta;
  
  float speed = 0;
  float acceleration = 2;
  float last_time;
  
  boolean is_move_forward = false, 
          is_move_backward = false, 
          is_rotate_left = false, 
          is_rotate_right = false,
          is_rotate_up = false,
          is_rotate_down = false;
  
  SpaceShip() {
   last_time = millis();
  }
  
  
  int x = 0;
  int y = 0;
  float rotX = 90;
  float rotY = 0;
  
  void setup()
  {
    size(400, 400,P3D);
  }
  
  void Draw()
  {    
    pushMatrix();
      translate(position.x, position.y, position.z);
      
      x = (int) position.x;
      y = (int) position.y;
      //translate(width/2, height/2);
      
      rotateY(-alpha - PI);
      rotateX(-beta  - PI);
      scale(0.05);
      
      beginShape(TRIANGLE_STRIP);
        fill(0, 0, 255);
        stroke(255, 0, 0);
        strokeWeight(20);
        
        //System.out.println("x: " + x + " y: " + y);
        vertex(x, y + 44, -44);
        vertex(x, y - 44, 0);    
        vertex(x - 50, y + 44, 44);  
        
        vertex(x + 50, y + 44, 44);  
        vertex(x, y + 44, -44);
        
        vertex(x, y - 44, 0);   
        vertex(x + 50, y + 44, 44);   
        
        vertex(x - 50, y + 44, 44); 
        vertex(x, y - 44, 0);
      endShape(CLOSE);
  
    popMatrix();
  }
  
  void update() {
    float delta_time = (millis() - last_time) / 1000.0f;
    last_time = millis();
    
    
    PVector forward = GetForward();
    
    if(is_move_forward) {
      speed += delta_time * acceleration;
      if (speed > 7) {
       speed = 7; 
      }
    } 
    
    if (is_move_backward) {
      speed -= delta_time * acceleration;
      if (speed < 0) {
       speed = 0; 
      }
    } 
    
    if (is_move_backward == false && is_move_forward == false) {
      speed -= delta_time * acceleration;
      if (speed < 0) {
       speed = 0; 
      }
    }
    
    forward.mult(delta_time * speed);
    position.add(forward);
    
    if (is_rotate_left) {
     alpha -= 0.1; 
    }
    
    if (is_rotate_right) {
     alpha += 0.1; 
    }
    
    if (is_rotate_up) {
     beta -= 0.1; 
    }
    
    if (is_rotate_down) {
     beta += 0.1; 
    }
  }
   
  PVector GetForward() {
   return new PVector(cos(alpha), 0, sin(alpha)); 
  }
  
  void MoveForward(boolean b) {
   is_move_forward = b; 
  }
  
  void MoveBackward(boolean b) {
   is_move_backward = b; 
  }
  
  void RotateLeft(boolean b) {
    is_rotate_left = b;
  }
  
  void RotateRight(boolean b) {
   is_rotate_right = b; 
  }
    
  void RotateUp(boolean b) {
   is_rotate_up = b; 
  }
    
  void RotateDown(boolean b) {
   is_rotate_down = b; 
  }
}
