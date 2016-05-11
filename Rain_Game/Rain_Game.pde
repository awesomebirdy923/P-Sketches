     import ddf.minim.*;   
  int y;
  int x = 1000/2;
  int score;    //at the very top of your sketch
  Minim minim;        //as a member variable
  AudioSample sound;      //as a member variable
void setup(){
  size(1000,600);
  minim = new Minim (this);    //in the setup method
   sound = minim.loadSample("BD.wav", 8);//in the setup method
    sound.trigger();        //in draw method (when the rain 
}
void draw(){
  background(200,0,0);
  fill(0, 0, 0);
  textSize(16);
  text("Score: " + score, 20, 20);
  y++;
  fill(200,200,200);
  rect(mouseX,400,100,100);
  fill(0,0,200); 
  ellipse(x, y, 40, 40);  //in draw method
  stroke(200);
  if(y >= 400){
  checkCatch(x);
  y = 0;
  x = (int)random(255);
  }
}
void checkCatch(int x){
if (x > mouseX && x < mouseX+100)
      score++;
   else if (score > 0)
     score--;
println("Your score is now: " + score);
}

