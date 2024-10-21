int randomSeed = int(random(10000));
float House = 5;
float r, g, b;

void setup() {
  size(800, 800);
}

void mousePressed() {
  randomSeed = int(random(10000));
}

void draw() {
  randomSeed(randomSeed);
  background(200, 230, 255);
  for (int n = 0; n < 5; n++) {
    house(random(0.1 * width, 0.9 * width), height - random(50, 200), random(20, 30), random(50, 200));
  }
}

void house(float x, float y, float w, float h) {
  pushStyle();
  pushMatrix();
  h = random(200, 600);
  translate(x, height - h);
  strokeWeight(2);
  //line(0, 0, 0, -h);
  r = random(50, 150);
  g = random(50, 150);
  b = random(50, 150);
  fill(r, g, b);
  rect(0, 0, w * 5, h);
  pushMatrix();
  //translate(0, -h);
  float windowC = random(220, 250);
  int windowNum = 2;
  float windowSize = w * 4 / float(windowNum);
  for (int n = 0; n < windowNum; n++) {
    //float petalRandDMult = random(0.95, 1.05);
    //float petalA = radians(-90 + n * 360 / float(windowNum));
    //pushMatrix();
    //noStroke();
    fill(130, 180, windowC);
    rect(n * 50 + 10, 10, windowSize * .8, windowSize * .8);
    rect(n * 50 + 10, 20 + windowSize * .8, windowSize * .8, windowSize * .8);

    fill(150, 100, 50);
    rect(w * 5 * .4, h * .7, w +20, h);
    //popMatrix();
  }

  popMatrix();
  popMatrix();
  popStyle();
}
