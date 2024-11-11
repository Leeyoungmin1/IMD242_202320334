function setup() {
  createCanvas(400, 400);
  background(0);
}

function draw() {
  background(0, 0, 255 - mouseY + 90);
  strokeWeight(3);
  stroke(255, 255, 255);

  // 몸통
  fill(200, 180, 250);
  circle(200, 200, 120);

  // 더듬이
  noFill();
  arc(width / 2 + 25, height / 2 - 60, 50, 70, PI, PI + QUARTER_PI);

  // 빛구
  fill(255, 255, 0);
  circle(width / 2 + 15, height / 2 - 95, 20);

  // 지느러미
  stroke(255, 255, 255, 99);
  fill(200, 180, 250, 99.9);
  ellipse(width / 2 - 75, height / 2 + 30, 40, 20);
  ellipse(width / 2 + 75, height / 2 + 30, 40, 20);

  // 반투명 빛
  noStroke();
  fill(255, 255, 0, mouseX / 3 + 40);
  circle(width / 2 + 15, height / 2 - 95, 40);

  // 이빨
  fill(255, 255, 255);
  triangle(
    width / 2 - 7,
    height / 2 + 30,
    width / 2,
    height / 2 + 10,
    width / 2 + 7,
    height / 2 + 30
  );
  triangle(
    width / 2 - 21,
    height / 2 + 30,
    width / 2 - 14,
    height / 2 + 10,
    width / 2 - 7,
    height / 2 + 30
  );
  triangle(
    width / 2 + 7,
    height / 2 + 30,
    width / 2 + 14,
    height / 2 + 10,
    width / 2 + 21,
    height / 2 + 30
  );

  // 눈
  fill(255);
  circle(width / 2 - 20, height / 2 - 20, 40);
  circle(width / 2 + 20, height / 2 - 20, 40);

  // 눈동자 위치 변수
  let eyeLeftX = width / 2 - 20;
  let eyeLeftY = height / 2 - 20;
  let eyeRightX = width / 2 + 20;
  let eyeRightY = height / 2 - 20;

  // 눈동자 움직임
  let leftPupilX = map(mouseX, 0, width, eyeLeftX - 10, eyeLeftX + 10);
  let leftPupilY = map(mouseY, 0, height, eyeLeftY - 10, eyeLeftY + 10);
  let rightPupilX = map(mouseX, 0, width, eyeRightX - 10, eyeRightX + 10);
  let rightPupilY = map(mouseY, 0, height, eyeRightY - 10, eyeRightY + 10);

  // 눈동자 그리기
  fill(80);
  circle(leftPupilX, leftPupilY, 15);
  circle(rightPupilX, rightPupilY, 15);

  // 미역
  strokeWeight(2);
  stroke(0);
  fill(30, 170, 50);
  rect(40, 280, 30, 120, 30);
  line(55, 295, 55, 400);

  fill(30, 170, 50);
  rect(75, 340, 30, 60, 30);
  line(90, 355, 90, 400);

  // 먹이
  stroke(100, 40, 0);
  fill(200, 120, 10);
  ellipse(mouseX, mouseY, 30, 15);
  ellipse(mouseX + 20, mouseY, 10, 17);
  fill(100, 40, 0);
  circle(mouseX - 5, mouseY, 4);

  // 기포
  stroke(180, 180, 255, 80);
  noFill();
  circle(340, 60, 20);
  circle(320, 80, 10);
  circle(50, 80, 30);
  circle(100, 180, 15);
  circle(270, 290, 15);
}
