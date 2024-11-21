let cp;
let canvasW, canvasH;
let scale;
let cpW, cpH;

function setup() {
  canvasW = 640;
  canvasH = 480;
  createCanvas(canvasW, canvasH);

  scale = 0.1;
  cpW = canvasW * scale;
  cpH = canvasH * scale;
  cp = createCapture(VIDEO);
  cp.size(cpW, cpH);
  cp.hide();
}

function draw() {
  background(0);
  // image(cp, 0, 0, width, height);
  // console.log(cp.get(10, 10));
  //밝기 구하는 방법 = r+g+b/3 = 0~255
  //6번 = x, y
  //x = 6 % 4 = 2 > 몫을 버리고 나머지만 뱉음
  //y = 6 / 4 = 1 > 나머지를 버리고 몫만 뱉음
  //2, 4 = n번 (아마 이 방법을 쓰게 될거임)
  //y * 너비 + x = n번째
  for (let y = 0; y < cpH; y++) {
    for (let x = 0; x < cpW; x++) {
      let colour = cp.get(x, y);
      noStroke();
      let b = brightness(colour);
      let diameter = map(b, 0, 255, 0, 20);
      fill(255);
      circle(10 * x + 5, 10 * y + 5, diameter);
      // fill(colour[0], colour[1], colour[2]);
      // circle(10 * x + 5, 10 * y + 5, 10);
    }
  }
}
