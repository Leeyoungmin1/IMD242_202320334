float x = random(90, width - 70);
float y = random(90, height - 20);
float r = random(255);
float g = random(255);
float b = random(255);
float a = random(50, 100);
float mx = random(20, 40);
float my = random(10, 60);

void setup() {
  background(0);
  size(640, 320);
  noStroke();
  textSize(64);
  textAlign(CENTER, CENTER);
  text("click", width / 2, height / 2);
}

void mousePressed() {
  x = random(90, width - 70);
  y = random(90, height - 20);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(50, 100);
  mx = random(20, 40);
  my = random(10, 60);
  background(255 - r - 100, 255 - g - 100, 255 - b - 100);
  fill(r, g, b);
  ellipse(width / 2, height - y / 2, x, y);
  fill(255);
  circle(width / 2 - 10, height - y / 2 - 30, 20);
  circle(width / 2 + 10, height - y / 2 - 30, 20);
  fill(0);
  circle(width / 2 - 10, height - y / 2 - 30, 10);
  circle(width / 2 + 10, height - y / 2 - 30, 10);
  fill(255, 90, 50);
  circle(width / 2 - 40, height - y / 2 - 10, 30);
  circle(width / 2 + 40, height - y / 2 - 10, 30);
  arc(width / 2, height - y / 2 - 5, mx, my, 0, PI, OPEN);
}

void draw() {
}
