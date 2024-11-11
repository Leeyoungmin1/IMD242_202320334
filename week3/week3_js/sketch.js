let rectX, rectY, rectW, rectH;

function setup() {
  createCanvas(640, 320);
  noStroke();
  rectX = random(width / 2);
  rectY = random(height / 2);
  rectW = random(width / 2);
  rectH = random(height / 2);
}

function mousePressed() {
  rectX = random(width / 2);
  rectY = random(height / 2);
  rectW = random(width / 2);
  rectH = random(height / 2);
}

function draw() {
  background(0);

  if (
    mouseX >= rectX &&
    mouseX <= rectX + rectW &&
    mouseY >= rectY &&
    mouseY <= rectY + rectH
  ) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }

  rect(rectX, rectY, rectW, rectH);
}
