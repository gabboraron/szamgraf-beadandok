Camera camera;

ParamSphere sphere = new ParamSphere();
ParamCylinder cylinder = new ParamCylinder();
ParamWave wave = new ParamWave();

SpaceShip ship;

void setup() {
  size(1600, 800, P3D);
  ship = new SpaceShip(loadShape("space_frigate.obj"));

  camera = new Camera();
}

void update() {
 camera.update(); 
 ship.update();
}

void keyReleased() {
   if (key == 'w') {
    camera.MoveForwad(false); 
   } else if (key == 's') {
    camera.MoveBackward(false); 
   } else if (key == 'd') {
    camera.MoveRight(false); 
   } else if (key == 'a') {
    camera.MoveLeft(false); 
   }
   
  if(keyCode == UP) {
   ship.MoveForward(false); 
  } else if(keyCode == DOWN) {
   ship.MoveBackward(false); 
  } else if(keyCode == LEFT) {
   ship.RotateLeft(false);
  } else if(keyCode == RIGHT) {
   ship.RotateRight(false);
  }
}


void keyPressed() {
 if (key == 'w') {
  camera.MoveForwad(true); 
 } else if(key == 's') {
   camera.MoveBackward(true);
 } else if (key == 'd') {
  camera.MoveRight(true); 
 } else if (key == 'a') {
  camera.MoveLeft(true); 
 }
  
  
  if(keyCode == UP) {
   ship.MoveForward(true); 
  } else if(keyCode == DOWN) {
   ship.MoveBackward(true);
  } else if(keyCode == LEFT) {
   ship.RotateLeft(true);
  } else if(keyCode == RIGHT) {
   ship.RotateRight(true);
  }
}

void draw() {
  update();
  SetLights();  
  draw3D();
}

void SetLights() {
  lights();
  directionalLight(0, 30, 200, 0, -1, 0);
}

void draw3D() {
  background(0);
  
  ship.Draw();
}
