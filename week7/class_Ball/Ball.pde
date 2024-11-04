class Ball {
  //이 부분을 클래스 필드라고 함 ,
  //클래스 이름을 대문자로 시작하는건 암묵적 규칙
  float x, y;
  float vx, vy;
  float rad;
  int colour;

  Ball(float x, float y, float speed,
    float rad, int colour) {
    //this 는 무조건 저 위쪽거임
    //앞에 _ 를 넣어서 하기도 함
    this.x = x;
    this.y = y;
    float deg = random(360);
    vx = speed * cos(radians(deg));
    vy = speed * sin(radians(deg));
    this.rad = rad;
    this.colour = colour;
  }

  void update() {
    x +=  vx;
    y += vy;
  
  //  vx *= friction;
  //  vy *= friction;
  }

  void bound() {
    if (x < rad || x > width - rad) {
      vx *= -1;
    }
    if (y < rad || y > height - rad) {
      vy *= -1;
    }
  }

  void display() {
    noStroke();
    fill(colour);
    circle(x, y, 2 * rad);
  }
}
