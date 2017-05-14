


class Shot
{
  //declares variables
  PVector position, velocity, acceleration, direction;
  float speed, rotation;
  int number, time, killtime;
  PImage thisshot;
  
  Shot(Player p)
  {
    time = 0;
    killtime = 70;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    direction = new PVector(0,0);
    position = p.position.copy();   
    rotation = p.rotation;
    speed = 10;
    direction = PVector.fromAngle(rotation);
    velocity = PVector.mult(direction, speed);
    //choses a random fruit to shoot
    int rand = int(random(0,4));
    if(rand == 0)
    {
      thisshot=pineapple;
    }
    else if(rand == 1)
    {
      thisshot=orange;
    }
    else if(rand == 2)
    {
      thisshot=lime;
    }
    else if(rand == 3)
    {
      thisshot=apple;
    }

  }
  
   void update()
 {
   //deletes the shot after a certain amount of time
   time++;
   if(time > killtime)
   {
     shots.remove(0);
   }
   
   position.add(velocity);
   
  //wraps the shot 
  if(position.x>1000)
  {
    position.x=0;
  }
  else if(position.x<0)
  {
    position.x=1000;
  }
  else if(position.y>1000)
  {
    position.y=0;
  }
  else if(position.y<0)
  {
    position.y=1000;
  }
  
  //puts the bullet where it belongs and draws it
   pushMatrix();
   translate(position.x, position.y);
   rotate(rotation);
   image(thisshot, -7.5,-7.5);
   popMatrix();
 }
}