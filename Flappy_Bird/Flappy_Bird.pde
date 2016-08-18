
int width = 800;
int height = 800;
int x = width / 2;
int pipeX = 900;
int pipeY = -100;
int pipeYDownwards = 800;
float pipeHeight = random(700);
float pipeHeightDownwards = random(pipeHeight - 100);
int y = height / 2;
double birdYVelocity = 0;
double gravity = 0.5;
void setup() {
  size(800, 800);      //in setup method
  background(0, 160, 200);  //in draw method
}

void draw() {
  background(0, 160, 200);
  fill(200, 0, 0);    //in draw method
  ellipse(x, y, 40, 40);  //in draw method
  fill(0,200,0);
  rect(pipeX,pipeYDownwards,100,-pipeHeightDownwards);
  fill(0,200,0);
  rect(pipeX,pipeY,(int) 100,pipeHeight);
  birdYVelocity+=gravity;
  y+=birdYVelocity;
  pipeX+=-3;
  //print(pipeX + " ");
    if(intersects(x, y, pipeX, pipeY, 60)){
   fill(0,0,0);
  text("GAME OVER BOI", 800/2, 800/2);
  } else if(intersects(x, y, pipeX, pipeYDownwards, 60)){
     fill(0,0,0);
  text("GAME OVER BOI", 800/2, 800/2);
  }
  if(pipeX <= -81){
  pipeHeight = random(700);
  pipeHeightDownwards = random(700) - 100;
  pipeX = 800;
  }
}

void mousePressed(){
gravity--;
}
void mouseReleased(){
gravity++;
}

boolean intersects(int birdX, int birdY, int paddleX, int paddleY, int paddleLength) {
if (birdY > paddleY - 4 && birdX > paddleX && birdX < paddleX + paddleLength)
return true;
else 
return false;
}