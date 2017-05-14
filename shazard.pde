class sHazard
{
  PVector position, velocity, direction;
  float rotation, speed, spawnDistance, spin;
  int deadtime;
  boolean dead;
  PImage thistiki;
  
  sHazard(Player p, Hazard h, PImage i)
  {
    spawnDistance = 200;
    speed = random(4.9);
    //sets astroid spawn point
    position = new PVector(h.position.x+random(-30,30),h.position.y+random(-30,30));
    //astroids go twords the player
     rotation = atan2(p.position.x-position.x,p.position.y-position.y)*-180/PI;
     direction = PVector.fromAngle(rotation);
     velocity = PVector.mult(direction, speed);
     thistiki = i;
     //sets up spin for hazard its based off the speed and direction its going in
     spin = rotation/abs(rotation)*speed/50;
  }
  
     void update()
  {
    
    //spins tiki
    rotation = rotation+spin;
    if(!dead)
    {
   //moves hazard
   position.add(velocity);
   
  //wraps the hazard 
  if(position.x>width)
  {
    position.x=0;
  }
  else if(position.x<0)
  {
    position.x=width;
  }
  else if(position.y>height)
  {
    position.y=0;
  }
  else if(position.y<0)
  {
    position.y=height;
  }
  
  //draws enemy and puts them in thier place
   pushMatrix();
   translate(position.x, position.y);
   rotate(rotation);
   image(thistiki, -20,-20);
   popMatrix();
    }
 }
    //moves the shazard so it can be deleted later, if it is deleten during the loop it causes glitches
   void destroy()
   {
     position = new PVector(-500,-500);
     dead = true;
   }
}