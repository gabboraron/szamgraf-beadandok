class Projectile {

  PVector pos;
  PVector dir;

  float speed = 10;

 // ParamSphere_proj sphere = new ParamSphere_proj();
  ParamCylinder cylinder = new ParamCylinder();
  
  float last_time;

  Projectile(PVector startPos, PVector direction) {
    pos = startPos;
    dir = direction;
    last_time = millis();
    //sphere.r = 0.2;
    cylinder.r = 0.2;
  }


  void update() {
    float delta_time = (millis() - last_time) / 1000.0f;
    last_time = millis();
    pos.add(dir.copy().mult(speed * delta_time));
  }

  void Draw() {    
    pushMatrix();
      translate(pos.x, pos.y, pos.z);
      //sphere.Draw();
      rotateZ(190);
      cylinder.Draw();
      rotateZ(-180);
    popMatrix();
  }
}
