//마우스를 따라다니는 빛 
class Light {
  float x, y;
  float range;
  float mX, mY;
  
  Light(float x, float y, float range) {
    this.x = x;
    this.y = y;
    this.range = range;
    this.mX = x;
    this.mY = y;
  }
  
  void update(float newX, float newY) {
    this.mX = this.x;
    this.mY = this.y;
    this.x = newX;
    this.y = newY;
  }
  
  void display(boolean spread) {
    noStroke();
    //마우스를 따라다니는 빛의 잔상이 남음. 
    fill(255, 255, 255, 50);
    ellipse(mX, mY, range * .8, range * .8);
    
    //마우스를 따라다니는 빛에 맥박이 뛰는 듯한 효과
    //아래의 이프문 전체를 지피티에게서 가져왔으며, 각주는 래퍼런스에서 찾기 기능을 통해 
    //코드의 구조를 이해하고 작성함. 
    if (spread) {
      //frameCount는 시간에 따라 증가함. 이를 sin 함수의 라디안 단위의 각도에 넣어,
      //sin 함수를 통해 주기적으로 0, -1, 1의 값을 반복하게 함. 
      //단 속도 조절을 위해 0.1을 곱하여 느리게 만듦. 
      //맥박 효과가 양수로 나타나게 하기 위해서 
      //abs(절대값)를 사용해서 값이 0과 1 사이로만 나오게 함. 
      float pulse = abs(sin(frameCount * .1));
      //해당 맥박 효과를 투명도에 적용함. 
      fill(255, 255, 255, 200 * pulse);
      ellipse(x, y, range * pulse, range * pulse);
    }
    fill(255); //마우스를 따라다니는 빛은 불투명한 흰색임 
    ellipse(x, y, range *.5, range * .5);
  }
}
