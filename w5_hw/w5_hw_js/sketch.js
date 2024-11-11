let tileNum;
let randomSeedValue = 0;
let noiseMult = 0.1;
let greenColor;
let r, g, b;
let ra, ga, ba;

function setup() {
  createCanvas(800, 800);
}

function draw() {
  randomSeed(0);

  // 마우스 X 위치에 따라 노을 색상 조정
  colorMode(HSB);
  ra = mouseX * 0.25;
  ga = mouseY;
  ba = mouseY * 0.3;
  background(ra, 150, 200);
  colorMode(RGB);

  // 도라에몽의 공터 배경
  fill(150, 220, 100);
  rect(0, height * 0.7, width, height * 0.7);
  fill(150);
  rect(width * 0.15, height * 0.57, width * 0.7, height * 0.15);
  rect(width * 0.2, height * 0.42, width * 0.6, height * 0.15);
  fill(120);
  noStroke();
  rect(width * 0.2, height * 0.51, width * 0.6, height * 0.07);
  rect(width * 0.15, height * 0.66, width * 0.7, height * 0.07);

  // 타일 개수와 노이즈 설정
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  noiseMult = pow(10, map(mouseY, 0, height, -1, -5));
  let tileSize = width / float(tileNum);

  // 타일 그리기
  for (let row = 0; row < tileNum; row++) {
    for (let col = 0; col < tileNum; col++) {
      greenColor = noise(mouseX, mouseY);
      let rectX = tileSize * col;
      let rectY = tileSize * row;
      let centerX = rectX + tileSize * 0.5;
      let centerY = rectY + tileSize * 0.5;
      let noiseVal = noise(
        centerX * noiseMult + frameCount * 0.05,
        centerY * noiseMult
      );

      r = tileSize * col * 0.4;
      g = tileSize * 0.07;
      b = tileSize * row * 0.4;
      fill(r, g, b, 0);

      noStroke();
      rect(rectX, rectY, tileSize, tileSize);

      // 도라에몽 모양 그리기
      stroke(20, 60, 80);
      noStroke();
      circle(centerX, centerY, tileSize * 0.99);
      fill(60, 100, 220);
      ellipse(
        centerX,
        centerY + tileSize * 0.17,
        tileSize * 0.27,
        tileSize * 0.4
      );
      ellipse(
        centerX,
        centerY - tileSize * 0.25,
        tileSize * 0.4,
        tileSize * 0.4
      );
      rect(
        centerX - tileSize * 0.15,
        centerY - tileSize * 0.13,
        tileSize * 0.3,
        tileSize * 0.28,
        10
      );
      fill(255);
      ellipse(
        centerX,
        centerY + tileSize * 0.35,
        tileSize * 0.2,
        tileSize * 0.12
      );
      ellipse(
        centerX + tileSize * 0.11,
        centerY - tileSize * 0.25,
        tileSize * 0.2,
        tileSize * 0.25
      );

      // 눈
      stroke(0);
      ellipse(
        centerX + tileSize * 0.13,
        centerY - tileSize * 0.36,
        tileSize * 0.05,
        tileSize * 0.1
      );
      fill(0);
      ellipse(
        centerX + tileSize * 0.14,
        centerY - tileSize * 0.35,
        tileSize * 0.025,
        tileSize * 0.05
      );

      // 코
      noStroke();
      fill(220, 10, 10);
      circle(
        centerX + tileSize * 0.21,
        centerY - tileSize * 0.31,
        tileSize * 0.065
      );
      circle(
        centerX - tileSize * 0.2,
        centerY + tileSize * 0.2,
        tileSize * 0.065
      );

      // 목걸이
      rect(
        centerX - tileSize * 0.15,
        centerY - tileSize * 0.13,
        tileSize * 0.3,
        tileSize * 0.05
      );

      // 입술
      fill(255);
      circle(
        centerX + tileSize * 0.2,
        centerY - tileSize * 0.24,
        tileSize * 0.065
      );
      ellipse(
        centerX + tileSize * 0.145,
        centerY + tileSize * 0.06,
        tileSize * 0.05,
        tileSize * 0.2
      );

      // 방울
      fill(240, 200, 10);
      circle(
        centerX + tileSize * 0.15,
        centerY - tileSize * 0.11,
        tileSize * 0.08
      );

      // 수염과 꼬리선
      stroke(0);
      line(
        centerX - tileSize * 0.17,
        centerY + tileSize * 0.19,
        centerX - tileSize * 0.13,
        centerY + tileSize * 0.16
      );
      line(
        centerX + tileSize * 0.07,
        centerY - tileSize * 0.3,
        centerX + tileSize * 0.14,
        centerY - tileSize * 0.27
      );
      line(
        centerX + tileSize * 0.05,
        centerY - tileSize * 0.25,
        centerX + tileSize * 0.14,
        centerY - tileSize * 0.25
      );
      line(
        centerX + tileSize * 0.07,
        centerY - tileSize * 0.2,
        centerX + tileSize * 0.14,
        centerY - tileSize * 0.23
      );

      push();
      translate(centerX, centerY);
      rotate(radians(-180 * noiseVal));
      line(0, tileSize * 0.5 * 0.8, 0, 0);

      fill(60, 100, 220);
      stroke(20, 60, 80);
      ellipse(0, tileSize * 0.5 * 0.5 * 0.8, tileSize * 0.15, tileSize * 0.4);
      fill(255);
      circle(0, tileSize * 0.5 * 0.6, tileSize * 0.2);
      pop();
    }
  }

  // 도라야끼
  stroke(0);
  fill(240, 220, 140);
  circle(mouseX, mouseY, 45);
  noStroke();
  fill(150, 100, 50);
  circle(mouseX, mouseY, 32);
}
