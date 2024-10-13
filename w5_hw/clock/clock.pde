float a = 0;
int s, m, h;

void setup () {
  size (800, 800);
  background (0);
}

void draw () {
  fill(255);
  circle (width * .5, height * .5, 500);
  for (float a = 0; a < 61; a++) {
    pushMatrix();
    translate(width * .5, height * .5);
    rotate(radians(a * 6));
    strokeWeight(1);
    line(0, 235, 0, 250);
    popMatrix();
  }
  for (float b = 0; b < 13; b++) {
    pushMatrix();
    translate(width * .5, height * .5);
    rotate(radians(b * 30));
    strokeWeight(4);
    line(0, 220, 0, 250);
    popMatrix();
  }
  //for (float s = 0; s <= 60; s++) {
  //  pushMatrix();
  //  translate(width * .5, height * .5);
  //  rotate(radians(s * 6));
  //  line(0, -20, 0, 150);
  //  frameRate(s);
  //  popMatrix();
  //}

  h = hour();
  m = minute();
  s = second();

  float sA = radians(s * 6);
  float mA = radians(m * 6);
  float hA = radians(h % 12 * 30 + m / 2.0);

  pushMatrix();
  translate(width * .5, height * .5);
  rotate(mA);
  stroke(0);
  line(0, 0, 0, -190);
  popMatrix();

  pushMatrix();
  translate(width * .5, height * .5);
  rotate(hA);
  stroke(0);
  strokeWeight(6);
  line(0, 0, 0, -140);
  popMatrix();

  pushMatrix();
  translate(width * .5, height * .5);
  rotate(sA);
  stroke(255, 0, 0);
  strokeWeight(4);
  line(0, 40, 0, -190);
  fill(255, 0, 0);
  //circle(0, 0, 20);
  popMatrix();
  
  fill(255, 0, 0);
  circle(width * .5, height * .5, 25);
  stroke(0);
}
