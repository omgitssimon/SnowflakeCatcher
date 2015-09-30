Snowflake [] snowday;
int sumFlakes = 69;
int sumMove;

void setup()
{
  frameRate(800);
  background(0); 
  size(400,400);
  snowday = new Snowflake[600]; 
  for(int i = 0; i < sumFlakes; i++) {
    snowday[i] = new Snowflake(false);
  }
}

void draw()
{  
  sumMove = 0;
  for (int i = 0; i < sumFlakes; i++){
    snowday[i].erase();
    snowday[i].lookDown();
    snowday[i].move();
    snowday[i].wrap();
    snowday[i].show();
    snowday[i].checkMoving();
  }
  if (sumMove < 69) {
    sumFlakes += 1;
    snowday[sumFlakes-1] = new Snowflake(true);
  }
}

void mouseDragged()
{
  stroke(random(0,255)); 
  strokeWeight(2);
  line(pmouseX,pmouseY,mouseX,mouseY);
  strokeWeight(1);
  stroke(0);
}

class Snowflake
{
  int x;
  int y;
  boolean isMoving;
  boolean startTop;
  
  Snowflake(boolean inputstartTop)
  {
    x = (int)(Math.random()*301);
    if (inputstartTop == true) {
      y = 0;
    }
    else {
      y = (int)(Math.random()*296);
    }
    isMoving = true;
  }

  void show()
  {
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(x,y,8,8);
  }

  void lookDown()
  {
    if (y > 0 && y < 300) {
      if(get(x,y+7) != color(0)) {
        isMoving = false;
      }
      else {
        isMoving = true;
      }
    }
  }

  void erase()
  {
    fill(0);
    ellipse(x,y,10,10);
  }

  void move()
  {
    if(isMoving == true){
      y += 1;
    }
  }

  void wrap()
  {
    if(y == 296) { 
      y = 0;
      x = (int)(Math.random()*301);
    }
  }

  void checkMoving()
  {
    if(isMoving == true)
    {
      sumMove += 1;
    }
  }
}
