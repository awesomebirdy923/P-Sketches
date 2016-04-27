int x1 = 200;
int x2 = 1000;

void setup(){
size(1200, 1200);
}

void draw(){
  background(200);
  x1+=1;
  x2-=1;
for(int i = 0; i < 500; i+=10){
  noFill();
  ellipse(x1, 1200/2, i,i);
  ellipse(x2, 1200/2, i,i);
}
}
