void collisions()
{
  for(int i=0; i<hazards.size();i++)
  {
    if(dist(player.position.x,player.position.y,hazards.get(i).position.x,hazards.get(i).position.y)<55)
    {
      player.destroy();
    }
    for(int g=0; g<shots.size();g++)
    {
      if(dist(shots.get(g).position.x,shots.get(g).position.y,hazards.get(i).position.x,hazards.get(i).position.y)<45)
      {
        hazards.get(i).destroy();
        shots.remove(g);
      }
    }
  }
  for(int i=0; i<shazards.size();i++)
  {
    if(dist(player.position.x,player.position.y,shazards.get(i).position.x,shazards.get(i).position.y)<35)
    {
      player.destroy();
    }
    for(int g=0; g<shots.size();g++)
    {
      if(dist(shots.get(g).position.x,shots.get(g).position.y,shazards.get(i).position.x,shazards.get(i).position.y)<25)
      {
        shazards.get(i).dead = true;
        shots.remove(g);
      }
    }
  }
}