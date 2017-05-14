class Hazard
{
  PVector position, velocity, currVelocity, direction;
  float rotation, speed, spawnDistance, spin;
  int deadtime;
  Player player;
  boolean dead;
  
  Hazard(Player p)
  {
    dead = false;
    player = p;
    spawnDistance = 200;
    speed = random(4.9);
    //sets hazards spawn point
    position = new PVector(random(1000),random(1000));
    //this prevents the hazards from spawning on top of the player, because i'm soo nice like that
    while(dist(position.x,position.y,p.position.x,p.position.y)<spawnDistance)
    {
     position = new PVector(random(1000),random(1000));
    }
    //astroids go twords the player
     rotation = degrees(atan2(p.position.x-position.x,p.position.y-position.y));
     direction = PVector.fromAngle(rotation);
     velocity = PVector.mult(direction, speed);
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
   currVelocity = velocity;
   position.add(currVelocity);
   
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
   image(btiki,-40,-40);
   popMatrix();
    }
    else
    {
      //after beind dead for a while they return
      deadtime++;
      if(deadtime > 600)
      {
        dead = false;
        spawn();
      }
    }
 }
 
 void destroy()
 {
   //create smaller hazards of two differnt images
   shazards.add(new sHazard(player,this,stiki1));
   shazards.add(new sHazard(player,this,stiki2));
   //moves it away, it will return to the screen just later this way the total amount of hazards slowly increases
   position = new PVector(-500,-500);
   deadtime = 0;
   dead = true;
 }
 
 void spawn()
 {
    speed = random(4.9);
    position = new PVector(random(1000),random(1000));
    //this prevents the hazards from spawning on top of the player, because i'm soo nice like that
    while(dist(position.x,position.y,player.position.x,player.position.y)<spawnDistance)
    {
     position = new PVector(random(1000),random(1000)); 
    }
    //hazards go twords the player
    rotation = PVector.angleBetween(position, player.position);
    direction = PVector.fromAngle(rotation);
    velocity = PVector.mult(direction, speed);
 }
}