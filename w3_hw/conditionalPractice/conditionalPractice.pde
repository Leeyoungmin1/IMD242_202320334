void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);

  stroke(255);
  strokeWeight(4);
  fill(175);
  
  if (mouseY < height / 4) {
    line(width * .5 - 40, 15, width * .5 + 40, 75);
  } else if (mouseY < height / 2) {
    square(width * .5, height * .5 - 45, 55);
  } else if (mouseY < height / 4 * 3) {
    rect(width * .5, height * .5 + 45, 100, 50, 15);
  } else {
    circle(width * .5, height - 45, 60);
  }

  stroke(127);
  line(0, height / 4, width, height / 4);
  line(0, height / 2, width, height / 2);
  line(0, height / 4 * 3, width, height / 4 * 3);
}
