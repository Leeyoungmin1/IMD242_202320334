int[] fruitAmt = new int[5];
String[] fruitNames = {"Mango", "Strawberry", "Kiwi", "Plum", "Banana"};
int total = 0;

void setup() {
  size(1280, 720);

  for (int idx = 0; idx < fruitAmt.length; idx++) {
    fruitAmt[idx] = int(random(5, 100));
  }
}

float barWidth = 13;
float graphBegin;
float graphGap;

void draw () {
  graphBegin = width * .25;
  graphGap = width * .25 * .5;
  background(180);
  fill(0);
  rect(width * .15, height * .15, width - width * .3, height - height * .3);
  strokeWeight(barWidth);
  stroke(255);
  strokeCap(SQUARE);
  textAlign(CENTER);
  textSize(28);
  fill(255);

  for (int idx = 0; idx < fruitAmt.length; idx++) {
    float x = graphBegin + idx * graphGap;
    line(x, height * 0.5, x, height * 0.5 - fruitAmt[idx]);
    circle(x, height * .5 - fruitAmt[idx], 20);
    if (fruitNames[idx] == fruitNames[0]) {
      stroke(255);
      fill(250, 200, 50);
    }
    if (fruitNames[idx] == fruitNames[1]) {
      fill(255, 10, 10);
    }
    if (fruitNames[idx] == fruitNames[2]) {
      fill(55, 220, 10);
    }
    if (fruitNames[idx] == fruitNames[3]) {
      fill(230, 10, 100);
    }
    if (fruitNames[idx] == fruitNames[4]) {
      fill(250, 230, 50);
    }
    circle(x, height * .5 - fruitAmt[idx], 30);
    fill(255);
    text(fruitNames[idx], x, height * 0.5 + 50);
    text(fruitAmt[idx], x, height * 0.5 - fruitAmt[idx] - 26);
    
    total = fruitAmt[0] + fruitAmt[1] + fruitAmt[2] + fruitAmt[3] + fruitAmt[4];
  }
  float average = total / float(fruitAmt.length);
  text("Total Number of Fruits: " + total, width * .5, height * .5 + 130);
  text("Average Number of Fruits: " + average, width * .5, height * .5 + 160);
}
