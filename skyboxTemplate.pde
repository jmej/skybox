import queasycam.*;

QueasyCam cam;

PImage skyBoxBack;
PImage skyBoxLeft;
PImage skyBoxRight;
PImage skyBoxBottom;
PImage skyBoxTop;
PImage skyBoxFront;

String filePrefix = "vz_sinister_ocean_";

int rotation = 0;

void setup(){
  cam = new QueasyCam(this);
  size(2000, 2000, P3D);
  skyBoxFront = loadImage(filePrefix+"front.png");
  skyBoxBack = loadImage(filePrefix+"back.png");
  skyBoxRight = loadImage(filePrefix+"right.png");
  skyBoxLeft = loadImage(filePrefix+"left.png");
  skyBoxTop = loadImage(filePrefix+"up.png");
  skyBoxBottom = loadImage(filePrefix+"down.png");
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
}

void draw(){
  background(0);
  ambientLight(200, 200, 200);
  directionalLight(200, 200, 200, -1, 1, -1);
  rotation++;
  rotation = rotation % 360;
  noStroke();

  pushMatrix();
  translate(100, 0, 0);
  fill(200,0,50);
  rotateX(radians(rotation));
  rotateY(radians(rotation));
  rotateZ(radians(rotation));
  box(20);
  popMatrix();
  
  pushMatrix();
  noLights();
  scale(500);
  skyBox(skyBoxFront, skyBoxBack, skyBoxBottom, skyBoxRight, skyBoxLeft, skyBoxTop);
  popMatrix();
  
}

void skyBox(PImage front, PImage back, PImage bottom, PImage right, PImage left, PImage top){
  
  beginShape();
  texture(front);
   // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
  endShape();
  
  beginShape();
  texture(back);
    // -Z "back" face
  vertex( 1, -1, -1, 0, 0); 
  vertex(-1, -1, -1, 1, 0); 
  vertex(-1,  1, -1, 1, 1); 
  vertex( 1,  1, -1, 0, 1); 
  endShape();
  
  beginShape();
  texture(bottom);
   // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  endShape();
  
  beginShape();
  texture(right);  
    // +X "right" face
  vertex( 1, -1,  1, 0, 0); 
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);
  endShape();
  
  beginShape();
  texture(left);
  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  endShape();
  
  beginShape();
  texture(top);
    // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);
  endShape();
}

void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(tex);

  // Given one texture and six faces, we can easily set up the uv coordinates
  // such that four of the faces tile "perfectly" along either u or v, but the other
  // two faces cannot be so aligned.  This code tiles "along" u, "around" the X/Z faces
  // and fudges the Y faces - the Y faces are arbitrarily aligned such that a
  // rotation along the X axis will put the "top" of either texture at the "top"
  // of the screen, but is not otherwised aligned with the X/Z faces. (This
  // just affects what type of symmetry is required if you need seamless
  // tiling all the way around the cube)
  
  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);

  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  endShape();
}
