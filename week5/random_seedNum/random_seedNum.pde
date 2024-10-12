float tileW, tileH;
int seedNum = 0;

void setup() {
  size(640, 480);
  tileW = 20;
  tileH = 40;
  stroke(0);
  //frameRate(2);
}

void mousePressed() {
  //if(seedNum == 0) {
  //  seedNum = 1;
  //} else {
  //seedNum = 0;
  //}
  seedNum = int(random(5000));
  println(seedNum);
  //loop();
}

void draw() {
  randomSeed(seedNum);
  //float x = 0;
  //while(x < width) {
  //  //밥 아저씨가 할 일.
  //  x += tileW;
  //}
  for (float y = 0; y < height; y += tileH) {
    for (float x = 0; x < width; x += tileW) {
      fill(random(255));
      rect(x, y, tileW, tileH);
    }
  }
  //noLoop();
}
