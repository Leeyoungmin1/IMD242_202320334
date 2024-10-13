//1.마우스 위치에 따라 최소 3개에서 최대 16개의 사각 타일로 채운다.
//마우스 모양 도라야키로 바꿀 예정 
int tileNum;
int randomSeed = 0;
float noiseMult = 0.1;
float greenColor;
float r, g, b;
float ra, ga, ba;



void setup() {
  size(800, 800);
}

void draw() {
  randomSeed(0);
  colorMode(HSB);
  ra = mouseX * .5 * .5;
  ga = mouseY;
  ba = mouseY * .3;
  background(ra, 150, 200);
  colorMode(RGB);
  fill(150, 220, 100);
  rect(0, height * .7, width, height * .7);
  fill(150);
  rect(width * .15, height * .57, width * .7, height * .15);
  rect(width * .2, height * .42, width * .6, height * .15);
  fill(120);
  noStroke();
  rect(width * .2, height * .51, width * .6, height * .07);
  rect(width * .15, height * .66, width * .7, height * .07);
  //int(random(1, 20 + 1));
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  //noiseMult = map(mouseY, 0, height, 0.01, 0.0005);
  noiseMult = pow(10, map(mouseY, 0, height, -1, -5));
  float noiseEt = random(0, 200);
  float tileSize = width / float(tileNum);
  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float greenColor = noise(mouseX, mouseY);
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * .5;
      float centerY = rectY + tileSize * .5;
      //float randomVal = random(1);
      float noiseVal = noise(centerX * noiseMult + frameCount * .05,
        centerY * noiseMult);
      //fill(0, 0, 0, 0);
      r = tileSize * col * .4;
      g = tileSize * .07;
      b = tileSize * row * .4;
      fill(r, g, b, 0);
      stroke(20, 60, 80);
      noStroke();
      rect(rectX, rectY, tileSize, tileSize);
      //fill(255 * randomVal);
      //fill(255 * noiseVal);
      //fill(255);
      stroke(20, 60, 80);
      noStroke();
      circle(centerX, centerY, tileSize * .8);
      fill(60, 100, 220);
      ellipse(centerX, centerY + tileSize * .17, tileSize * .27, tileSize * .4);
      //ellipse(centerX, centerY, tileSize * .4, tileSize * .45);
      ellipse(centerX, centerY - tileSize * .25, tileSize * .4, tileSize * .4);
      rect(centerX - tileSize * .15, centerY - tileSize * .13, tileSize * .3, tileSize * .28, 10);
      fill(255);
      ellipse(centerX, centerY + tileSize * .35, tileSize * .2, tileSize * .12);
      ellipse(centerX + tileSize * .11, centerY - tileSize * .25, tileSize * .2, tileSize * .25);
      stroke(0);
      ellipse(centerX + tileSize * .13, centerY - tileSize * .36, tileSize * .05, tileSize * .1);
      noStroke();
      fill(220, 10, 10);
      circle(centerX + tileSize * .21, centerY - tileSize * .31, tileSize * .065);

      rect(centerX - tileSize * .15, centerY - tileSize * .13, tileSize * .3, tileSize * .05);
      fill(220, 180, 10);
      circle(centerX + tileSize * .15, centerY - tileSize * .11, tileSize * .08);

      pushMatrix();
      translate(centerX, centerY);
      //rotate(radians(30 * randomVal));
      rotate(radians(-180 * noiseVal));
      line(0, tileSize * .5 * .8, 0, 0);
      //넌 이제부터 민들레 홀씨다!
      fill(60, 100, 220);
      stroke(20, 60, 80);
      ellipse(0, tileSize * .5 * .5 * .8, tileSize * .15, tileSize * .4);
      //fill(25, 0, 0);
      //ellipse(0, tileSize * .5 * .5 * .8, 10, 20);
      fill(255);
      circle(0, tileSize * .5 * .6, tileSize * .2);

      popMatrix();
    }
  }
}
