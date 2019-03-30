Camera camera;

ParamSphere sphere = new ParamSphere(10);
ParamSphere sphere2 = new ParamSphere(7);
ParamSphere sphere3 = new ParamSphere(4);
//ParamCylinder cylinder = new ParamCylinder();
//ParamWave wave = new ParamWave();

SpaceShip ship;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();

ParamSphere_sky skybox = new ParamSphere_sky();

void setup() {
  size(1600, 800, P3D);
  //ship = new SpaceShip(loadShape("space_frigate.obj"));
  ship = new SpaceShip();
  
  skybox.tex = loadImage("space.jpg"); //https://pixabay.com/en/space-panorama-universe-fantasy-2121282/

  camera = new Camera();
}

void update() {
  for (int i = projectiles.size() - 1; i >= 0; --i) {
    Projectile p = projectiles.get(i);
    if (p.pos.mag() > 300) {
      projectiles.remove(i);
    } else {
     p.update();
    }
  }
  
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

  if (keyCode == UP) {
    //ship.MoveForward(false);
    ship.RotateUp(false);
  } else if (keyCode == DOWN) {
    //ship.MoveBackward(false);
    ship.RotateDown(false);
  } else if (keyCode == LEFT) {
    ship.RotateLeft(false);
  } else if (keyCode == RIGHT) {
    ship.RotateRight(false);
  }
}


void keyPressed() {
  if (key == 'w') {
    camera.MoveForwad(true);
  } else if (key == 's') {
    camera.MoveBackward(true);
  } else if (key == 'd') {
    camera.MoveRight(true);
  } else if (key == 'a') {
    camera.MoveLeft(true);
  }


  if (keyCode == UP) {
    //ship.MoveForward(true);
    ship.RotateUp(true);
  } else if (keyCode == DOWN) {
    //ship.MoveBackward(true);
    ship.RotateDown(true);
  } else if (keyCode == LEFT) {
    ship.RotateLeft(true);
  } else if (keyCode == RIGHT) {
    ship.RotateRight(true);
  }
  
  if (key == ' ') {
    PVector pos = ship.position.copy();
    PVector dir = ship.GetForward();
    Projectile p = new Projectile(pos, dir); 
    
    projectiles.add(p);
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    ship.MoveForward(true);
    //camera.MoveForwad(true);
  }
}

void mouseReleased() {
  if (mouseButton == RIGHT) {
    ship.MoveForward(false);
    //camera.MoveForwad(false);
  }
}

void draw() {  
  update();
  SetLights();  
  draw3D();
  drawSkybox();
}

void drawSkybox() {
 noLights();
 
 pushMatrix();
   PVector camPos = camera.eye;
   translate(camPos.x, camPos.y, camPos.z);
   scale(20, 20, 20);
   skybox.Draw();
 popMatrix();
 
 lights();
}


void SetLights() {
  lights();
  directionalLight(0, 30, 200, 0, -1, 0);
}


float s1 = ((float) random(-400, 0));
float s2 = ((float) random(0, 500));
float s3 = ((float) random(501, 1000));

void draw3D() {
    
  background(0);

 
  ship.Draw(); 
  
  //proj
  for (Projectile p : projectiles) {
   p.Draw(); 
  }
  
  //ast 1
  pushMatrix();
    translate(5, 0, 0);
    rotateZ(-millis()/s1);
    sphere.Draw();
  popMatrix();
  
  //ast 2
  pushMatrix();
    translate(-10, 0, -10);
    //rotateZ(millis()/1000.0);
    rotateZ(millis()/s2);
    sphere2.Draw();
  popMatrix();
   
  //ast 3
  pushMatrix();
    translate(-20, 0, 10);
    //rotateZ(millis()/1000.0);
    rotateZ(millis()/s3);
    sphere3.Draw();
  popMatrix();
  
  
  
}
