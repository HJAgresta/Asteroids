import ddf.minim.*;

Player player;
ArrayList<Shot> shots;
ArrayList<Hazard> hazards;
ArrayList<sHazard> shazards;
int nexthazard, time, nowMills, lastMills;
PImage bg, pineapple, orange, lime, apple, bush, btiki, stiki1, stiki2, guy, menubg;
Minim minim;
AudioPlayer music;
AudioPlayer[] blup = new AudioPlayer[8]; 
AudioPlayer[] whine = new AudioPlayer[10];
Bush bush1, bush2, bush3;


//set switch statement game mode to menu
String state = "game";

void setup()
{
  //loads in music, and loops it
  minim = new Minim(this);
  music = minim.loadFile("Mirando.mp3");
  music.loop(); 
  

//load in sound effects
  blup[0] = minim.loadFile("blup/blup1.mp3");
  blup[1] = minim.loadFile("blup/blup2.mp3");
  blup[2] = minim.loadFile("blup/blup3.mp3");
  blup[3] = minim.loadFile("blup/blup4.mp3");
  blup[4] = minim.loadFile("blup/blup5.mp3");
  blup[5] = minim.loadFile("blup/blup6.mp3");
  blup[6] = minim.loadFile("blup/blup7.mp3");
  blup[7] = minim.loadFile("blup/blup8.mp3");

  //load in stuff player says
  whine[0] = minim.loadFile("whines/witchdoctor.mp3");
  whine[1] = minim.loadFile("whines/where.mp3");
  whine[2] = minim.loadFile("whines/tikikill.mp3");
  whine[3] = minim.loadFile("whines/tacobell.mp3");
  whine[4] = minim.loadFile("whines/pepto.mp3");
  whine[5] = minim.loadFile("whines/pain.mp3");
  whine[6] = minim.loadFile("whines/movinglegs.mp3");
  whine[7] = minim.loadFile("whines/fruityears.mp3");
  whine[8] = minim.loadFile("whines/digested.mp3");
  whine[9] = minim.loadFile("whines/charity.mp3");
  

  
  //load images
  bg = loadImage("background.jpg");
  pineapple = loadImage("pineapple.png");
  orange = loadImage("orange.png");
  lime = loadImage("lime.png");
  apple = loadImage("apple.png");
  bush = loadImage("bush.png");
  btiki = loadImage("btiki.png");
  stiki1 = loadImage("stiki1.png");
  stiki2 = loadImage("stiki2.png");
  guy = loadImage("guy.png");
  menubg = loadImage("menu.jpg");
  
  //creates bushes
  bush1= new Bush();
  bush2 = new Bush();
  bush3 = new Bush();
  
  //sets up world
  hazards = new ArrayList<Hazard>();
  shots = new ArrayList<Shot>();
  shazards= new ArrayList<sHazard>();
  size(1000,1000);
  player = new Player();
  nexthazard = 1200;
  time =0;
  
  nowMills = millis();
  lastMills = millis();
}

void draw()
{
  nowMills = millis()-lastMills;
  lastMills = millis();
  
  
  switch(state)
  {
    case "game":
    //destroy extra shazards, this prevents bugs later
    for(int i=0; i<shazards.size();i++)
    {
      if(shazards.get(i).dead)
      {
        shazards.remove(i);
      }
    }
    
    //calls functions that run the game
    //resets screen
    background(bg);
    
    //draws bushes
    bush1.update();
    bush2.update();
    bush3.update();
    
    //handles the player
    player.update();
    player.display();
    
    //moves the shots
    for(int i=0; i<shots.size();i++)
    {
      shots.get(i).update();
    }
    //increases time since last shot
    if(lastshot<cooldown+1)
    {
      lastshot++;
    }
    //shoots if shoot button is pressed
    if(shoot)
    {
      //if the last shot was shot longer ago than the cooldown
        if(cooldown<lastshot)
        {
          Shot shot = new Shot(player);
          shots.add(shot);
          lastshot = 0;
          int rand=int(random(0,8));
        
            blup[rand].rewind();
            blup[rand].play();
      }
    }
  
  //moves all the hazards
  for(int i=0; i<hazards.size();i++)
  {
    hazards.get(i).update();
  }
  //inceases timer to next hazard
  if(time<nexthazard+1)
  {
    time = nowMills + time;
  }
  //hazards dont die they move away, then come back
  //they gradually increase in number and the game gets harder as they do
  if(nexthazard<time)
  {
    hazards.add(new Hazard(player));
    time = 0;
    nexthazard = (int)(nexthazard*1.25); //this way they spawn in slower and slower
  }
  collisions();
  
  for(int i=0; i<shazards.size();i++)
  {
    shazards.get(i).update();
  }
  break;
  
  case "menu":
  background(bg);
  break;
  
  default:
  
  break;
  }
}