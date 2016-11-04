PImage img;
boolean video;
int THINGS = 5;
ArrayList<Thing> things = new ArrayList<Thing>();

void setup() {
  size(640, 360, P3D);
  background(0);
  colorMode(HSB, 100, 100, 100);
  textureMode(NORMAL);
  for (int i = 0; i < THINGS; i++) {
    things.add(new Thing());
  }
}

float A = 0.05;
float B = 0.95;
float RAD = 50;
float SZ = 40;

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
  
  for (Thing t : things) {
    t.draw();
  }

  updatePixels();
  img = copy();

  if (video) {
    saveFrame("frame#####.png");
    if (frameCount > 500) {
      exit();
    }
  }
}

class Thing {
  int c = (int)random(100);
  int dc = (int)random(-2, 2);
  float a = random(TWO_PI);
  float d = random(-.03, .03);
  float px = random(-5, 5);
  float py = random(-5, 5);
  float rot = random(TWO_PI);
  float drot = random(-.03, .03);

  void draw() {
    c = (c + dc + 100) % 100;
    stroke(c, 100, 100);
    a += d;
    pushMatrix();
    translate((width / 2) + (RAD * sin(a * px)), (height / 2) + (RAD * cos(a * py)));
    rot += drot;
    rotate(rot);
    beginShape();
    for (int i = 0; i < 10; i++) {
      float rad = SZ;
      if ((i & 1) == 0) {
        rad = .35 * SZ;
      }
      vertex(rad * cos(TWO_PI * i / 10.0), rad * sin(TWO_PI * i / 10.0));
    }
    endShape(CLOSE);
    popMatrix();
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("snaspshot####.png");
  }
}