let randomSeedValue;
let r, g, b;

function setup() {
  createCanvas(800, 800);
  randomSeedValue = int(random(10000));
}

function mousePressed() {
  randomSeedValue = int(random(10000));
}

function draw() {
  randomSeed(randomSeedValue);
  background(200, 230, 255);

  for (let n = 0; n < 5; n++) {
    house(
      random(0.1 * width, 0.9 * width),
      height - random(50, 200),
      random(20, 30),
      random(50, 200)
    );
  }
}

function house(x, y, w, h) {
  push();
  h = random(200, 600);
  translate(x, height - h);
  strokeWeight(2);

  // 집 색상
  r = random(50, 150);
  g = random(50, 150);
  b = random(50, 150);
  fill(r, g, b);
  rect(0, 0, w * 5, h);

  // 창문
  let windowC = random(220, 250);
  let windowNum = 2;
  let windowSize = (w * 4) / windowNum;

  for (let n = 0; n < windowNum; n++) {
    fill(130, 180, windowC);
    rect(n * 50 + 10, 10, windowSize * 0.8, windowSize * 0.8);
    rect(
      n * 50 + 10,
      20 + windowSize * 0.8,
      windowSize * 0.8,
      windowSize * 0.8
    );
  }

  // 문
  fill(150, 100, 50);
  rect(w * 5 * 0.4, h * 0.7, w + 20, h * 0.3);

  pop();
}
