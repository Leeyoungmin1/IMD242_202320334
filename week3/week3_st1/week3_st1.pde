//float circleX = random(0, 640);
float sqSize = random(32, 80);
float sqThickness = random(4, 12);

void setup() {
  size(640, 480);
  background(0);
  rectMode(CENTER);
  background(0);
}

void mousePressed() {
  sqSize = random(32, 80);
  sqThickness = random(4, 12);
  //circleX = random(0, 640);
  //println(circleX);
}

//void mousePressed() {
//}

void draw() {
  frameRate(2);
  //background(0);
  sqSize = random(32, 80);
  sqThickness = random(4, 12);
  fill(255, 255, 0, 16);
  stroke(255, 64, 0, 16);
  strokeWeight(sqThickness);
  square(width * 0.5, height * 0.5, sqSize);
  //circle(circleX, height * 0.5, 50);

  //circleX +=5;

  //circleX = circleX * 1.01;
  //circleX = circleX + 5;
  //circleX +=5;

  //circleX +=1;
  //circleX++ 는 cilcleX +=1; 과 circleX = circleX + 1;과 같다

  //circle -= 1;
  //circle--;

  //circleX *=5;

  //circleX /=5;
}
