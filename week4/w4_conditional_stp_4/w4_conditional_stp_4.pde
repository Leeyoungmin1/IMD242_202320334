float x, y;
float speedX, speedY;
float rad = 25;
int count;
boolean aBoolean = false;

void mousePressed() {
  aBoolean = !aBoolean;
}

void setup() {
  size(640, 360);
  stroke(255);
  x = width * 0.5;
  y = height * 0.5;
  speedX = random(3, 8);
  if (random(1) < .5) {
    speedX *= -1;
  }
  speedY = random(3, 8);
  if (random(1) < .5) {
    speedY *= -1;
  }

  count = 0;
}

void draw() {
  background(0);

  fill(count, 0, 0);
  circle(x, y, rad * 2);

  if (aBoolean) {
    x += speedX;
    y += speedY;

    if (x > width - rad || x < rad) {
      speedX *= -1;
      count++;
    }
    if (y > height - rad || y < rad) {
      speedY *= -1;
      count++;
    }
  }
}
