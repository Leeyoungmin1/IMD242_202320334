class DarkParticle {
  //클래스 필드 배경에 떠다니는 보라색 파티클
  float x, y;
  //float xSpeed, ySpeed;
  float size;
  float vx, vy;
  float rad;
  int colour;
  color col;
  
  DarkParticle(float x, float y, float speed, float rad, int colour) {
    this.x = x;
    this.y = y;
    this.size = random(10, 25);
    float deg = random(360);
    vx = speed * cos(radians(deg));
    vy = speed * sin(radians(deg));
    this.rad = rad;
    this.colour = colour;
    this.col = color(colour);
  }
  
  //어레이리스트의 크기에 따라 다크파티클의 색이 변하도록 하는 코드. 
  //지피티에게 어레이리스트의 크기에 따라 정해둔 색이 바뀌도록 질문함, 어레이 리스트의 크기만 의도에 맞게 수정 함. 
  //어레이리스트에 있는 애가 여기 factor에 들어...오나...?
  void setColour(float factor) {
    if (factor > 200) {
      this.col = color(0xFF6600CC);
    } else if (factor > 150) {
      this.col = color(0xFF6600FF);
    } else if (factor > 100) {
      this.col = color(0xFF9933FF);
    } else {
      this.col = color(0xFFCC99FF);
    }
  }
  
  void updateNoise(float darkNoise) {
    float noiseX = noise(x * darkNoise, frameCount * darkNoise);
    float noiseY = noise(y * darkNoise, frameCount * darkNoise);
    x += vx + map(noiseX, 0, 1, -2, 2); // noise를 기반으로 움직임 추가
    y += vy + map(noiseY, 0, 1, -2, 2);
  }
  
  void update() {
    x += vx;
    y += vy;
  }
  
  //화면 끝에서 튕김 
  void bound() {
    if (x < rad || x > width - rad) {
      vx *= -1;
    }
    if (y < rad || y > height - rad) {
      vy *= -1;
    }
  }
  
  //파티클을 그림? 
  void display() {
    fill(col, 180);
    noStroke();
    //fill(colour);
    ellipse(x, y, size, size);
  }
}
