PImage pictureOfRecord; 
int r;

//as member variable
//    pictureOfRecord= loadImage("record.gif");   //in setup method  
//    image(pictureOfRecord, xPosition, yPosition);//in draw method


  import ddf.minim.*;     //at the very top of your sketch
  Minim minim;        //as a member variable
  AudioPlayer song;      //as a member variable  //in the setup method
//in the setup method

  void setup(){
      minim = new Minim(this);  
        song = minim.loadFile("awesomeTrack.mp3", 512);
    size(800,800);
    pictureOfRecord= loadImage("record.jpeg");
    size(pictureOfRecord.width, pictureOfRecord.height);  
    song.play();
    
  }
  void draw(){
    if(mousePressed){
    r++;
    }
     rotateImage(pictureOfRecord, r);
    image(pictureOfRecord,0,0);
  }

void rotateImage(PImage image, int amountToRotate) {
      translate(width/2, height/2);
      rotate(amountToRotate*TWO_PI/360);                              
      translate(-image.width/2, -image.height/2);
}

