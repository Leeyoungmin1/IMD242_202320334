float x = random(width);
float y = random(height);
float r = random(255);
float g = random(255);
float b = random(255);
float a = random(10, 100);
float s = random(10, 50);

void setup() {
  size(1280, 720);
  background(0);
  noStroke();
  colorMode(HSB);
}

void draw() {
  x = random(width);
  y = random(height);
  r = random(127, 255);
  g = random(64, 127);
  b = random(196, 255);
  a = random(10, 255);
  s = random(10, 90);
  fill(r, g, b, a);
  circle(x, y, s);
}
