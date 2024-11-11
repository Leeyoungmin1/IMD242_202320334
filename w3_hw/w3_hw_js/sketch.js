let x, y, r, g, b, a, mx, my;

function setup() {
  createCanvas(640, 320);
  background(0);
  noStroke();
  textSize(64);
  textAlign(CENTER, CENTER);
  fill(255);
  text('click', width / 2, height / 2);

  // 초기값 설정
  x = random(90, width - 70);
  y = random(90, height - 20);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(50, 100);
  mx = random(20, 40);
  my = random(10, 60);
}

function mousePressed() {
  // 새로운 값 생성
  x = random(90, width - 70);
  y = random(90, height - 20);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(50, 100);
  mx = random(20, 40);
  my = random(10, 60);

  // 배경색 설정
  background(255 - r - 100, 255 - g - 100, 255 - b - 100);

  // 본체 색상
  fill(r, g, b);
  ellipse(width / 2, height - y / 2, x, y);

  // 눈 그리기
  fill(255);
  circle(width / 2 - 10, height - y / 2 - 30, 20);
  circle(width / 2 + 10, height - y / 2 - 30, 20);

  fill(0);
  circle(width / 2 - 10, height - y / 2 - 30, 10);
  circle(width / 2 + 10, height - y / 2 - 30, 10);

  // 볼 그리기
  fill(255, 90, 50);
  circle(width / 2 - 40, height - y / 2 - 10, 30);
  circle(width / 2 + 40, height - y / 2 - 10, 30);

  // 입 그리기
  fill(0);
  arc(width / 2, height - y / 2 - 5, mx, my, 0, PI, OPEN);
}

function draw() {
  // draw 함수가 비어있으므로, 지속적인 애니메이션은 없음
}
