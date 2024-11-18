//위에서 아래로 점점 연한 보라색. 파티클의 색에 사용. 
int[] colours = {
  0xFF6600CC,
  0xFF6600FF,
  0xFF9933FF,
  0xFFCC99FF
};

ArrayList<DarkParticle> darkParticle;
Light light;
float lightRange = 60;
boolean isSpreading = false;
float spreadSpeed = 20;

DarkParticle[] darkness;

void setup() {
  fullScreen(); 
  //아래 화면 사이즈는 지피티에게 받은 코드로,
  //화면의 사이즈와 비율이 변해도 정상적으로 작동 하는지 확인하기 위한 임시 코드 
  //surface.setResizable(true);
  //surface.setSize(displayWidth, displayHeight);
  //fill(0);
  darkParticle = new ArrayList<DarkParticle>();
  light = new Light(width * .5, height * .5, lightRange);
  
  //darkness = new DarkParticle[100];
  for (int idx = 0; idx < 20; idx++) {
    float rad = random(5, 20);
    darkParticle.add(new DarkParticle(
    random(rad + 5, width - rad - 5),
    random(rad + 5, height - rad - 5),
    random(1,5),
    rad,
    colours[int(random(colours.length))]));
  }
}

void draw() {
  background(0);
  
  //어레이리스트 크기에 따라 색 변화 
  //어레이리스트가 커지면 어두워지고, 작아지면 밝아진다. 
  int darknessCount = darkParticle.size();
  
  float darkNoise = map(darknessCount, 0, 200, 0.1, 0.01);
  //크기가 클 수록 다크컬러는 작아지도록 함 
  float darkColour = map(darknessCount, 0, 200, 50, 255);
  
  //다크파티클의 색상을 업데이트하는 코드
  //어레이리스트의 크기에 따라 색이 변하도록 색 설정 
  for (DarkParticle dp : darkParticle) {
    dp.setColour(darkColour);
  }
  
  //다크파티클의 개수를 반영하기 위한 코드??? 
  //항상 쓰던 포문의 형식으로 작성 했지만 오류가 뜸.
  //해결이 되지 않아 지피티에게 물어본 결과 idx가 음수가 될 수 없으므로,
  //포문의 루프가 한번도 실행되지 않는 문제가 발생함. 
  //이를 해결하기 위해 0에서부터 더해지는 것이 아닌, 거꾸로 세야하므로, 
  //1씩 빼서 0이 될 때 까지 반복하게 해야함. 
  for (int idx = darkParticle.size() - 1; idx >= 0; idx--) {
    DarkParticle dp = darkParticle.get(idx);
    //넣은 색을 업데이트 함 
    dp.update();
    //업데이트한 색을 보여줌 
    dp.bound();
   
    //마우스를 따라가는 빛이 지나가는 경로의 다크파티클을 삭제하는 코드
    //지피티에게 이동경로와 겹치는 파티클을 삭제하는 코드를 물어보고, 변수명을 바꿔 사용함 
    if (dist(dp.x, dp.y, light.x, light.y) < light.range) {
      darkParticle.remove(idx); //범위 안에 있는 파티클을 어레이리스트에서 삭제함 
    } else {
      dp.display(); //아닌건 그림 
    }  
  }
  
  //파티클끼리 튕기는 함수를 불러옴 
  particleBound();
  
  
  //빛이 마우스를 따라다님 
  light.update(mouseX, mouseY);
  
  //마우스를 클릭 하면 빛이 퍼지는 코드 
  //지피티에게 마우스를 클릭하면 빛이 자연스럽게 퍼지도록 코드를 짜달라고 하였고,
  //솔직히 이 부분 아직 이해를 못 했습니다.. 
  if (isSpreading) {
    light.range += spreadSpeed;
    if (light.range > 120) {
      isSpreading = false;
      light.range = lightRange;
    }
  }
  //화면에 빛을 그림 
  light.display(isSpreading);
  
  //다크파티클의 어레이리스트를 좌측 상단에 표시하는 코드 
  fill(255);
  textSize(25);
  textAlign(LEFT, TOP);
  text("DarkParticle: " + darkParticle.size(), 20, 35);
  
  //일정 간격으로 파티클을 랜덤하게 생성하는 코드 
  //5% 확률로 파티클을 생성함 
  if (random(1) < 0.05) {
    float rad = random(5, 20);
    darkParticle.add(new DarkParticle(
    random(rad + 5, width - rad - 5),
    random(rad + 5, height - rad - 5),
    //이동속도 1~5 
    random(1,5),
    rad,
    colours[int(random(colours.length))]));
  }
}

void mousePressed() {
  isSpreading = true;
}

//다크파티클끼리 튕기도록 하는 코드 
//void particleBound 코드 전체를 지피티에게서 가져왔으며,
//함수의 이름 등을 수정하여 그대로 사용함.  
//파티클끼리 충돌 하였을 때, 속도가 변하지 않고, 겹치지 않으며, 각도만 변하도록 함. 
//다만 래퍼런스 찾기 기능과, 지피티에게 기능을 질문하여, 
//이해한 내용을 바탕으로 각주를 작성함. 
void particleBound() {
  for (int idx = 0; idx < darkParticle.size(); idx++) {
    for (int n = idx + 1; n < darkParticle.size(); n++) {
      DarkParticle p1 = darkParticle.get(idx);
      DarkParticle p2 = darkParticle.get(n);
      if (dist(p1.x, p1.y, p2.x, p2.y) < (p1.size + p2.size) * .5) {
        float angle = atan2(p2.y - p1.y, p2.x - p1.x);
        
        //충돌 방향에 따라 속도의 방향을 반대로 변경. 
        //속도는 그대로 유지 
        float overlap = (p1.size + p2.size) * .5 - dist(p1.x, p1.y, p2.x, p2.y);
        
        //충돌 후 겹치지 않도록 파티클의 위치를 조정 지피티 
        p1.x -= cos(angle) * overlap * .5;
        p1.y -= sin(angle) * overlap * .5;
        p2.x += cos(angle) * overlap * .5;
        p2.y += sin(angle) * overlap * .5;
        
        
        //
        //속도를 vx, vy로 했으면서 지피티가 적어준 코드를 가져다 쓰면서 
        //xSpeed, ySpeed로 바꿔서 적었고, 이로 인해 문제가 생김 
        //이를 vx, vy로 수정하여 문제를 해결 함. 
        //속도 방향 반대로 바꿈 
        float tempVx = p1.vx;
        float tempVy = p1.vy;
        p1.vx = p2.vx;
        p1.vy = p2.vy;
        p2.vx = tempVx;
        p2.vy = tempVy;
      }
    }
  }
}
