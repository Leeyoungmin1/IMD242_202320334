void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);

  //  if (mouseX >= width * 0.5) {
  //    circle(width * .5, height * .5, 100);

  //  } else {
  //    square(width * .5, height * .5, 100);
  //}
  
  //if(mouseX > width / 3 * 2) {
  //} else if(mouseX > width / 3) {
  //} else {
  //}
  
  if(mouseX < width / 3) {
    circle(width * .5, height * .5, 100);
  } else if(mouseX < width / 3 * 2) {
      square(width * .5, height * .5, 100);
  } else {
      line(width * .5 - 50, height * .5 - 50, width * .5 + 50, height * .5 + 50);

  }

  stroke(127);
  strokeWeight(4);
  line(width / 3, 0, width / 3, height);
  line(width / 3 * 2, 0, width / 3 * 2, height);
}
