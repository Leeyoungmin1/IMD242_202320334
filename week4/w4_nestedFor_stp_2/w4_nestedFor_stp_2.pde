float tileSize;
float spacing;

void setup() {
  size(640, 480);
  tileSize = 20;
  spacing = 40;
  rectMode(CENTER);
}

void draw() {
  background(0);
  for (int row = 0;
    row < height;
    row += spacing) {
    for (int column = 0;
      column < width;
      column += spacing) {
      int x = column;
      int y = row;
      noFill();
      stroke(255);
      square(x + spacing * .5,
        y + spacing * .5,
        spacing);
      stroke(255, 0, 0);
      square(x + spacing * .5,
        y + spacing * .5,
        tileSize);
    }
  }
}
