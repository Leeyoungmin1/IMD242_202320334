ArrayList<Particle> particles;
Light light;
float lightRange = 60;
boolean isSpreading = false;
float spreadSpeed = 20;
float noiseOffsetX, noiseOffsetY;

void settings() {
  size(displayWidth, displayHeight); // 풀스크린
}

void setup() {
  particles = new ArrayList<Particle>();
  noiseOffsetX = random(1000);
  noiseOffsetY = random(2000);
  
  for (int i = 0; i < 100; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
  
  light = new Light(width / 2, height / 2, lightRange);
}

void draw() {
  // 잔상을 위한 반투명 배경
  fill(0, 25); 
  noStroke();
  rect(0, 0, width, height);

  // 파티클 생성 확률 증가
  if (random(1) < 0.1) {
    particles.add(new Particle(random(width), random(height)));
  }

  // ArrayList 크기에 따라 색상 변화
  int particleCount = particles.size();
  float colorFactor = map(particleCount, 0, 200, 255, 50);

  // 파티클 업데이트 및 표시
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    //색을 넣음 
    p.setColor(colorFactor);
    //
    p.update();
    p.display();

    // 빛이 지나가는 경로에서 삭제
    if (dist(p.x, p.y, light.x, light.y) < light.range) {
      particles.remove(i);
    }

    // 빛 퍼짐 효과에 따른 삭제
    if (isSpreading && dist(p.x, p.y, light.x, light.y) < light.range) {
      particles.remove(i);
    }
  }

  // 충돌 체크
  checkCollisions();

  // 빛 업데이트
  light.update(mouseX, mouseY);

  if (isSpreading) {
    light.range += spreadSpeed;
    if (light.range > 120) {
      isSpreading = false;
      light.range = lightRange;
    }
  }

  light.display(isSpreading);

  // 파티클 개수 표시
  fill(255);
  textSize(16);
  text("Particles: " + particles.size(), 10, 20);
}

void mousePressed() {
  isSpreading = true;
}

void checkCollisions() {
  for (int i = 0; i < particles.size(); i++) {
    for (int j = i + 1; j < particles.size(); j++) {
      Particle p1 = particles.get(i);
      Particle p2 = particles.get(j);
      if (dist(p1.x, p1.y, p2.x, p2.y) < (p1.size + p2.size) / 2) {
        // 충돌 후 반대 방향으로 튕김
        float angle = atan2(p2.y - p1.y, p2.x - p1.x);
        p1.xSpeed -= cos(angle) * 2;
        p1.ySpeed -= sin(angle) * 2;
        p2.xSpeed += cos(angle) * 2;
        p2.ySpeed += sin(angle) * 2;
      }
    }
  }
}

class Particle {
  float x, y;
  float xSpeed, ySpeed;
  float size;
  color col;
  float xNoise, yNoise;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.size = random(10, 25);
    this.col = color(150, 0, 255);

    // Noise 기반 움직임 초기화
    this.xNoise = random(1000);
    this.yNoise = random(2000);
  }

  void setColor(float factor) {
    //어레이 리스트에 있는 애가 여기 factor에 들어올거임 ㅇㅇ 
    float r = map(factor, 50, 255, 150, 255);
    float b = map(factor, 50, 255, 255, 150);
    this.col = color(r, 0, b);
  }

  void update() {
    // Noise를 활용한 부드러운 움직임
    x += map(noise(xNoise), 0, 1, -1.5, 1.5);
    y += map(noise(yNoise), 0, 1, -1.5, 1.5);

    // Noise 값 증가로 부드러운 이동
    xNoise += 0.01;
    yNoise += 0.01;

    // 화면 경계 반사
    if (x < 0 || x > width) xNoise = random(1000); // 방향 재설정
    if (y < 0 || y > height) yNoise = random(2000); // 방향 재설정
  }

  void display() {
    fill(col, 180);
    noStroke();
    ellipse(x, y, size, size);
  }
}

class Light {
  float x, y;
  float range;
  float prevX, prevY;

  Light(float x, float y, float range) {
    this.x = x;
    this.y = y;
    this.range = range;
    this.prevX = x;
    this.prevY = y;
  }

  void update(float newX, float newY) {
    this.prevX = this.x;
    this.prevY = this.y;
    this.x = newX;
    this.y = newY;
  }

  void display(boolean spreading) {
    noStroke();

    // 빛의 잔상 효과: 이전 위치에서 잔상이 남도록
    fill(255, 255, 255, 50); // 잔상의 투명도
    ellipse(prevX, prevY, range * 0.8, range * 0.8);

    if (spreading) {
      float pulse = abs(sin(frameCount * 0.1)); // 맥박 효과
      fill(255, 255, 255, 200 * pulse); // 투명도에 맥박 효과 반영
      ellipse(x, y, range * pulse, range * pulse);
    }
    fill(255, 255, 255, 255); // 중심 빛
    ellipse(x, y, range / 2, range / 2);
  }
}
