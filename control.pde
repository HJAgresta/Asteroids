boolean leftkey, rightkey, upkey, shoot;
int cooldown = 10;
int lastshot = 0;
      
void keyPressed()
{
  //detects if up keys have been pressed
    if(key == 'w'||key=='W')
    {
      upkey = true;
    }
    else if(key == CODED)
    {
      if(keyCode == UP)
      {
        upkey = true;
      }
    }
    
    //detects if left keys have been pressed
    if(key == 'a'||key=='A')
    {
      leftkey=true;
    }
    else if(key == CODED)
    {
      if(keyCode == LEFT)
      {
        leftkey=true;
      }
    }
    
    //detects if right keys have been pressed
    if(key == 'd'||key=='D')
    {
      rightkey=true;
    }
    else if(key == CODED)
    {
      if(keyCode == RIGHT)
      {
        rightkey=true;
      }
    }
    
    //detects if fire button has been pressed
    if(key == ' ')
    {
      shoot = true;
    }
}
   
void keyReleased()
{
  //detects if up key is not pressed
    if(key == 'w'||key=='W')
    {
      upkey = false;
    }
    else if(key == CODED)
    {
      if(keyCode == UP)
      {
        upkey = false;
      }
    }
    
    //detects if left key is not pressed
    if(key == 'a'||key=='A')
    {
      leftkey=false;
    }
    else if(key == CODED)
    {
      if(keyCode == LEFT)
      {
        leftkey=false;
      }
    }
    
    //detects if right key is not pressed
    if(key == 'd'||key=='D')
    {
      rightkey=false;
    }
    else if(key == CODED)
    {
      if(keyCode == RIGHT)
      {
        rightkey=false;
      }
    }
    
    //detects if shot key is not pressed
        if(key == ' ')
    {
      shoot = false;
    }
}