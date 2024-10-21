int randomSeed = int(random(10000));
float house = 6;
float window = 3;
float x, w, h;
float r, g, b;

void setup() {
  size(800, 800);
}

void mousePressed() {
  randomSeed = int(random(10000));
}

void draw() {
  background(200);
  x = random(0, width - w);
  w = random(100, width);
  h = random(300, height);
  r = random(0, 200);
  g = random(0, 200);
  b = random(0, 200);
  randomSeed(randomSeed);
  fill(r, g, b);
  //rect(x, height - h, w, h);
  //fill(100, 100, 255);
  for (house = 0; house < 6; house++) {
    rect(x, height - h, w, h);
  }
  for (window = 0; window < 3; window++) {
    fill(150, 200, 255);
    rect(x + w * .3 * window + w * .1, height - h + h * .1, w * .2, w * .2);
  }
  //rect(x + w * .1, height - h + h * .1, w * .2, w * .2);
  //rect(x + w * .4, height - h + h * .1, w * .2, w * .2);
  //rect(x + w * .7, height - h + h * .1, w * .2, w * .2);
  //rect(x + w * .1, height - h + h * .4 + 5, w * .2, w * .2);
  //rect(x + w * .4, height - h + h * .4 + 5, w * .2, w * .2);
  //rect(x + w * .7, height - h + h * .4 + 5, w * .2, w * .2);

  fill(220, 160, 100);
  rect(x + w * .5, height - h + h * .7, w * .2, h * .4);
}
