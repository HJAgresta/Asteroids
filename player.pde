class Player
{
  //declare variables
 PVector position, velocity, acceleration, direction;
 float speed, maxspeed, rotation, slow;
 int rand;
 
int cooldown = 800;
int lastyell = 0;
 
 Player()
 {
   //set variables to initial values for player class
   rotation = PI/2;
   position = new PVector(width/2, height/2);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   direction = new PVector(0,0);
   speed = 0.1;
   maxspeed = 5;
   slow = 0.95;
   leftkey=false;
   rightkey=false;
   upkey = false;
 }
 
 void update()
 {
   //increases cooldown
      if(lastyell<cooldown+2)
      {
       lastyell++;
      }
       //if the last yell was shot longer ago than the cooldown
      if(cooldown<lastyell)
      {
      //plays different sound effects when shots are fired, sounds need to be rewound before playing again
      rand=int(random(0,10));
      whine[rand].rewind();
      whine[rand].play();
      //sets cooldown to a random nubmer above a certain number
      cooldown = 800 + int(random(200));
      lastyell = 0;
      }
   
   
   //if the upkey is pressed velocity increases
   if(upkey)
   {
        direction = PVector.fromAngle(rotation);
        acceleration = PVector.mult(direction, speed);
        velocity.limit(maxspeed);
        velocity.add(acceleration);
   }
   else //otherwise it slows down gradualy
   {
     velocity.setMag(velocity.mag()* slow);
   }
   //if the left key is pressed it rotates counterclockwise
   if(leftkey)
   {
     rotation=rotation-0.1;
   }
   //if the right key is pressed it rotates clockwise
   if(rightkey)
   {
     rotation=rotation+0.1;
   }
   //moves the ships position
   position.add(velocity);

   //makes the ship wrap around the screen
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
}
 
 void display()
 {
   //draws ship in predetermined space
   pushMatrix();
   translate(position.x, position.y);
   rotate(rotation);
   image(guy, -15,-10);
   popMatrix();
 }
 
 void destroy()
 {
   //moves ship back to center of the screen
   position = new PVector(width/2, height/2);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   direction = new PVector(0,0);
   speed = 0.1;
 }
}