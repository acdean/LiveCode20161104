PImage img;
boolean video;

void setup() {
  size(640, 360, P3D);
  background(0);
  colorMode(HSB, 100, 100, 100);
  textureMode(NORMAL);
}

float A = 0.05;
float B = 0.95;
float RAD = 50;
float a = random(TWO_PI);
float d = random(-.01, .01);
float px = random(-5, 5);
float py = random(-5, 5);
float a1 = random(TWO_PI);
float d1 = random(-.01, .01);
float px1 = random(-5, 5);
float py1 = random(-5, 5);

void draw() {
  if (img != null) {
    beginShape(QUAD);
    texture(img);
    vertex(0, 0, A, A);
    vertex(0, height, A, B);
    vertex(width, height, B, B);
    vertex(width, 0, B, A);
    endShape();
  }
  noFill();

  strokeWeight(1);
  stroke(frameCount % 100, 100, 100);
  a += d;
  pushMatrix();
  translate((width / 2) + (RAD * sin(a * px)), (height / 2) + (RAD * sin(a * py)), 100);
  rotateX(radians(frameCount * 5.74));
  rotateY(radians(frameCount * 2.57));
  rotateZ(radians(frameCount * 3.14));
  box(40);
  popMatrix();

  stroke((frameCount + 50) % 100, 100, 100);
  a1 += d1;
  pushMatrix();
  translate((width / 2) + (RAD * sin(a1 * px1)), (height / 2) + (RAD * sin(a1 * py1)), 100);
  rotateX(radians(frameCount * 5.1));
  rotateY(radians(frameCount * 6.3));
  rotateZ(radians(frameCount * 1.7));
  box(40);
  popMatrix();

  updatePixels();
  img = copy();

  if (video) {
    saveFrame("frame#####.png");
    if (frameCount > 500) {
      exit();
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("snaspshot####.png");
  }
}