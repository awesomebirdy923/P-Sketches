//Start with a new sketch that contains setup() and draw() methods. Ask your teacher if you don’t know how to do this. The suggestion under each step should help you with your program.

//1. Make a canvas of size 500x800 for you game 

Ship ship;
private int direction;
private ArrayList<Laser> lasers;
private ArrayList<Asteriod> asteriods;
private ArrayList<PowerUp> powerUps;
//private ArrayList<Laser> toRemove;
private boolean shot = false;
private boolean powerUp = false;

void onIntersection() {
  for (Asteriod a : asteriods) {
    for (Laser l : lasers) {
      if (a.getY()+a.getHeight() >= l.getY()-l.getHeight()) {
        shot = true;
        print("Hi");
        lasers.remove(l);
        break;
      } else {
        shot = false;
      }
    }
    if (shot) {
      asteriods.remove(a);
      break;
    }
  }
  for(PowerUp p : powerUps){
  for(Laser l : lasers){
        if (p.getY()+p.getHeight() >= l.getY()-l.getHeight()) {
        powerUp = true;
        print("Hi");
        lasers.remove(l);
        break;
      } else {
        powerUp = false;
      }
  }
  }
}

void detectLosers(){
for(Asteriod a : asteriods){
if(a.getY() >= 970){
  fill(200,0,0);
text("LOSER LOSER LOSER LOSER LOSER LOSER LOSER LOSER LOSER", (float) 900 / 2, (float) 900 / 2);
}
}
}
void setup() {
  lasers = new ArrayList<Laser>();
  asteriods = new ArrayList<Asteriod>();
  powerUps = new ArrayList<PowerUp>();
  asteriods.add(new Asteriod(400/2, -300, 84, 81, "asteriod.png", 2));
  //toRemove = new ArrayList<Laser>();
  size(900, 900);
  ship = new Ship(800/2, 700, 16, 22, "ship.jpg");
}// in setup method 

void draw() {
  print(lasers.size());
  background(0, 0, 0);
  ship.render();
  powerUps.add(new PowerUp(900/2, 400, 100, 100));
  ship.detectCollision();
  onIntersection();
  detectLosers();
  if (asteriods.size() == 0) {
    fill(0, 200, 0);
    //scale(200,200);
    text("YOU WINNNNNNNN", (float) 900/2, (float) 900/2);
  }
  for (Laser e : lasers) {
    e.render();
    if(powerUp){
    e.setWidth(100);
    e.setHeight(100);
    }else{
    e.setWidth(16);
    e.setHeight(22);
    }
    if (e.getY()<=0) {
      removeBullet(e);
      break;
    }
  }
  for (Asteriod e : asteriods) {
    e.render();

    for (Laser b : lasers) {
      //if(){}
    }
  }
  for(PowerUp p : powerUps){
  p.render();
  }
  if (direction == 1) {
    ship.setX(ship.getX() + 1);
  } else if (direction == 2) {
    ship.setX(ship.getX() - 1);
  }
}// in draw method 

public void removeBullet(Laser e) {
  lasers.remove(e);
}

public void removeAsteriod(Asteriod e) {
  asteriods.remove(e);
}

//2. Create a SpaceShip Class inside your sketch 
//Your SpaceShip Class will include the ship’s position at x, and position at y

//3. Create a constructor inside your SpaceShip class that initializes each variable with parameters 

//4. Create getters and setters for your SpaceShip class

//5. Copy this functionality in your SpaceShip class to display your spaceship 
//void display() 
// {
//   //fill(0,255,0);
//   //rect(Position of X , Position of Y,  50, 50);
//}

//6. Go ahead and instantiate a spaceship object at the very bottom of your canvas. 

//7. Add code to this method below to give your spaceship movement. Our spaceship currently only knows how to move left and right

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == RIGHT)
    {
      direction = 1;
    } else if (keyCode == LEFT)
    {
      direction = 2;
    } else if (keyCode == UP) {
      lasers.add(new Laser(ship.getX(), ship.getY(), 16, 22, "bullet.png", 5));
    }
  }
}

void keyReleased() {
  direction = 0;
}

//7.1 BONUS: Try changing the above method to a switch statement 

//8.  Write a method to keep your spaceship from going out of the canvas

//9. Create a Bullet class 
//Your Bullet Class will include the bullet’s position at x and y

//10 Create a constructor inside your Bullet class that initializes each variable

//11. Create setters and getters for your Bullet class 

//12. Create a move() functionality in your Bullet class that always moves your bullet’s towards the top of your canvas 

//13. Copy this functionality in your Bullet class to display your Bullet
//void display() 
// {
//    stroke(255);
//   point(x,y);


//14.  Create an arraylist of bullets 

//15. Add code to this method below to create a bullets from your spaceship’s location. You will add this check inside your keyPressed() method
//else if(keyPressed undefinedundefined key == ' ')
{//
  // //create a new bullet object
  // //add it to the arraylist
}//

//16. Create a method called moveAllBullets() that will move all bullets in your arraylist.

//17. Create a method called displayAllBullets() that will display all bullets in your arraylist. 

//18. Create a method called removeOuterBullets()  that will remove bullets from your arraylist once the bullet has pass the top of your canvas 

//19. Create an Asteroid class
//Your Asteroid class will include the position at x, position at y, speed and size

//20. Create a constructor inside your Asteroid class that initializes each variable 

//21. Create setters and getters for you Asteroid class 

//22. Create a move() functionality in your Asteroid class that always moves your asteroids towards the bottom of your canvas.

//23.. Copy this functionality in your Bullet class to display your Bullet
//void display() 
// {
//    fill(0,0,255);
//   noStroke(); 
//   rect(x, y, 50, size);
//}

//24. Create an arraylist of asteroids. 

//25. Create a method called moveAllAsteriods() that will move all asteroids in your arraylist 

//26. Create a method called displayAllAsteriods() that will display all bullets in your arraylist. 

//27.Add this code for whenever your bullet hits an asteroid. The bullet and asteroid disappears. Fill in the if statement when the two interesects. 
//void intersection()
{
  ////  for(Asteroid  a : asteroids)
  //{
  //  for(Bullet b : bullets)
  //  {
  //    //if() //insert your check here 
  //    {
  //      asteroids.remove(a);
  //      bullets.remove(b); 
  //      break;
  //    }
  //  }
  //}
}
////28. Create a win condition when there are no more asteroids you win

//29. Create a lost condition when the asteroid hits the bottom of your canvas, you lose

public class Ship {
  private int xPos;
  private int yPos;
  private int width;
  private int height;
  private String spriteName;

  public Ship(int xPos, int yPos, int width, int height, String spriteName) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.width = width;
    this.height = height;
    this.spriteName = spriteName;
  }

  public int getX() {
    return xPos;
  }
  public int getY() {
    return yPos;
  }
  public int getWidth() {
    return width;
  }
  public int getHeight() {
    return height;
  }
  public String getSpriteName() {
    return spriteName;
  }
  public void setX(int xPos) {
    this.xPos = xPos;
  }
  public void setY(int yPos) {
    this.yPos = yPos;
  }
  public void setWidth(int width) {
    this.width = width;
  }
  public void setHeight(int height) {
    this.height = height;
  }
  public void setSpriteName(String spriteName) {
    this.spriteName = spriteName;
  }
  public void render() {
    PImage photo = loadImage(getSpriteName());
    image(photo, getX(), getY(), getWidth(), getHeight());
  }
  public void detectCollision() {
    if (getX()<=-20+getWidth()) {
      setX(getX()+1);
    } else if (getX()>=870+getWidth()) {
      setX(getX()-1);
    }
  }
}

public class Laser {
  private int xPos;
  private int yPos;
  private int width;
  private int height;
  private String spriteName;
  private int speed;

  public Laser(int xPos, int yPos, int width, int height, String spriteName, int speed) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.width = width;
    this.height = height;
    this.spriteName = spriteName;
    this.speed = speed;
  }
  public int getX() {
    return xPos;
  }
  public int getY() {
    return yPos;
  }
  public int getWidth() {
    return width;
  }
  public int getHeight() {
    return height;
  }
  public String getSpriteName() {
    return spriteName;
  }
  public void setX(int xPos) {
    this.xPos = xPos;
  }
  public void setY(int yPos) {
    this.yPos = yPos;
  }
  public void setWidth(int width) {
    this.width = width;
  }
  public void setHeight(int height) {
    this.height = height;
  }
  public void setSpriteName(String spriteName) {
    this.spriteName = spriteName;
  }
  public int getSpeed() {
    return speed;
  }
  public void render() {
    PImage photo = loadImage(spriteName);
    setY(getY()-getSpeed());
    image(photo, getX(), getY(), getWidth(), getHeight());
  }
}

public class Asteriod {
  private int xPos;
  private int yPos;
  private int width;
  private int height;
  private String spriteName;
  private int speed;

  public Asteriod(int xPos, int yPos, int width, int height, String spriteName, int speed) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.width = width;
    this.height = height;
    this.spriteName = spriteName;
    this.speed = speed;
  }
  public int getX() {
    return xPos;
  }
  public int getY() {
    return yPos;
  }
  public int getWidth() {
    return width;
  }
  public int getHeight() {
    return height;
  }
  public String getSpriteName() {
    return spriteName;
  }
  public void setX(int xPos) {
    this.xPos = xPos;
  }
  public void setY(int yPos) {
    this.yPos = yPos;
  }
  public void setWidth(int width) {
    this.width = width;
  }
  public void setHeight(int height) {
    this.height = height;
  }
  public void setSpriteName(String spriteName) {
    this.spriteName = spriteName;
  }
  public int getSpeed() {
    return speed;
  }
  public void render() {
    PImage photo = loadImage(spriteName);
    setY(getY()+getSpeed());
    image(photo, getX(), getY(), getWidth(), getHeight());
  }
}

public class PowerUp{
    private int xPos;
  private int yPos;
  private int width;
  private int height;
    public PowerUp(int xPos, int yPos, int width, int height) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.width = width;
    this.height = height;
  }
 public int getX() {
    return xPos;
  }
  public int getY() {
    return yPos;
  }
  public int getWidth() {
    return width;
  }
  public int getHeight() {
    return height;
  }
  public void setX(int xPos) {
    this.xPos = xPos;
  }
  public void setY(int yPos) {
    this.yPos = yPos;
  }
  public void setWidth(int width) {
    this.width = width;
  }
  public void setHeight(int height) {
    this.height = height;
  }
  public void render() {
    ////PImage photo = loadImage(spriteName);
    //setY(getY()+getSpeed());
    //image(photo, getX(), getY(), getWidth(), getHeight());
    fill(0,0,200);
    ellipse(getX(), getY(), getWidth(), getHeight());
  }}