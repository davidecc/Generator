ArrayList<Ball> balls;
 
int rectWidth = 30;
int rectHeight = 30;
 
int beginPosition;
int stopPosition;
 
void setup() {
  size(400, 800);
 
  frameRate(10);
  smooth();
  noStroke();
  
  beginPosition = 0;
  stopPosition = height-rectHeight/2;
 
  balls = new ArrayList();
  for (int i=0; i<random (12, 23); i++) {
    color colorTemp = color(random(0, 255), random(0, 255), random(0, 255));
    Ball newBall = new Ball( random(0, width), random(0, height), 
      rectWidth, rectHeight, 
      beginPosition, random(100), 
      colorTemp);  
    balls.add( newBall );
  } 
 
}  
 
void draw() {
  background(255);
 
  for (int i = balls.size()-1; i >= 0; i--) { 
    Ball ball = balls.get(i);
    ball.moveThis(); 
    ball.display();
  }
 
  for (int i = balls.size()-1; i >= 0; i--) { 
    Ball ball = balls.get(i);
    if (!ball.alive) 
      balls.remove(i);
  } 
 
  println(balls.size());
  fill(0);
  text("Add balls with mouse click. Balls disappear below.", 15, 15);
} 

void mousePressed() {
 
  color colorTemp = color(random(0, 255), random(0, 255), random(0, 255));
  balls.add(new Ball( mouseX, mouseY, 
    rectWidth, rectHeight, 
    beginPosition, random(100, 200), 
    colorTemp));
}
 
class Ball {  
  
  float x;
  float y;
 
  float w;
  float h;
 
  float beginPos;
  float stopPos;
  float speedX = random(-9, 9);
  float speedY = random(-9, 9);
 
  color cBall;
 
  boolean alive = true; 
 
  float k=0;  
 
  Ball(float tempX, float tempY, 
    float tempW, float tempH, 
    float tempBegin, float tempStop, 
    color tempcBall) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    stopPos = tempStop+y;       
    cBall=tempcBall;
 
    if (abs(speedX) < .9) 
      speedX = random(1, 6);
    if (abs(speedY) < .9) 
      speedY = random(1, 6);
  } 
 
  void moveThis() {
    x = x + speedX; 
    y = y + speedY;
    if (y > stopPos) {
      y = stopPos;
      alive = false;
    }
    k+=1.5; 
  } 
 
  void display() {
    fill(cBall, 100-k);
    if (k>=100) 
      alive=false; 
    ellipse (x, y, w, h);
  } 
} 